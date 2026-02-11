//
//  RateViewController.swift
//  MvcProject
//
//  Created by Софія Ярошович on 11.02.2026.
//
import UIKit
import SnapKit

class RateViewController: UIViewController {
    
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Rate"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    
    private let  getRateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Current Rate", for: .normal)
        return button
    }()
    
    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(getRateButton)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.trailing.lessThanOrEqualToSuperview().inset(20)
            make.trailing.greaterThanOrEqualToSuperview().inset(20)

        }
        getRateButton.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        getRateButton.addTarget(self, action: #selector(getRate), for: .touchUpInside)
    }
    

    
    @objc private func getRate() {
        service.fetchRate { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let rate):
                let formattedRate = String(format: "%.2f", rate.rate)
                self.titleLabel.text = "\(rate.from) → \(rate.to) = \(formattedRate)"
            case .failure(let error):
                self.titleLabel.text = "Failed loading rate: \(error)"
            }
        }
    }

}
