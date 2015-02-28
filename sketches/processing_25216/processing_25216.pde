
//Source code borrowed and edited from:
  //Alasdair Turner's "Proto L-System tree";
  //Robert Bost's "Hill Generator".
  
import processing.pdf.*;
boolean record;



Land[] grade;
static float smoothness = .5;
float range;
int h=40;

Branch tree;

color[] colors = new color[4];

void setup(){
  size (500,500,P3D);
  tree = new Branch();
  startDraw();

}

  
void draw(){
  
  if (record) {
    beginRaw(PDF, "output.pdf");
  }
  

  background(0);
  for(int i=0; i<grade.length; i++){
    grade[i].display();
  }
  
  fill(225);
  noStroke();
  translate(mouseX,mouseY,0);
  constrain(mouseY,height*7/8,height);
  rotateY(frameCount * 0.01);
  tree.draw();
  if (frameCount<4){
    tree.replace();
  }

  if (record) {
    endRaw();
	record = false;
  }
}




class Land{
  
  float x1,y1,x2,y2;
  
  Land(float x1, float y1, float x2, float y2){
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  
  void display(){
    stroke(225);
    line(x1,y1,x2,y2);
  }
}



class Branch{
  PMatrix3D joint;
  Branch child_a;
  Branch child_b;
  Branch()
  {
    joint = new PMatrix3D();
    child_a = null;
    child_b = null;
  }
  void replace()
  {
    if (child_a != null) {
      child_a.replace();
    }
    if (child_b != null) {
      child_b.replace();
    }
    if (child_a == null && child_b == null) {
      rule();
    }
  }
  void rule()
  {
    // this is a pseudo-L-system grammar rule:
    // A -> A (-A) (+A)
    if (child_a == null) {
      child_a = new Branch();
      child_a.joint.translate(0,-height/3,0);
      child_a.joint.rotateY(random(0,TWO_PI));
      child_a.joint.rotateZ(-PI/8);
      child_a.joint.scale(0.7);
    }
    if (child_b == null) {
      child_b = new Branch();
      child_b.joint.translate(0,-height/6,0);
      child_b.joint.rotateY(random(0,TWO_PI));
      child_b.joint.rotateZ(PI/8);
      child_b.joint.scale(0.7);
    }
  }

  void draw(){ 
  applyMatrix(joint);
  pushMatrix();
  translate(0,-height/4,0);
  box(10,height/3,10);
  popMatrix();
  
  pushMatrix();
  if (child_a != null) {
    child_a.draw();
  }
  popMatrix();
  
  pushMatrix();
  if (child_b != null) {
    child_b.draw();
  }
  popMatrix();
  }


}


void startDraw(){
  grade = new Land [3];
  grade[0] = new Land (0,height*2/3,width/3,height*3/4);
  grade[1] = new Land (width/3,height*3/4,width*2/3,height*4/5);
  grade[2] = new Land (width*2/3,height*4/5,width,height*7/8);
  range = height/h;
}




void mouseClicked(){
  
  Land[] temp = new Land[grade.length*2];
  int t = 0;
  for (int i=0; i < grade.length; i++){
    float x = (grade[i].x1 + grade[i].x2)/2;
    float y = (grade[i].y1 + grade[i].y2)/2;
      y -= random (-range,range);
    temp [t] = new Land(grade[i].x1,grade[i].y1,x,y);
    t++;
    temp [t] = new Land(x,y,grade[i].x2,grade[i].y2);
    t++;
    }
  
  grade = temp;
  
  tree.replace();
  
 
  
}




void keyPressed(){
  if(key == 'r'){
    startDraw();
  }
 
  if(key== 's'){
    record = true;
   }
  
  if(key== 'n'){
    tree = new Branch();
  }
 
 //if(key== '-'){
   //for(h=10; h<height; h++){
     //range = height/h;
     //startDraw();
     
   //}
 //}
 
  //if(key== '+'){
  // for(int i=49; i<height; i-=10){
    // startDraw();
    // range = height/(50-i);
   //}
 }
 

  






