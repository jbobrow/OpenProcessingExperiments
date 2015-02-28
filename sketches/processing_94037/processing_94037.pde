

//this is executed once
PImage motif;
PImage motif2;
boolean p= false; 
float aspect=0.5; 



void setup() {

  size(500,500);
  stroke(random(0,127), random (0,30), random(0,78));
  strokeWeight(1);
  strokeCap(ROUND);    
  background(127,30,78);
  motif= loadImage("motif11.png"); 
  frameRate(6);
  motif2= loadImage("motif10.png");
}
// this is done over and over
void draw() {
  // this draws the background
  
  fill(127,30,78, 10);
  rect(0,0, 500,500);
  
  
  
  // this draws the line
//  rect(250,250, 50,100);
if(p==false){
  
  line(225,225,mouseX,mouseY);
  stroke(random(0,127), random (0,30), random(0,78));
  aspect= random (0,0.5);
  // image(p image name, x start, y start, with, height);
  image(motif, random(width/2), random(height/2), motif.width*aspect, motif.height*aspect);
  image(motif2, mouseX, mouseY, motif2.width*aspect, motif2.height*aspect);
}
  
}

void keyPressed() {

  if(key== ' ')
  {
    // if program is paused ( aka p == true)
    // then unpause it ( aka set p= false)
    
    if(p== true) 
    
    {
      p=false;
    } 
    
    // else -- meaning otherwise p= false, aka the program is running
    else{
      p= true;
      
     }
  }
}



