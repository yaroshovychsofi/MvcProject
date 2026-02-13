//
//  RateViewController.swift
//  MvcProject
//
//  Created by Софія Ярошович on 11.02.2026.
//  Copyright © 2026 MVPProject. All rights reserved.
//
import UIKit
import SnapKit

class RateViewController: UIViewController {
    private let service: NetworkServiceProtocol

    private var loader = UIActivityIndicatorView(style: .medium)

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Rate"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    private let getRateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Current Rate", for: .normal)
        return button
    }()

    init(service: NetworkServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(getRateButton)
        view.addSubview(loader)

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
        getRateButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        loader.snp.makeConstraints { make in
            make.leading.equalTo(getRateButton.snp.trailing).offset(10)
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.centerY.equalTo(getRateButton.snp.centerY)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        getRateButton.addTarget(self, action: #selector(getRate), for: .touchUpInside)
    }

    @objc private func getRate() {
        getRateButton.isEnabled = false
        loader.startAnimating()
        service.fetchRate { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                self.loader.stopAnimating()
                self.getRateButton.isEnabled = true
                switch result {
                case let .success(rate):
                    let formattedRate = String(format: "%.2f", rate.rate)
                    self.titleLabel.text = "\(rate.fromCurrency) → \(rate.toCurrency) = \(formattedRate)"
                case let .failure(error):
                    self.titleLabel.text = "Failed loading rate: \(error)"
                }
            }
        }
    }
}
