
/*
Another simple sketch inspired by the Wallpaper "Blue Fish":
http://simpledesktops.com/browse/desktops/2013/mar/30/blue-fish/

Made by @ramayac
*/

int radius = 90; 
color[] colortheme = { 
  #00B9EE, #009FE3, #00497F, 
  #03326C, #83D0F5, #006F9E,
  #004899, #052453
};

void setup(){
  size(600, 400);
  noStroke();
  smooth();
}



void draw(){
  //background(0);
  
  for(int y = height; y >= -radius; y=y-radius/2){
    for(int x = -radius; x < width+radius; x=x+radius){
      fill(getRamdomBlue());

      int even = int(y % 2);
      if(even == 0){
        ellipse(x, y, radius, radius);
      } else {
        ellipse(x+radius/2, y, radius, radius);
      }
    }
  }
  
  noLoop();
}

color getRamdomBlue(){
  int indice = int(random(colortheme.length)); 
  return colortheme[indice];
}

void mousePressed(){
  redraw();
}

