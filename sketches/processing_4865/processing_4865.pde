
class Palette {
  //-----------------------------------------------------------------------------
  //properties
  //-----------------------------------------------------------------------------
  PImage bild;
  color[] farbe;
  
  int loc;
  
  //-----------------------------------------------------------------------------
  //constructor
  //-----------------------------------------------------------------------------
  Palette(String pfad) {
    bild = loadImage(pfad);
    farbe = new color[bild.width*bild.height];
    int index = 0;
    
    for (int i=0; i<bild.width; i++) {
      for (int j=0; j<bild.height; j++) {
        //-----------------------------------------------------------------------------
        //get the color and location of images pixels
        //-----------------------------------------------------------------------------
        loc = i + j*bild.width; 
        farbe[index] = bild.pixels[loc];

        index++;
      }  
    }

  }

  //-----------------------------------------------------------------------------
  //gets
  //-----------------------------------------------------------------------------
  color getFarbe(int w) {
    return farbe[w];
  }

  int getFarbeZahl() {
    return farbe.length;
  }

}

