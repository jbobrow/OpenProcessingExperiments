
void setup()  {
size(715, 402);
smooth();
background(235);

}
  
 void draw()   {
   frameRate(12);
  if (mousePressed == true)  {
  int i = int(random(715));
  float r = random(255);
  float x = random(0, width);
  strokeWeight(random(20));
  stroke(r - random(1, 100), r - random(0, 50), r, 100);
  line(mouseX + random(100), 0, x, height);
}
 }
 
  void keyPressed()   {
 
  if (key == 'z')  {
       background(235);
       strokeWeight(10);
    }
   
   
    if (key == 'a')  {
  
         stroke(0);
         strokeWeight(1);
         rect(random(715), random(402), 715, 10);
       }
       
       if (key == 's')  {
  
         stroke(0);
         strokeWeight(1);
         rect(random(715), random(402), 10, 402);
       }
    
   
   
   
   
 }
 
 
   
   
    
   

