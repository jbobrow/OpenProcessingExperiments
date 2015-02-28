
int eSize;
int x, y;  

void setup(){
  size(600,600);
  background(255);
  noStroke();
   smooth();
   x=0;y=0;
}

void draw(){}

void mousePressed(){
  if(mouseButton == LEFT){
    fill(random(0,102),203,255);
    ellipse(mouseX,mouseY,20,20);
  }
  else if(mouseButton == CENTER){
    fill(random(0,204),255,102);
    rectMode(CENTER);
    rect(mouseX,mouseY,40,40);
  }
    else if(mouseButton == RIGHT){
      fill(random(0,204),102,204);
      ellipse(mouseX,mouseY,50,50);
   }
}

void mouseDragged(){
  ellipse(mouseX,mouseY,10,10);
}
 

void keyPressed() {
  background(255);
  fill(255, 0, 0);
  text(key, width/2, height/2);
  

  switch(key) {
    case 'a':
      fill(255);
      rect(0,0,600,600);
      println("a");
      break;
  
    case 'm':
      fill(random(0,255),51,204);
      ellipse(mouseX,mouseY,30,60);
      println("a");
      break;
}
}



