
void setup() {
  size(600,600);
  smooth();
  frameRate(5);
}
  void draw(){
    
 //set the background to black
  background(0);
  
   //create the ears
   fill(240,0,0);
 ellipse(200,200,190,150);
 ellipse(400,200,190,150);
 
 //create circle for middle of head
 fill(255,0,0);
 ellipse(width/2,height/2,200,150);
 
 //create eyes

 fill(random(256),random(256),random(256),random(256));
  
 ellipse(270,260,40,40);
 ellipse(330,260,40,40);
 
 //make mouth
 fill(255);
 ellipse(width/2,330,170,70);

//draw lightning

 
  } 


