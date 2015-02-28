
import geomerative.*;

//RShape txt;
//float t;

RFont font;

void setup(){
  size(800,200);
  noStroke();
  background(0);
  smooth();
  
  RG.init(this);
  
  //txt=RG.getText("YOUR LIMIT IS THE IMAGINATION","Incognitype.ttf",30,CENTER);
  font=new RFont("Incognitype.ttf",30,RFont.CENTER);
  rectMode(CENTER);  
}
  
  void draw(){
  for(int i=0; i<width;i+=2){
    for(int j=0; j<height;j+=1){
    fill(random(255));
    rect(i,j,3,3);
    }
  }
  
  /*noStroke();
  fill(0,200);
  translate(width/2,height/2);
     
   t += 0.001;
   if (t > 0.99){
     t = 4;
   }
   
  RPoint punto= txt.getPoint(t);
  RPoint tang=txt.getTangent(t);
  float ang=atan2(tang.y,tang.x);
  fill(255,255);
  noStroke();
  
  if(mousePressed){
  translate(punto.x,punto.y);
  rotate(ang);
  ellipse(0,0,3,3);

  }*/
  if(mousePressed){
  translate(width/2,height/2.0+font.size/3.0);
  fill(random(255));
  font.draw("YOUR LIMIT IS THE IMAGINATION");
    }
  }

