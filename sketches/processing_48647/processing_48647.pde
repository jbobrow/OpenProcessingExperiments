
  int value = 200;
  int x = 5;
  int y = 335;
  int w = 20;
  int h = 20; 

void setup()
{ 
  size (640,360);
  smooth();
  background(255,255,255);
}
 
void draw()
{
  float pX = random(640);
  float pY = random(360);
  float r = random(3,10);
  noStroke();
  fill(random(0,200),value,value);
  ellipse(pX,pY,r,r);

  noStroke();
  fill(255,255,255);
  
  /*toolbox*/
  noStroke();
  fill(129,139,149);
  rect(0, 305, 30, 70);
  
   /*bouton changement de couleur*/
  fill(0,0,0);
  noStroke();
  fill(192,202,212);
  rect(x, y-25, w, h);
  textSize(10);
  fill(0);
  text("clic",x,y-10);
  
    
  /*bouton bas*/
  noStroke();
  fill(192,202,212);
  rect(x, y, w, h);
  
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) &&
  (mouseY >y) && (mouseY <y+h) && (mouseButton == LEFT)){
  fill(random(200,255),random(200,225),random(15,51), random(0,255));
  rect(random(0,640), random(0,360), 10,10);
  }
  
    if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) &&
  (mouseY >y) && (mouseY <y+h) && (mouseButton == RIGHT)){
  fill(random(220,255),random(20,187),random(150,185));
  rect(random(0,640), random(0,360), 20,20);
  ;
  }
  
}

void mouseDragged(){
  
  stroke(255,255,255);
  strokeWeight(random(1,3));
  line(pmouseX, pmouseY, -mouseX, -mouseY);
}
  
void mouseReleased () {
  if ((mouseX > x) && (mouseX < x+w) && (mouseY >y-25) && (mouseY <(y-25)+h) && (value == 200)) {
    value = 137;
  } else {
    value = 200;
  }
}

                
                
