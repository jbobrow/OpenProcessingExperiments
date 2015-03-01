
GearWheel gw;
float c;
void setup(){
  size(640,480);
  gw = new GearWheel();
}
void draw(){
  background(0);
  noFill();
  stroke(255);
  gw.drawWheel(600,410,104,200,160,c);
  ellipse(600,410,200,200);
  gw.drawWheel(600,410,32,100,35,c);
  
  gw.drawWheel(315,235,104,150,130,-c);
  ellipse(315,235,80,80);
  gw.drawWheel(315,235,104,20,15,-c);
 
  gw.drawWheel(140,150,124,210,190,c*2);
  ellipse(140,150,320,320);
  gw.drawWheel(140,150,52,60,45,c*2);

  gw.drawWheel(350,200,104,35,25,c/2);
  
  gw.drawWheel(400,250,208,40,35,-c);
  ellipse(400,250,40,40);

  gw.drawWheel(480,165,416,80,75,c/2);
  ellipse(480,165,120,120);
  gw.drawWheel(480,165,32,60,25,c/2);
  ellipse(480,165,15,15);

  gw.drawWheel(540,90,124,450,400,-c/2);
  ellipse(540,90,400,400);
  gw.drawWheel(540,90,104,20,15,-c/2);
}
void mouseDragged(){
  c =mouseX;
}

  

  


class GearWheel{
  void drawWheel(int x,int y,int vertexNum,int rOut,int rIn,float c){
    float r;
    pushMatrix();
    translate(x,y);
    rotate(radians(c));
    beginShape();
    for (int i = 0;i < vertexNum;i++) {
      if (i%4==2 || i%4==3) {
        r = rOut;
      } 
      else {
        r = rIn;
      }
      vertex(r*cos(radians(360*i/vertexNum)), r*sin(radians(360*i/vertexNum)));
    }
    endShape(CLOSE);
    popMatrix();
  }
}


