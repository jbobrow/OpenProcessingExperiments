
/**
* Picture pallet - Dec 2009
* by volts (Tom Blackwell)
* Utility sketch that makes a pallet from random colors in a picture file
* coulda been a class...
*
*/

int pallet_size = 512, colors = 0;
color[] pallete = new color[pallet_size];

color randomColor() {
  return pallete[int(random(colors))];
}

void makePallete(String sourcefile) {
  PImage source;
  source = loadImage(sourcefile);
  //scan source image adding colors to pallet
  for (int x=0; x<source.width; x++){
    for (int y=0; y<source.height; y++) {
      if (colors>=pallet_size)break; // pallete is full  
      if ((random(1) < 0.1)) continue; // randomly sample 10%
      color c = source.get(x,y);
      for (int n=0; n<pallet_size; n++) {
        if (c==pallete[n]) {  //existing color
          break;
        }
        else if (n > colors) { //new color
            pallete[colors] = c;
            colors++;
            break;
        }
      }
    }
  }
}

