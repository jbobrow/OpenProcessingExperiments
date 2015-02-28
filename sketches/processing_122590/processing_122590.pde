
int x,y,p,r,b,g,a,eSize;

void setup() {
  size(600, 600);
  noStroke();
  smooth();
  background(255);
  
  r=0;
  b=0;
  g=0;
  a=255;
  eSize=10;
}

void draw(){
}

void keyPressed() {
  
  //alp
  if(key == CODED) {
    if(keyCode == UP){
    a+=20;
    if(a>=255){
      a=255;
    }
    }
    else if(keyCode == DOWN){
    a-=20;
    if(a<=0){
      a=0;
    }
    }
    else if(keyCode == SHIFT){
    background(255);
    }
  }
  
  
  switch(key) {
  //pencolor
    case 'r':
      r=255;
      g=0;
      b=0;
      break;
    case 'g':
      r=0;
      g=255;
      b=0;
      break;
    case 'b':
      r=0;
      g=0;
      b=255;
      break;
    case 'y':
      r=255;
      g=255;
      b=0;
      break;
    case 'c':
      r=0;
      g=255;
      b=255;
      break;
    case 'm':
      r=255;
      g=0;
      b=255;
      break;
    case 'k':
      r=0;
      g=0;
      b=0;
      break;
      
    //kesi
    case 'd':
      r=255;
      g=255;
      b=255;
      a=255;
      break;
    
 }
 }
 
void mousePressed(){
  fill(r,g,b,a);
  if(key == '1'){
    rect(mouseX+random(5,30),mouseY-random(5,30),random(2,10),random(2,10));
    rect(mouseX-random(5,30),mouseY+random(5,30),random(2,10),random(2,10));
    rect(mouseX+random(5,30),mouseY-random(5,30),random(2,10),random(2,10));
    rect(mouseX-random(5,30),mouseY+random(5,30),random(2,10),random(2,10));
  }
  else if(key == '2'){
  ellipse(mouseX,mouseY,eSize,eSize);
  }
}

void mouseDragged() {
  fill(r,g,b,a);
    noStroke();
    ellipse(mouseX,mouseY,eSize,eSize);
  
  if(key == '1'){
    noStroke();
    rect(mouseX+random(5,30),mouseY-random(5,30),random(2,20),random(2,20));
    rect(mouseX-random(5,30),mouseY+random(5,30),random(2,20),random(2,20));
    rect(mouseX+random(5,30),mouseY+random(5,30),random(2,20),random(2,20));
    rect(mouseX-random(5,30),mouseY-random(5,30),random(2,20),random(2,20));
  }
  else if(key == '2'){
  noStroke();
  ellipse(mouseX,mouseY,eSize,eSize);
  }
}







