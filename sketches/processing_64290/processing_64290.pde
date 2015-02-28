
/*
* Another sketch inspired by this "Simple Desktop" wallpaper: 
* http://simpledesktops.com/browse/desktops/2012/jun/12/elsewhere/
* Coded by: @ramayac
* Enjoy :)
*/

color[] colores = { #404041, #D1D1D4, #939598, #58585A, #404041};

void setup(){
  size(900,600);
  //strokeWeight(1);
  //strokeCap(ROUND);
  //smooth();
  frameRate(24);
  noiseDetail(5, 0.75);
}

void draw(){
  background(colores[0]);
  
  for(int m=1; m<=4; m++){
    float r = random(1, 2);
    for(float x=0; x<width; x=x+1){
      stroke(colores[m]);
      float y = noise(x*0.0075+frameCount*0.01+m)*(m+20)+m*5;
      line(x, height/2+height/3, x, y+height/4+1.75*height/10);
    }
  }
  fill(#6D6E71);
  rect(0, height/2, width, height);
}
