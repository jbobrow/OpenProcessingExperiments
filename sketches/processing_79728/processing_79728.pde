
int triX=-10;
int triY=-20;
int tri2X=-10;
int tri2Y=-20;
int lastSecond=0;
int xx,yy,cc=30,dd=30;
int trans=80;
int aa=(triX+50);


void setup() {
  size(400,400);
  smooth();
  background(255);
  frameRate(30);
}
 
void draw() {
 
 
  SS();
  MM();


}
 
void SS() {

  xx+=1;
  pushMatrix();
  translate(width/2,height/2);
  
  if(xx>30) {
    float s=map(second(),0,60,0,TWO_PI)-HALF_PI;
    rotate(s);
    fill(random(255),random(255),random(190,255),trans);
    ellipse(0,0,(triX+50),(triY-260));
    xx=0;
    }
    popMatrix();
  
}

void MM(){
  
  
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  float s=map(second(),0,45,10,TWO_PI)-HALF_PI;
    rotate(s);
  fill(255,100);
  ellipse(0, 0, cc+15,dd+15);
  fill(150,0,100,200);
  arc(0, 0, cc+4,dd+4, 0, PI*2-PI/7);
 
  popMatrix();
  /////////////
 pushMatrix();
  translate(width/2,height/2);
  float s1=map(second(),0,30,0,TWO_PI)-HALF_PI;
    rotate(s1);
  fill(255,200,75,8);
  arc(0, 0, cc+200,dd+20, radians(-50), radians(-10));
 
  popMatrix();
  
   pushMatrix();
  translate(width/2,height/2);
  float s2=map(second(),0,20,30,TWO_PI)-HALF_PI;
    rotate(s2/2);
  fill(200,240,55,8);
  arc(0, 0, cc+200,dd+20, radians(-70), radians(-10));
 
  popMatrix();
    
 
}
