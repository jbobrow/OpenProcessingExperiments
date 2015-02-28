
ArrayList kelip;

void setup(){
  size(400, 300);
  noStroke();
  kelip = new ArrayList();
  
    // Create the font
  textFont(createFont("Georgia",70));
  textAlign(CENTER, CENTER);
}//setup

void draw(){
  background(255);
  
  fill(220);
  for(int i = kelip.size()-1; i>=0; i--){
    Kelip kel = (Kelip) kelip.get(i);
    kel.membesar();
  }//for
  
  fill(255);
  text("Jannah", width/2, height/2);
}//draw

void mousePressed(){
  kelip.add(new Kelip());
  if(mouseButton == RIGHT){
    kelip = new ArrayList();
  }//mouse right
}//mousepressed

class Kelip{
  
  float r = 0;
  float speed = 1;
  float maxR = 70;
  float x = mouseX;
  float y = mouseY;
  int warna = int(random(0,255));
  
  void membesar(){
    r += speed;
    fill(#FF484E * warna );
      ellipse(x,y, r,r);
      if(r >= maxR || r <0){
        speed = speed * -1;
      }//if
  }//membesar
}//kelip
