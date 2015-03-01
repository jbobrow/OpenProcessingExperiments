


void setup() {
  size(500,500);
  background(147,38,57);
  noLoop();
}

void draw(){
    
  diamond(0,0,30,int(random(20)));
  diamond(75,0,60,int(random(20)));
  diamond(150,0,90,int(random(20)));
  diamond(225,0,120,int(random(20)));
  diamond(300,0,150,int(random(20)));
  diamond(375,0,180,int(random(20)));
  diamond(450,0,210,int(random(20)));
  
  diamond(0,75,30,int(random(20)));
  diamond(75,75,60,int(random(20)));
  diamond(150,75,90,int(random(20)));
  diamond(225,75,120,int(random(20)));
  diamond(300,75,150,int(random(20)));
  diamond(375,75,180,int(random(20)));
  diamond(450,75,210,int(random(20)));
  
  diamond(0,275,30,int(random(20)));
  diamond(75,275,60,int(random(20)));
  diamond(150,275,90,int(random(20)));
  diamond(225,275,120,int(random(20)));
  diamond(300,275,150,int(random(20)));
  diamond(375,275,180,int(random(20)));
  diamond(450,275,210,int(random(20)));
  
  diamond(0,350,30,int(random(20)));
  diamond(75,350,60,int(random(20)));
  diamond(150,350,90,int(random(20)));
  diamond(225,350,120,int(random(20)));
  diamond(300,350,150,int(random(20)));
  diamond(375,350,180,int(random(20)));
  diamond(450,350,210,int(random(20)));
}

void diamond(int x, int y, int alpha, int weight) {
  stroke(255,75);
  strokeWeight(weight);
  fill(111,196,232,alpha);
  beginShape();
  vertex(x,y);
  vertex(x+100,y+100);
  vertex(x,y+200);
  vertex(x-50,y+100);
  endShape(CLOSE);
}


