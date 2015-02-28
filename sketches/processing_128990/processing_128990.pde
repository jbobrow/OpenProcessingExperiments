
void setup(){
  size(600,600);
  frameRate(1000000);
}
 
void draw(){
  scale(3);
  background(200,200,200);
   
  stroke(250,100,0);
  strokeWeight(0);
 
  fill(255,255,200);
  rectMode(CORNER);
  rect(20,50,160,60);
 
  berechne();
  beschreibe();
  maus();
  crazyness();  
 
}

void berechne(){
  int i=mouseX+mouseY;
  fill(constrain(i,0,255),constrain(i,0,255),0);
  textSize(10);
  text(i,30,30);
}

void beschreibe(){
  textSize(16);
  fill(0);
  text("X",50,50);
  text("Y",125,50);
}

void maus(){
  fill(255,0,0);
  textSize(30);
  text(mouseX,25,90);
  text(mouseY,100,90);
}

void crazyness(){
  int i=mouseX+mouseY;
  fill(0,0,0);
  int mx=mouseX/3;
  int my=mouseY/3;
  strokeWeight(1.5);
  line(mx-10,my,mx+10,my);
  line(mx,my-10,mx,my+10);
}
