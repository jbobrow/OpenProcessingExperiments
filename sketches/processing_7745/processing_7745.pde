
float colorR = 100;
float colorG = 100;
float colorB = 100;

void setup (){
  size (400,400);
  frameRate(30);
  smooth();
}

void draw() {
  background(0);
  for(int x = 0; x < width; x+=40){
    for(int y = 0; y < height; y+=40){
      stroke(255,255,255,50);
      fill(colorR,colorG,colorB,random(0,255));
      rect(x,y,40,40);
    }
  }

}

void mousePressed () {
  colorR = random(50,255);
  colorG = random(50,255);
  colorB = random(50,255);
}



