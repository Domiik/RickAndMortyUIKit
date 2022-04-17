//
//  RickAndMortyTableViewCell.swift
//  RickAndMortyUIKit
//
//  Created by Domiik on 15.04.2022.
//

import UIKit

class RickAndMortyTableViewCell: UITableViewCell {
    
    static var cellId = "cell"
    
    
    weak var viewModel: HeroViewModelCell? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            let url = URL(string: viewModel.image)
            self.nameLabel.text = viewModel.name
            self.raceLabel.text = viewModel.species
            self.genderLabel.text = viewModel.gender
            DispatchQueue.main.async {
                self.imageViewAva.af.setImage(withURL: url!)
            }
        }
    }
    
    lazy var imageViewAva: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension RickAndMortyTableViewCell {
    func commonInit() {
        self.prepareForLayout()
        self.setupLayout()
    }
    
    func prepareForLayout() {
        self.prepareForLayout(views: [
            self.imageViewAva,
            self.nameLabel,
            self.raceLabel,
            self.genderLabel
        ])
    }
    
    func setupLayout() {
        self.imageViewAva.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(5)
            $0.width.equalTo(130)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        self.nameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.imageViewAva.snp.trailing).offset(10)
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(50)
        }
        
        self.raceLabel.snp.makeConstraints {
            $0.leading.equalTo(self.imageViewAva.snp.trailing).offset(10)
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
        
        self.genderLabel.snp.makeConstraints {
            $0.leading.equalTo(self.imageViewAva.snp.trailing).offset(10)
            $0.top.equalTo(self.raceLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(30)
        }
    }
}

