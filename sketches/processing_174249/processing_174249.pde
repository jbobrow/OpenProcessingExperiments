
int x,y,p,r,b,g,a,eSize;
 
void setup() {
  size(500, 500);
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
    if(keyCode == SHIFT){
    background(255);//alldelete
    }
    else if(keyCode == ALT){
    background(0);//backgroundblack
    }
  }
   
   
  switch(key) {
  //color
    case '1':
      r=255;
      g=0;
      b=0;
      a=50;
      break;//red
    case '2':
      r=255;
      g=127;
      b=0;
      a=50;
      break;//orange
    case '3':
      r=255;
      g=255;
      b=0;
      a=50;
      break;//yellow
    case '4':
      r=127;
      g=255;
      b=0;
      a=50;
      break;//yellowgreen
    case '5':
      r=0;
      g=255;
      b=0;
      a=50;
      break;//green
    case '6':
      r=0;
      g=255;
      b=127;
      a=50;
      break;//bluegreen
    case '7':
      r=0;
      g=255;
      b=255;
      a=50;
      break;//skyblue
    case '8':
      r=0;
      g=127;
      b=255;
      a=50;
      break;//lightblue
    case '9':
      r=0;
      g=0;
      b=255;
      a=50;
      break;//blue
    case '0':
      r=127;
      g=0;
      b=255;
      a=50;
      break;//purple
    case 'q':
      r=255;
      g=0;
      b=255;
      a=50;
      break;//pink
    case 'w':
      r=255;
      g=0;
      b=127;
      a=50;
      break;//cherrypink
      
    //delete
    case 'e':
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
   
  if(key == 'r'){
    noStroke();
    ellipse(mouseX,mouseY,eSize,eSize);
  }
  else if(key == 't'){
  noStroke();
  rect(mouseX,mouseY,eSize,eSize);
  }
}


