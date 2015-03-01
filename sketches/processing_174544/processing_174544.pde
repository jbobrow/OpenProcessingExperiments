
//click the mouse to make ripples!
//"fish" follow the light of the mouse!



int r=0;
int count=0;

int[] xpos = new int[50]; 
int[] ypos = new int[50];

void setup() {
  size(500,500);
  
  smooth();

  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
    
 displayRipple();
 resetRipple();
}

void displayRipple(){
  noFill();
  strokeWeight(4);
  stroke(180,180,255,200);
  ellipse (mouseX, mouseY, r, r);  
 }

void resetRipple(){
  r=0;
}
  

void draw() {
  background(255);
  
  fill(mouseX/2, mouseY/2);
  rect(0,0,500,500);
 
  for (int i = 0; i < xpos.length-1; i ++ ) {
    
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  xpos[xpos.length-1] = mouseX; 
  ypos[ypos.length-1] = mouseY;
   
  for (int i = 0; i < xpos.length; i ++ ) {
    noStroke();
    fill(150-i*4,100);
    ellipse(xpos[i],ypos[i],i,i);
    fill(200,235,255,20);
    rect(0,0,500,500);
    
  } 
  
  
  if (mousePressed == true){
  resetRipple();
  displayRipple();
  r+=50;
  }
  
  
  if (mousePressed == false){
    displayRipple();
    r+=50;
    
  }
 
}
 



