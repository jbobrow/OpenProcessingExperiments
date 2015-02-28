
void setup()
 { 
  size(600, 800);
   background(0, 255, 0);
   smooth();
   frameRate(60);
 } 


void draw() 
{ 
  fill( 0,random(255),0  );
  rect( 0,0,width,height );
  image(loadImage("ducks.png"), mouseX, mouseY, mouseY*.5, mouseY*.5);
 
 
 }



 


