
int x,y;

void setup(){
  size(500,500);
  background(0);
  colorMode(RGB);
  smooth();
  stroke(255);
  noFill();
 
 x=width/2;
 y=height/2;
  
}

void draw(){
}

void mouseDragged(){
   ellipse(mouseX,mouseY,40,40);
   line(500,500,mouseX,mouseY);
     
}

void keyPressed(){
  switch(key){
    case 'z':
      background(0);
      break;
    case 'x':
      stroke(255,0,0);
      break;
    case 'c':
      stroke(0,255,0);
      break;
    case 'v':
      stroke(0,0,255);
      break;
    case 'b':
      stroke(255,255,0);
      break;
    case 'n':
      stroke(255,13,187);
      break;
    case 'm':
      stroke(13,217,255);
      break;
    case 'a':
      stroke(255,134,13);
      break;
    case 's':
      stroke(255);
      break;    
  }  
}

