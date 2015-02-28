
float baseAngle;

void setup(){
  size(400,400);
  display();
}

void draw() {
}

void mouseClicked() {
  display();
}
void display() {
  pushMatrix();
  background(128);
  baseAngle=random(-PI/6);
  rotate(baseAngle);
  smooth();
  for (int i =-5;i<10;i++)
    for (int j=0;j<14;j++) {
      rect(i*width*.1,j*width*.1,width*.1,width*.1);
    }
  
  for(int i=0;i<6;i++) {
    int x=round(random(-3,8));
    int y=round(random(2,12));
    fill(0);
    rect(x*width*.1,y*width*.1,width*.1,width*.1);
  }  
  for(int i=0;i<6;i++) {
    pushMatrix();
    float px = random(0,width);
    float py = random(0,height);
    rotate(baseAngle+random(-PI/6,PI/6));
    fill(0);
    rect(px+width*.005,py+width*.005,width*.1,width*.1);
    fill(255);
    rect(px,py,width*.1,width*.1);
    popMatrix();
  }
  popMatrix();
}

