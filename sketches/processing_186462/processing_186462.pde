
void setup(){
  size(600,600);
  background(200,250,250);
   
   
}
void draw() {
 //px= px+ 1;
  //ellipse(px, 300, px, px);
   
    
      
     
          
  ellipse(mouseX, mouseY, 50, 50);
  fill(100);
  stroke(200);
   if (mousePressed){
     int[] posX = new int[30];
int[] posY = new int[30];
 

  if (mousePressed) {
translate(mouseX,mouseY);
  rotate(frameCount/10.0);
  if (mousePressed) {
      fill(250,100,250);
    ellipse(30,10, 30,10);
  rotate(frameCount/20.0);
      fill(250,255,150);   
      ellipse(60,30, 50,10);
  rotate(frameCount/15.0);
     fill(100,255,50);
    ellipse(20,30, 25,30);
  }
}
}
 
{
  if (key=='c' || key=='C') {
    background(10,250,250);
} }

              
     }
 


   


