
void setup()
 { 
  size(400, 600);
   background(255, 255, 255);
   smooth();
   frameRate(100); 

} 


void draw() 
{  
 text("i love jessssa otte!",random(1500),random(900));
 rect(mouseX,mouseY,100,100);
 stroke(0,0,0);
 //strokeWeight();
 fill(random(255),random(255),random(255));
}
