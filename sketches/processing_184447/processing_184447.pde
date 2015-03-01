


void setup() {
  size(700, 700); 
  frameRate(300);
}

void draw() {
  background(0);
    line(10,random(10,height/2-5),width/2-5,random(10,height/2-5)); //upper left
    stroke(255,0,0);
    line(width/2+5,random(10,height/2-5),width-10,random(10,height/2-5)); //upper right
    stroke(0,255,0);
    line(10,random(height/2+5,height-10),width/2-5,random(height/2+5,height-10)); //lower left
    stroke(0,0,255);
    line(width/2+5,random(height/2+5,height-10),width-10,random(height/2+5,height-10)); //lower right
    stroke(75,150,225);
}


