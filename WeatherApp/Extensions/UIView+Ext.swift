//
//  UIView+Ext.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//
import MapKit

extension UIView {
    
    //Properties
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
