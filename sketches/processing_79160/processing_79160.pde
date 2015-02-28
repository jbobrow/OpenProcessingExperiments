
PImage bild;

void setup(){
  size(640,480);
  smooth();
  
  bild = loadImage("herz.png");
  frameRate(25);
}

void draw(){
  
  background(#d15fa2);
  noStroke();
  
  float ps = mouseX+128;
  
  for(int j = 0; j<height/ps+1;j++){
    for(int i = 0; i<width/ps+1;i++){
      
      image(bild,i*ps,j*ps,ps,ps);
    }
  }
}


