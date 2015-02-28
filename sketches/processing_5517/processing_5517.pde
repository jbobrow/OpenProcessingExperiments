
float angle  = 0.00;  float angle2  = 0.00;
float side = 200;
void setup(){
  size(600,450,P3D);
  stroke(255);
     }
void draw(){
  background(0);  
  angle = ((PI*2)/width)*mouseX ;  
  angle2 = ((PI*2)/height)*mouseY ;  
 translate(width/2, height/2, 0);
  
  rotateY(angle);
  rotateX(angle2);
  fill(255,0,0);    
box(side, side, side);    //all the sides of the box 150 pixels    
fill(255,255,255,150);
box(side+1, side, side);           //+  only one pixel
}


