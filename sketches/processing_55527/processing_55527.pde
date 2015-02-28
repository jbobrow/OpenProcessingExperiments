
class Crosshere{
  float x;
  float y;
  float speed = 7;
  
Crosshere(float x, float y){//constructor
  x = x;
  y = y;
 }
 
  void moveCross(){
   float distance = dist(x, y, mouseX, mouseY);  
   if(distance > 10){
   float speedx = (mouseX - x)/distance * speed;
   float speedy = (mouseY - y) / distance * speed; 
   x += speedx; 
   y += speedy;}
   else{
     noFill();
     stroke(112,209,156,200);
     rect(x,y,diam,diam); 
     stroke(0);
     rect(x, y,diam+15,diam+15);
   }
 }
 
 void drawCross(){
    stroke(112,209,156,200);
    line(0, y, width, y); 
    line(x, 0, x, height);
    stroke(112,209,156,200);
    strokeWeight(4);
    line(mouseX + 10 , height-pitch, mouseY + 10 + 10, height-pitch);
    sc.playNote(pitch, 100, 1);
    pitch = sc.pcRandomWalk(pitch, 7, sc.MINOR);


 }
}
     

