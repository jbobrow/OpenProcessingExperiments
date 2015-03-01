
int x,y;
int space = 5;
int eSize = 50;
int c;

void setup(){
  background(255);
  size(500,500);
  smooth();
  noStroke();
  fill(c);  
  
  c=0;

}

void draw(){
  //background(255);
  ellipse(mouseX,mouseY,10,10);
}

void mouseDragged(){
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,random(3,40),random(3,40));
}

void keyPressed() {
  text(key,10,10);
  
  switch(key){
    case'q':
    fill(255,0,0);
    break;
    
    case'w':
    fill(255,255,0);
    break;
    
    case'e':
    fill(0,255,0);
    break;
    
    case'r':
    fill(0,0,255);
    break;
    
    case't':
    fill(255);
    ellipse(mouseX,mouseY,25,25);
    break;
    
    case'y':
    fill(0);
    break;
    
    case'u':
    background(255);
    break;
  }
  
}


