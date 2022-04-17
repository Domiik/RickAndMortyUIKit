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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var raceLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var geoLocationLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
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
            self.nameLabel,
            self.raceLabel,
            self.genderLabel,
            self.statusLabel,
            self.geoLocationLabel,
            self.numberOfEpisodesLabel
        ])
    }
    
    func setupLayout() {
        self.imageViewAva.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(250)
        }
        
        self.nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.imageViewAva.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(50)
        }
        
        self.raceLabel.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
        
        self.genderLabel.snp.makeConstraints {
            $0.top.equalTo(self.raceLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
        
        self.statusLabel.snp.makeConstraints {
            $0.top.equalTo(self.genderLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
        
        self.geoLocationLabel.snp.makeConstraints {
            $0.top.equalTo(self.statusLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
        
        self.numberOfEpisodesLabel.snp.makeConstraints {
            $0.top.equalTo(self.geoLocationLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
    }
}


