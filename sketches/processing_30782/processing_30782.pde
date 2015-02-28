
void setup(){
  background(mouseX,mouseY);
  size(250,250);
}
 void draw(){ 
   if(mousePressed==true){
 ellipseMode(CENTER); 
 rectMode(CENTER);
 stroke(250);
 fill(mouseX);
 rect(100,100,20,100);
 fill(mouseY);
 ellipse(100,70,60,60);
 fill(10);
 ellipse(81,70,16,32);
 ellipse(119,70,16,32);
 stroke(250);
 line(90,150,80,160);
 line(110,150,120,160);
 line(90,100,80,110);
 line(110,100,120,110);
   }
 }

