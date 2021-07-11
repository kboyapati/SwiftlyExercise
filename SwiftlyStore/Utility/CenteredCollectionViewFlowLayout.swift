//
//  CenteredCollectionViewFlowLayout.swift
//  SwiftlyStore
//
//  Created by Naga Kokila Boyapati on 07/10/2021.
//

import UIKit

class CollectionViewRow {
    var attributes = [UICollectionViewLayoutAttributes]()
    var spacing: CGFloat = 0



    init(spacing: CGFloat) {
        self.spacing = spacing
    }

    func add(attribute: UICollectionViewLayoutAttributes) {
        attributes.append(attribute)
    }

    var rowWidth: CGFloat {
        return attributes.reduce(0, { result, attribute -> CGFloat in
            return result + attribute.frame.width
        }) + CGFloat(attributes.count - 1) * spacing
    }

    func centerLayout(collectionViewWidth: CGFloat) {
        let padding = (collectionViewWidth - rowWidth) / 2
        var offset = padding
        for attribute in attributes {
            attribute.frame.origin.x = offset
            offset += attribute.frame.width + spacing
        }
    }
}

class UICollectionViewCenterLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let attributes = super.layoutAttributesForElements(in: rect)?.map({ $0.copy() }) as? [UICollectionViewLayoutAttributes] else {
            return nil
        }

        var rows = [CollectionViewRow]()
        var currentRowY: CGFloat = -1

        for attribute in attributes {
            if floor(currentRowY) != floor(attribute.frame.midY) {
                currentRowY = attribute.frame.midY
                rows.append(CollectionViewRow(spacing: self.minimumInteritemSpacing))
            }
            rows.last?.add(attribute: attribute)
        }

        rows.forEach { $0.centerLayout(collectionViewWidth: (collectionView?.frame.width ?? 0)) }
        return rows.flatMap { $0.attributes }
    }
}
