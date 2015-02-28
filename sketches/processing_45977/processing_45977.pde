
class ColorData {
    String colorName;
    color colorValue;
    //String emotionName;
    //float emotionValue;
    
    ColorData(String name, color value) {
      colorName = name;
      colorValue = value;
    }
    
    String toString(){
      return colorName+" "+hex(colorValue, 6);
    }
    
    /*
    color cDistance(color c){
      c = cStored;
      return dist(red(colorValue), green(colorValue), blue(colorValue), red(c), green(c), blue(c));
    }
    */
}

