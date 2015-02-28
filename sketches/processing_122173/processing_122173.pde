
int x, y;   
int c;
 
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  smooth();
    fill(c);
  
  c = 0;
  x = width/2;
  y = height/2;
}
  


 
void draw() {
  //background(255);
  //ellipse(mouseX, mouseY, 10, 10);
}

void mouseDragged(){
    ellipse(mouseX, mouseY, 10, 10);
   if(key == CODED){
    if(keyCode == LEFT){
      rect(mouseX, mouseY, 10, 10);
    }else if(keyCode == UP){
      ellipse(mouseX, mouseY, 30, 30);
    }else if (keyCode == DOWN){
      ellipse(mouseX, mouseY, 1, 1);
    }
  }
   }


void keyPressed() {
  


  
  switch(key) {
    case 'd':
      background(255);    
      break;
    case 'c':
      fill(255);    
      break;
    case 'r':
      fill(255, 0, 0);    
      break;
    case 'b':
      fill(0, 0, 255);
      break;
    case 'y':
      fill(255, 255, 0);
      break;
    case 'g':
      fill(0, 255, 0);
      break;
    case 'k':
      fill(0);
      break;
  }
}

// d=aiiDelete c=kesigomu r=red b=blue y=yellow g=green k=black
//↑=burasibig ↓=burasismall ←=henkeiburasi




