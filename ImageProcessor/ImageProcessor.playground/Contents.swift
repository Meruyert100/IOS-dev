
import UIKit


var filterList = [("greenFilter", 30), ("transparencyFilter", 200)]



let image = UIImage(named: "sample")!
var rgbaImage = RGBAImage(image: image)!
let validFilters = ["greyFilter", "transparencyFilter", "redFilter", "greenFilter", "blueFilter"]


func greyFilter(intensity: Int = 2, var pixel: Pixel) -> Pixel {
    
    let conversionFactor = Double(255 / (intensity - 1))
    let average = (Double(pixel.red) + Double(pixel.green) + Double(pixel.blue)) / 3.0
    let grey = Double(Int((average / conversionFactor) + 0.5)) * conversionFactor
    
    pixel.red = UInt8(grey)
    pixel.blue = UInt8(grey)
    pixel.green = UInt8(grey)
    
    return pixel
}

func transparencyFilter(intensity: Int, var pixel: Pixel) -> Pixel {
    pixel.alpha = UInt8(intensity)
    
    return pixel
}

func redFilter(intensity: Int, var pixel: Pixel) -> Pixel {
    pixel.red = UInt8(min((intensity + Int(pixel.red)), 255))
    
    return pixel
}

func greenFilter(intensity: Int, var pixel: Pixel) -> Pixel {
    pixel.green = UInt8(min((intensity + Int(pixel.green)), 255))
    
    return pixel
}

func blueFilter(intensity: Int, var pixel: Pixel) -> Pixel {
    pixel.blue = UInt8(min((intensity + Int(pixel.blue)), 255))
    
    return pixel
}


for (f, i) in filterList {

    if !(validFilters.contains(f)) { continue }
    

    var intensity = max(2, min(255, i))
    

    for y in 0..<rgbaImage.height {
        for x in 0..<rgbaImage.width {
            let index = y * rgbaImage.width + x
            var pixel = rgbaImage.pixels[index]
            
            switch (f){
            case "greyFilter":
                rgbaImage.pixels[index] = greyFilter(intensity, pixel: pixel)
            case "transparencyFilter":
                rgbaImage.pixels[index] = transparencyFilter(intensity, pixel: pixel)
            case "redFilter":
                rgbaImage.pixels[index] = redFilter(intensity, pixel: pixel)
            case "greenFilter":
                rgbaImage.pixels[index] = greenFilter(intensity, pixel: pixel)
            case "blueFilter":
                rgbaImage.pixels[index] = blueFilter(intensity, pixel: pixel)
            default:
                continue
            }
        }
    }
}

var processedImage = rgbaImage.toUIImage()


 processedImage


