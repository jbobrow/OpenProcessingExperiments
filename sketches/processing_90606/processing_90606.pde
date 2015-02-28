
PShape keel, rail, cabin, stack1, stack2, w1, w2, w3;
float X;
float Y;

Stevie[] mySteve;

color bgcolor;
void setup(){
  size(400, 400, P2D);
  bgcolor = color(random(100),random(100), random(100));
  background(bgcolor);
  mySteve = new Stevie[3];
  
  for(int i=0; i<mySteve.length; i++){
    mySteve[i]=new Stevie(random(width/4, 3*width/4), random(height/5,4*height/5));
  }
smooth();
 
}
void draw(){
  for(int j=0; j<mySteve.length; j++){
  mySteve[j].drawSteve();
  mySteve[j].moveSteve();

  }
}
class Stevie {
  float X, Y;
  Stevie(float xpos, float ypos){
   X = xpos;
   Y = ypos;
  }
  void drawSteve(){
    pushMatrix();
    translate(X,Y);
    rotate(radians(frameCount));
    fill(random(255),random(255),random(255));
   rect(0, 0, 200, 30, 6, 6, 50, 50);
  //rail
  fill(000000);
  rect(0, 0-5, 200, 5, 4, 4, 4, 4);
  //cabin
    fill(random(255),random(255),random(255));
  rect(0+10, 0-65 , 90, 60, 5, 5, 5, 5);
  //stacks
    fill(random(255),random(255),random(255));
  rect(0 +55, 0 - 85, 10, 20, 3, 3, 0, 0);
  rect(0+70, 0-100, 10, 35, 3, 3, 0, 0);
 fill(bgcolor);
 rect(0 +20, 0-55, 10, 10, 2, 2, 2, 2);
 rect(0+50, 0-55, 10, 10, 5, 5, 2, 2);
 fill(255);
 rect(0+15, 0-30, 30, 10, 2, 6, 2, 6);
 popMatrix();
  }
  void moveSteve(){
    pushMatrix();
    popMatrix();
  }

}



