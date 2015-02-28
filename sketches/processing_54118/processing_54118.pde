
PShape Head;
PShape Teeth;

void setup(){
  size(800,400);
  smooth();
  noLoop();
  noStroke();
  shapeMode(CENTER);
  rectMode(CENTER);
  Head = loadShape("Head.svg");
  Teeth = loadShape("Teeth.svg");
  
  
  
}

void draw(){
 background(255);
 bot(0,-50);
 bot(-250,-50);
 bot(250,-50);
 
 

 
}

void bot(float x,float y){
  
  pushMatrix();
  translate(x,y);
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float lips = random(10);
  float body = random(70,100);
  float eyeloc = random(-5,5);
  float arms = random(-45,45);
  
  // BOT
  fill(0);
 //legs
  rect(width/2-10-(body*0.1),height/2+220,20,40,10,10);
  rect(width/2+10+(body*0.1),height/2+220,20,40,10,10);
  //arms
  
  //ARM 1
  pushMatrix();
  translate(width/2 + 45,height/2+170);
  rotate(radians(arms));
  rect(0,0,body-20,25,15,15);
  rect(30,0,15,35,5,5);
  ellipse(45,0,30,30);
  arc(55,0,30,30,radians(-45),radians(240));
  fill(255);
  ellipse(55,0,10,10);
  popMatrix();
  
  //ARM 2
  fill(0);
  pushMatrix();
  translate(width/2 - 45,height/2+170);
  rotate(radians(-arms));
  rect(0,0,body-20,25,5,5);
  rect(-30,0,15,35,5,5);
  ellipse(-45,0,30,30);
  arc(-55,0,30,30,radians(-45),radians(240));
  fill(255);
  ellipse(-55,0,10,10);
  popMatrix();
 
 
 
 
  //body
  fill(0);
  rect(width/2,height/2+135,30,50,5,5);
  rect(width/2,height/2+175,body,body,10,10);
  fill(r,g,b);
     //boobs
  rect(width/2-20,height/2+155,body*0.3+5,body*0.3,10,10);
  rect(width/2+20,height/2+155,body*0.3+5,body*0.3,10,10);
    //abs
  rect(width/2,height/2+190,body-10,body-65,5,5);
  //belly button
  fill(0);
  ellipse(width/2,height/2+170+(body*0.3),5,5);
  shape(Head,width/2,height/2);
  shape(Teeth,width/2,height/2);
  fill(0);
  rect(width/2,height/2+70-lips,129,12);
  rect(width/2,height/2+100+lips,129,12);
  fill(255);
  ellipse(width/2,height/2-5,40,40);
  fill(r,g,b);
  ellipse(width/2+eyeloc,height/2,15,15);
 
  
  
  popMatrix();
  
}

void mousePressed()
{
   redraw();
}


