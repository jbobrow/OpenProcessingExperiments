
void setup (){
  size(500,500);
  smooth();
  background(24);
  stroke(random(25),random(100));
}
 
void draw(){
 // background(255);
  fill(255,10);
  rect(0,0,width,height);
   
    for ( int x=0; x<=width; x+=50) {
      for ( int y=0; y<= height; y+=10){
       float abstand = dist (mouseX,mouseY,x,y);
      // abstand /=5;
     // ellipse(x,y,abstand,abstand);
    float angle = atan2(mouseY-y,mouseX-x);
     pushMatrix();
     translate(x,y);
     rotate(angle);
     ellipse(12,23,10,10);
     line(35,15,10,0);
     popMatrix();
     }}}
 
    

