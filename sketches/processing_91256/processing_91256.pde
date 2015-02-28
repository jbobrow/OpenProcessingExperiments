
PShape keel, rail, cabin, stack1, stack2, w1, w2, w3;
float X;
float Y;

Stevie mySteve;

color bgcolor;
void setup(){
  size(800, 800, P2D);
  bgcolor = color(random(100),random(100), random(100));
  background(bgcolor);
  
  
    mySteve=new Stevie(random(width/4, 3*width/4), random(height/5,4*height/5));
  
smooth();
 
}
void draw(){
  background(bgcolor);
  mySteve.drawSteve();
 
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
        mySteve.moveSteveR();
        mySteve.blowsmokering();
    }
    if (keyCode == UP) {
        mySteve.moveSteveU();
        mySteve.blowsmokering();
    }
    if (keyCode == DOWN) {
        mySteve.moveSteveD();
        mySteve.blowsmokering();
    }
    if (keyCode == LEFT) {
        mySteve.moveSteveL();
        mySteve.blowsmokering();
    }
        if (keyCode == CONTROL) {
        mySteve.blowsmokering();
    }
  }
}
class Stevie {
  float X, Y, smokeringpos;
  Stevie(float xpos, float ypos){
   X = xpos;
   Y = ypos;

  }
  void drawSteve(){
    pushMatrix();
    translate(X,Y);
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
  void moveSteveR(){
    pushMatrix();
    X = X + width/8;
    translate(X,Y);
    popMatrix();
  }
    void moveSteveD(){
    pushMatrix();
    Y = Y + height/6;
    translate(X,Y);
    popMatrix();
  }
      void moveSteveL(){
    pushMatrix();
    X = X - width/8;
    translate(X,Y);
    popMatrix();
  }
      void moveSteveU(){
    pushMatrix();
    Y = Y - height/6;
    translate(X,Y);
    popMatrix();
  }
  void blowsmokering(){
    pushMatrix();
    float smokeringpos = Y;
    ellipse(X+ 85, smokeringpos -100, 8, 8);
    ellipse(X + 85, smokeringpos - 100, 24, 12); 
    smokeringpos = Y + 1;
    popMatrix();
  }
}



