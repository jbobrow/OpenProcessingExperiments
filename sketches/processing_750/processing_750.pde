
//import processing.opengl.*;

Zone zone;
ToyCube toycube;
ToyRed toyred;
ToyGreen toygreen;
ToyBlue toyblue;
ToyParticle toyparticle;
Cube cube;
Particle particle;

PFont myFont;

void setup(){
  size(400,600,P3D);
  background(0);
  lights();
  zone = new Zone();
  toycube = new ToyCube();
  toyred = new ToyRed();
  toygreen = new ToyGreen();
  toyblue = new ToyBlue();
  toyparticle = new ToyParticle();
  
  cube = new Cube();
  particle = new Particle();
  
  myFont = createFont("verdana", 20);
  textFont(myFont);
  toycube.x = 100;
  toycube.y = zone.ytv+15;
  toyred.x = 130;
  toyred.y = zone.ytv+15;
  toygreen.x = 160;
  toygreen.y = zone.ytv+15;
  toyblue.x = 190;
  toyblue.y = zone.ytv+15;
  toyparticle.x = 220;
  toyparticle.y = zone.ytv+15;
  
  frameRate(30);
}

void draw(){
  background(0);

  zone.drawSep();
  toycube.drawToyCube();
  toyred.drawToyRed();
  toygreen.drawToyGreen();
  toyblue.drawToyBlue();
  toyparticle.drawToyParticle();
  
  if(toyred.inGame())
  {
    if(dist(toyred.x,toyred.y,toycube.x,toycube.y)<=51)
    {
      cube.fR=255-int(dist(toyred.x,toyred.y,toycube.x,toycube.y))*5;
    }else{cube.fR=0;}
    if(dist(toyred.x,toyred.y,toyparticle.x,toyparticle.y)<=51)
    {
      particle.r=int(dist(toyred.x,toyred.y,toyparticle.x,toyparticle.y))*5;
    }else{particle.r=255;}
  }
  
  if(toygreen.inGame())
  {
    if(dist(toygreen.x,toygreen.y,toycube.x,toycube.y)<=51)
    {
      cube.fG=255-int(dist(toygreen.x,toygreen.y,toycube.x,toycube.y))*5;
    }else{cube.fG=0;}
    if(dist(toygreen.x,toygreen.y,toyparticle.x,toyparticle.y)<=51)
    {
      particle.g=int(dist(toygreen.x,toygreen.y,toyparticle.x,toyparticle.y))*5;
    }else{particle.g=255;}
  }
  
  if(toyblue.inGame())
  {
    if(dist(toyblue.x,toyblue.y,toycube.x,toycube.y)<=51)
    {
      cube.fB=255-int(dist(toyblue.x,toyblue.y,toycube.x,toycube.y))*5;
    }else{cube.fB=0;}
    if(dist(toyblue.x,toyblue.y,toyparticle.x,toyparticle.y)<=51)
    {
      particle.b=int(dist(toyblue.x,toyblue.y,toyparticle.x,toyparticle.y))*5;
    }else{particle.b=255;}
  }
  
  if(toycube.inGame())
  {
    cube.renderCube(toycube.x, 200, toycube.y-400);
    if(dist(toycube.x,toycube.y,toyparticle.x,toyparticle.y)<=100)
    {
      particle.sp = 120 - int(dist(toycube.x,toycube.y,toyparticle.x,toyparticle.y));
    }else{particle.sp=20;}
  }
  
  if(toyparticle.inGame())
  {
    particle.renderParticle(toyparticle.x, 200, toyparticle.y-400);
  }

}



class Zone{
  int y3d, ytv;
  Zone(){
    y3d = 400;
    ytv = y3d + 150;
  }
  void drawSep(){
    stroke(255);
    fill(255);
    line(0, y3d, width, y3d);
    line(0, ytv, width, ytv);
    
    text("PlayBoard", 10, y3d+20);
    text("Tool", 10, ytv+20);
    text("Box", 13, ytv+40);
    
    noStroke();
    fill(20);
    rect(70,ytv+1,width-70,height-ytv);
    fill(5);
    rect(115,y3d+1,width-100,149);
    rect(1,y3d+30,115, 120);
  }
}

class Toy{
  int x,y,d,cx,cy;
  float rot;
  
  Toy(){
    d = 20;
    rot = 0;
    cx=x+d/2;
    cy=y+d/2;
  }
  
  boolean checkOver(){
    if(mouseX>x && mouseX<x+d && mouseY>y && mouseY<y+d)
    {
      stroke(255,0,0);
      return true;
    }else{
      stroke(0);
      return false;
    }
  }
  
  boolean checkLocked(){
    if(checkOver() && mousePressed)
    {
      
      return true;
    }else{
      
      return false;
    }
  }
  
  boolean inGame(){
    if(y<550)
    {
      return true;
    }else{
      return false;
    }
  }
  
  void drawToy(int fR, int fG, int fB){
    fill(fR,fG,fB);
    if(checkLocked())
    {
      if(mouseX>d/2 && mouseX<width-d/2)
      {
        x = mouseX-d/2;
      }else{
        if(mouseX<=d/2){x=1;}
        if(mouseX>=width-d/2){x=width-d;}
      }
      if(mouseY>400+d/2 && mouseY<height-d/2)
      {
        y = mouseY-d/2;
      }else{
        if(mouseY<=400+d/2){y=401;}
        if(mouseY>=height-d/2){y=height-d;}
      }
    }
    rect(x,y,d,d);
    
    }
}

class ToyCube extends Toy{
  int colore;
  
  ToyCube(){
    colore = 255;
    cube = new Cube();
  }
  void drawToyCube(){
    drawToy(colore, colore, colore);
  }
}

class ToyRed extends Toy{
  
  void drawToyRed(){
    drawToy(255,0,0);
    
  }
}
class ToyGreen extends Toy{
  void drawToyGreen(){
    drawToy(0,255,0);
  }
}
class ToyBlue extends Toy{
  void drawToyBlue(){
    drawToy(0,0,255);
  }
}

class ToyParticle extends Toy{
  void drawToyParticle(){
    drawToy(150,150,150);
  }
}

class Cube{
  int x,y,z,sR,sG,sB,fR,fG,fB;
  
  Cube(){

    sR=50;
    sG=50;
    sB=50;
    fR=0;
    fG=0;
    fB=0;
  }
  void renderCube(int posx, int posy, int posz){
    pushMatrix();
    
    stroke(sR,sG,sB);
    fill(fR,fG,fB);
    translate(posx, posy, posz);
    rotateY(frameCount*0.01);
    box(100);
    
    popMatrix();
  }
}

class Particle{
  int x,y,z,r,g,b,i,d,sp;
  Particle(){
    r=255;
    g=255;
    b=255;
    d=10;
    sp=20;
  }
  void renderParticle(int posx, int posy, int posz){
    noStroke();
    fill(r,g,b);
    
    pushMatrix();
    
    //centro
    translate(posx,posy,posz);
    rotateY(frameCount*0.1);
    rotateX(frameCount*0.1);
    sphere(d);
    translate(0, sp, 0);
    sphere(d);
    translate(0, -2*sp, 0);
    sphere(d);
    translate(-1*sp, sp, 0);
    sphere(d);
    translate(2*sp, 0, 0);
    sphere(d);
    translate(-1*sp, 0, sp);
    sphere(d);
    translate(0, 0, -2*sp);
    sphere(d);
    
    popMatrix();
    
    
  }
}

