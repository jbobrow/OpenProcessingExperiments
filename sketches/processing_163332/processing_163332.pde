
float startTime, currTime;
float hitTime;
float angle, speed, speedR;

int count = 3;

//import gifAnimation.*;
//
//GifMaker gifExport;

void setup() {
  background(10);
  size(410, 410);
  colorMode(HSB,360,100,100);
  
  smooth();
//  gifExport = new GifMaker(this, "20.gif");
//  gifExport.setRepeat(0);
  frameRate(30);
  
  hitTime = 1000; 
  startTime = millis();
  speed = .1;
}

void draw() {
   
  
  
  fill(random(300), 100, 100,40);
  rect(0,0,width,height);
  
  
  currTime = millis() - startTime;

  if ( currTime >= hitTime ) {    
    startTime = millis();
    count++;
  } 
  
  if (count >=7){
    count = 3;
  }
  
  noFill();
  stroke(0,0,100);
  strokeWeight(.5);
  
  //angle tiene un aumento de .1
  //angle+=speed;
  //otras opciones
  angle+=(frameCount/10);
  //angle+=count;
  
  for(int x = 0; x < width + 82; x+=82){
    for(int y = 0; y < height +82; y+=82){
      pushMatrix();
      translate(x, y);
      rotate(angle);
      polygon(0, 0, 82, count);
      popMatrix();
    }
  }
  
//  gifExport.setDelay(1);
//  gifExport.addFrame();
  
}

void polygon(float x, float y, float radius, int npoints) {
  
  
  float angle = TWO_PI / npoints;
  pushMatrix();
  //rotate(frameCount/10);
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;    
    vertex(sx, sy);
  }
  
  endShape(CLOSE);
  popMatrix();
  
}

//void keyPressed() {
//  gifExport.finish();
//  println("gif saved");
//}


