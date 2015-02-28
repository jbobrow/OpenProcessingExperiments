
int x, y,p; 
int r, g, b; 
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  //fill(0);
  
  r = 0;
  g = 0;
  b = 0;
}
 
void draw() {
}

void mousePressed(){
  fill(r,g,b);
  if(p==0){
  ellipse(mouseX, mouseY, 10, 10);
  }
  else if (p==1){
    rect(mouseX, mouseY, 10, 10);
  }
  else if (p==2){
    rect(mouseX+8, mouseY+8, 10, 10);
    rect(mouseX, mouseY, 10, 10);
  }
}
void mouseDragged(){
  fill(r,g,b);
  if(p==0){
  ellipse(mouseX, mouseY, 10, 10);
  }
  else if (p==1){
    rect(mouseX, mouseY, 10, 10);
  }
  else if (p==2){
    rect(mouseX+8, mouseY+8, 10, 10);
    rect(mouseX, mouseY, 10, 10);
  }
  else if (p==3){
    rect(mouseX-8, mouseY-8, 10, 10);
    rect(mouseX, mouseY, 10, 10);
  }
}


void keyPressed() {
  
 if(key == CODED){
   if(keyCode == SHIFT){
     background(255);
  }
  else if(keyCode==UP){
    p+=1;
    if(p>2){
      p=0;
    }
  
  }
  else if(keyCode==DOWN){
    p-=1;
    if(p<0){
      p=2;
    }
  
  }
 } 
 
 switch(key){ 
    case 'a':
    r = 0;
    g = 0;
    b = 0;
    break;
    case 'q':
    r = 255;
    g = 255;
    b = 255;
    break;
    
   case 'z':
    r = 255;
    g = 0;
    b = 0;
     break;
     
    case 'x':
     r = 0;
     g = 225;   
     b = 0; 
      break;
      
       case 'c':
     r = 255;
     g = 255;   
     b = 0;
      break;
  
  case 'v':
     r = 255;
     g = 0;   
     b = 255;
      break;

     case 'b':
     r = 0;
     g = 0;   
     b = 255;
      break;

     case 'n':
     r = 0;
     g = 255;   
     b = 255;
      break;
      case 'm':
     r = 243;
     g = 152;   
     b = 0;
      break;
      case 's':
     r = 243;
     g = 152;   
     b = 0;
      break;
      
  }
 }


 


