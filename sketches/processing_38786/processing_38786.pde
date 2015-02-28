
PFont f;

void setup(){
 background(255);
 size(400,400); 
 f = createFont("Arial",12,true); 

  textFont(f);       
  fill(0);

  textAlign(LEFT);
  text("Up: Increase Radius   Down: Decrease Radius ",10,15);
  text("Left: Decrease Density   Right: Increase Density ",10,35);
  text("0: Black Spray   1: Blue Spray   2: Red Spray   3: Green Spray   ",10,55);
  text("Left: Decrease Density   Right: Increase Density",10,75); 
  text("S: Save Screenshot   Delete: Clear Screen",10,95);
  text("Press Delete to Start!",10,125);
 
}

float radius=20;
float density=250;

void draw(){
 //Spraypaints a circle shape 
 if (mousePressed && (mouseButton == LEFT)) {
 for(int i=0;i<density;i++){
  
  float rndX=random(2*radius)-radius;
  float rndY=random(2*radius)-radius;
  
  if(dist(mouseX+rndX,mouseY+rndY,mouseX,mouseY) <= radius){
    
    point(mouseX+rndX,mouseY+rndY); 
   } 
 } 
 }  
}

//Clears screen if Delete is pressed
void keyPressed() {
  if (key == DELETE) 
    background(255);
  else if (key == '0')
    stroke(0,0,0);  
  else if (key == '1')
    stroke(255,36,0);
  else if (key == '2')
    stroke(63,225,0);
  else if (key == '3')
    stroke(65,105,225);
  else if (key == 's' || key == 'S')
    saveFrame("sketch-####.tif");
    
    
  else if (key == CODED)
  
    if (keyCode == UP) 
      if(radius <=200)
         radius = radius +5;
        
    if (keyCode == DOWN)
      if(radius >0)
         radius = radius -5;
         
    if (keyCode == LEFT)
      if(density >0)
          density = density -10;
    
    if (keyCode == RIGHT)
      if(density <=1000)
         density = density +10;
       
}


