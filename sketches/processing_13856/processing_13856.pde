
void setup(){
  size(300, 300);
  background(255);
  smooth();
}
 
 float a, i = 0.0;
 
  
 void draw(){
  strokeWeight (0.01);
  
  a = (a * 3 % 170)+20;
  for (int i = 0; i < 400; i= i + 10){
  line(mouseX, mouseY, i, a*2);
  //line(0, a, i, 0);
  //line(a, i%180, a, i);
   }
}
                                                
