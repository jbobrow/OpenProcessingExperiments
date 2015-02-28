
Rect myRect1;
Rect myRect2;
Rect myRect3;


void setup(){
  size(1000,1000);
  background(80,50,90);
  frameRate(20);

  myRect1 = new Rect(50,115,0,150,150,225,20,100,300,500,850);
  myRect2 = new Rect(150,225,0,150,100,150,100,0,500,0,500);
  myRect3 = new Rect(50,225,100,225,100,150,10,500,900,700,1200);
   
}
  
void draw(){
    translate(width/2,height/2);
    myRect1.display();
    myRect2.display();
    myRect3.display();

}
class Rect {
  float rpos1;
  float rpos2;
  float gpos1;
  float gpos2;
  float bpos1;
  float bpos2;
  float alpha;
  float rwidth1;
  float rwidth2;
  float rheight1;
  float rheight2;
 
  
  Rect(float tempRpos1,float tempRpos2, float tempGpos1, float tempGpos2, float tempBpos1,  float tempBpos2, float tempAlpha, float tempRwidth1,float tempRwidth2, float tempRheight1, float tempRheight2){
    rpos1 = tempRpos1;
    rpos2 = tempRpos2;
    gpos1 = tempGpos1;
    gpos2 = tempGpos2;
    bpos1 = tempBpos1;
    bpos2 = tempBpos2;
    alpha = tempAlpha;
    rwidth1 = tempRwidth1;
    rwidth2 = tempRwidth2;
    rheight1 = tempRheight1;
    rheight2 = tempRheight2;
  }
  void display() {
    rectMode(CENTER);
    rotate(TWO_PI/random(2));
    stroke(random(150,225),random(100,150),random(100,150),30);
    fill(random(rpos1,rpos2),random(gpos1,gpos2),random(bpos1,bpos2),alpha);
    rect(0,0, random(rwidth1,rwidth2),random(rheight1,rheight2),random(5,1000));
  }
 


}

