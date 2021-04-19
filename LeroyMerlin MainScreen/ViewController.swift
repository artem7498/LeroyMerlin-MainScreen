//
//  ViewController.swift
//  LeroyMerlin MainScreen
//
//  Created by Артём on 4/17/21.
//

import UIKit

class ViewController: UIViewController {
    
    let sections = Bundle.main.decode([MSectionCollection].self, from: "model.json")
    
    let searchController = UISearchController()
    
    var dataSource: UICollectionViewDiffableDataSource<MSectionCollection, MSection>?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        
        collectionView.collectionViewLayout = layout()
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
        
        createDataSource()
        reloadData()
        // Do any additional setup after loading the view.
    }
        
    func createDataSource(){
        dataSource = UICollectionViewDiffableDataSource<MSectionCollection, MSection>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, section) -> UICollectionViewCell? in
            switch self.sections[indexPath.section].type {
            case "Категории":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
                cell.configureCell(with: section)
                return cell

            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
                cell.configureCell(with: section)
                return cell
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else {return nil}
            guard let firstSection = self.dataSource?.itemIdentifier(for: indexPath) else {return nil}
            guard let section = self.dataSource?.snapshot().sectionIdentifier(containingItem: firstSection) else {return nil}
            
            if section.title.isEmpty {return nil}
            
            sectionHeader.title.text = section.title
            
            return sectionHeader
        }

        
    }
    
    func reloadData(){
        var snapshot = NSDiffableDataSourceSnapshot<MSectionCollection, MSection>()
        snapshot.appendSections(sections)
        
        for section in sections{
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource?.apply(snapshot)
        
    }
    
    func layout() -> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
        
            if sectionNumber == 0{
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 10
//                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.3), heightDimension: .absolute(100)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 32, leading: 16, bottom: 32, trailing: 0)
//                section.contentInsets.leading = 16
                
                return section
                
            } else {
                
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(0.25),        heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 10
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension:        .fractionalWidth(1.5), heightDimension: .absolute(200)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
//                section.contentInsets.leading = 16
                section.contentInsets = .init(top: 16, leading: 16, bottom: 32, trailing: 0)
                
                let header = self.createSectionHeader()
                section.boundarySupplementaryItems = [header]
                
                return section

            }
        }
    }
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem{
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                             heightDimension: .estimated(1))
        let layoutHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize,
                                                                       elementKind: UICollectionView.elementKindSectionHeader,
                                                                       alignment: .top)
        return layoutHeader
    }

}

extension ViewController{
    private func setupNavigationBarItems(){
        title = "Поиск товаров"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let appearance = UINavigationBarAppearance()
        let leroyColor = UIColor(red: 113/255, green: 191/255, blue: 84/255, alpha: 1.0)
                appearance.backgroundColor = leroyColor
                appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

                navigationController?.navigationBar.tintColor = .white
//                navigationController?.navigationBar.standardAppearance = appearance
                navigationController?.navigationBar.compactAppearance = appearance
                navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }

}
