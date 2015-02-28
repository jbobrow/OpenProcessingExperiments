
PFont f;

float r; 
float g; 
float b; 
float a; 

float x; 
float y; 



int stageWidth = 400;
int stageHeight = 300;
int thePointX = stageWidth/2;
int thePointY = stageHeight/2;

 


void setup(){
  size(stageWidth, stageHeight); 
  background(255); 
  f=createFont ("Helvética",16,true);
  stroke(255,255,55,165);
  


  fill(255);

  noFill();
  smooth();
  
}

void draw(){
 textFont(f);
 fill(0);
 textAlign (CENTER);
 text("ALAS NOCTURNAS", width/2,30);
 stroke (25);
}

void mousePressed(){
  thePointX = mouseX;
  thePointY = mouseY;
}

void mouseMoved(){
 
  // Each time through draw(), new random numbers are picked for a new ellipse. 
  r = random(255); 
  g = random(255); 
  b = random(255); 
  a = random(255); 
  
  x = random(0); 
  y = random(0); 
   
  // Use values to draw an ellipse 
  noStroke(); 
  fill(r,g,b,a); 
  rect(x,y,width,height);
  
  int bezier1, bezier2, bezier3, bezier4;
  bezier1 = int(random(0, stageWidth+100)-50);
  bezier2 = int(random(0, stageHeight+100)-50);
  bezier3 = int(random(0, stageWidth+100)-50);
  bezier4 = int(random(0, stageHeight+100)-50);
  bezier(thePointX, thePointY, bezier1, bezier2, bezier3, bezier4, mouseX, mouseY);




}


