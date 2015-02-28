
void setup()
 { 
  size(400, 600);
   background(255, 255, 255);
   smooth(); 

} 


 
 
void draw() 
{ 

  ellipse( mouseX, mouseY, 50, 50 ); 

}
 
 
 void mousePressed()
{
 fill( random(255), random(255), random(255) );
}
