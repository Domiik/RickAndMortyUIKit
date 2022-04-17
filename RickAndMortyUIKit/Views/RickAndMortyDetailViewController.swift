//
//  RickAndMortyDetailViewController.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 17.04.2022.
//

import UIKit

class RickAndMortyDetailViewController: UIViewController {
    
    var viewModel: HeroDetailViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.fetchHero { [weak self] in
            let url = URL(string: viewModel.image)
            DispatchQueue.main.async {
                self?.nameLabel.text = viewModel.name
                self?.raceLabel.text = viewModel.species
                self?.genderLabel.text = viewModel.gender
                self?.geoLocationLabel.text = viewModel.location
                self?.imageViewAva.af.setImage(withURL: url!)
                self?.statusLabel.text = viewModel.status
                self?.numberOfEpisodesLabel.text = viewModel.numberOfEpisodesLabel.description
            }
        }
    }
    
    lazy var imageViewAva: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var nameLabelDefault: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Имя героя: "
        
        return label
    }()
    
    lazy var raceLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var raceLabelDefault: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Расса: "
        
        return label
    }()
    
    lazy var genderLabelDefault: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Пол: "
        
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var statusLabelDefault: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Статус: "
        
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var geoLocationLabelDefault: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Последняя точка геолокации: "
        
        return label
    }()
    
    lazy var geoLocationLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 3
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var numberOfEpisodesLabelDefault: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Количество эпизодов: "
        
        return label
    }()

    
    lazy var numberOfEpisodesLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        commonInit()
    }
}


private extension RickAndMortyDetailViewController  {
   
    func commonInit() {
        self.prepareForLayout()
        self.setupLayout()
    }
    
    func prepareForLayout() {
        self.prepareForLayout(views: [
            self.imageViewAva,
            self.nameLabelDefault,
            self.nameLabel,
            self.raceLabelDefault,
            self.raceLabel,
            self.genderLabelDefault,
            self.genderLabel,
            self.statusLabelDefault,
            self.statusLabel,
            self.geoLocationLabelDefault,
            self.geoLocationLabel,
            self.numberOfEpisodesLabelDefault,
            self.numberOfEpisodesLabel
        ])
    }
    
    func setupLayout() {
        self.imageViewAva.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(150)
        }
        
        self.nameLabelDefault.snp.makeConstraints {
            $0.top.equalTo(self.imageViewAva.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalTo(self.nameLabel.snp.leading).offset(-5)
            $0.height.equalTo(50)
        }
        
        self.nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.imageViewAva.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(50)
        }
        
        self.raceLabelDefault.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalTo(self.raceLabel.snp.leading).offset(-5)
            $0.height.equalTo(30)
        }
        
        self.raceLabel.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
        
        self.genderLabelDefault.snp.makeConstraints {
            $0.top.equalTo(self.raceLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalTo(self.genderLabel.snp.leading).offset(-5)
            $0.height.equalTo(30)
        }
        
        self.genderLabel.snp.makeConstraints {
            $0.top.equalTo(self.raceLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
        
        self.statusLabelDefault.snp.makeConstraints {
            $0.top.equalTo(self.genderLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalTo(self.statusLabel.snp.leading).offset(-5)
            $0.height.equalTo(30)
        }
        
        self.statusLabel.snp.makeConstraints {
            $0.top.equalTo(self.genderLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
        
        self.numberOfEpisodesLabelDefault.snp.makeConstraints {
            $0.top.equalTo(self.statusLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalTo(self.numberOfEpisodesLabel.snp.leading).offset(-5)
            $0.height.equalTo(20)
        }
        
        self.numberOfEpisodesLabel.snp.makeConstraints {
            $0.top.equalTo(self.statusLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(20)
        }
        
        self.geoLocationLabelDefault.snp.makeConstraints {
            $0.top.equalTo(self.numberOfEpisodesLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalTo(self.geoLocationLabel.snp.leading).offset(-5)
            $0.height.equalTo(50)
        }
        
        self.geoLocationLabel.snp.makeConstraints {
            $0.top.equalTo(self.numberOfEpisodesLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(50)
        }
        
        
    }
}


