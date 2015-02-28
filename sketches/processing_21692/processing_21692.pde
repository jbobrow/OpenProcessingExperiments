
PImage pentagram;
float colorValue;

void setup (){
  size(1000,1000);
  smooth();
  strokeWeight(.5);
  colorValue = random(255);
  pentagram=loadImage("Pentagram.png");
  colorMode(HSB,1000);
}

void draw(){
  background(mouseY,1000,1000);
  loadPixels();
  pentagram.loadPixels();
  
  translate(width/2, height/2);
  for(int i=0; i<25; i++){
    rotate(radians(15));
    tint(255,0,0);
    image(pentagram,mouseX-500,mouseY-500);
    
    

  }
}



