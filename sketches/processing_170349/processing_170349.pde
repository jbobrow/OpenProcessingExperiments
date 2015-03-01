
int leng;
int angle;
float PHI = .6181;
void setup(){
  size(720,720);
  stroke(0);
 // strokeWeight(1);
}
void draw(){
  leng = (height-mouseY)/2;
  angle = mouseX;
  background(0,100,150);
  text(leng,0,10);
  text(angle + " (360-" + (360-angle) + ")",0,20);
  translate(width/2,height-50);
  stroke(0);
  tree(9, leng, angle/2);
}
void tree(int BRANCH, float LENG,int ANGLE){
  BRANCH -=1;
  line(0,0,0,-LENG);
  
  translate(0,-LENG);
  if(BRANCH >= 0){
    
    pushMatrix();
    //strokeWeight(BRANCH-1);
    rotate(radians(ANGLE));
    tree(BRANCH, PHI*LENG, ANGLE);
    popMatrix();
    
    pushMatrix();
    //strokeWeight(BRANCH-1);
    rotate(radians(-ANGLE));
    if(LENG<40){
      stroke(255);
    }else{stroke(0);}
    tree(BRANCH, PHI*LENG, ANGLE);
    popMatrix();
  }
}
