
//Help from Thomas Solanet and Kit Cheong


boolean colorchange;
int a= 20;
int b= 10;
int x= 50;
int y= 75;


void setup() {
  size(800, 200);
  smooth();
}



void draw() {
randomSeed(0);

  if (colorchange) {
    background (#edda05);
  }
  else {
    background (0);
  }
  
  for (int i = 35; i < width ; i += 40){
    int c= int(random(0,120));
    float scalar = random (.40,2.0);

    bulb(i,110,b,scalar);
  }
}

void mousePressed() {
  colorchange =!colorchange;
}

  void bulb(int a, int b, int c, float s) {

    pushMatrix();
    scale(s);
    
    //---------------big bulb
    stroke(255, 6);
    strokeWeight(.25);
    fill(255, 90);
    ellipse(width/2, y, x, y);
    //-----------------wire opening
    strokeWeight(.25);
    stroke(200);
    noFill();
    ellipse(width/2, 42, x/5, y/5);
    //-----------wire
    stroke(160);
    strokeWeight(2);
    line(width/2, 40, width/2, 0);
    popMatrix();
  }
  
  


