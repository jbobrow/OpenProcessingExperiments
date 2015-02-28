
int aumenta = 0;

void setup() {
 
  size(500, 500);
  background(234,232,232);
  rect(mouseX,mouseY,10,10);
  colorMode(HSB); 
  fill(aumenta,255,255);

 
}
void draw () {
  fill(247, 243, 95);
  stroke(243, 243, 243);
  ellipse(aumenta, height/2, aumenta, aumenta);
  aumenta = aumenta + 15;
  fill(82, 245, 205);
  stroke(45, 245, 205);
   triangle(aumenta, height/2, 156, 145, 200, 158); 
   triangle(aumenta, height/4, 156, 145, 200, 158); 
    triangle(aumenta, height/8, 156, 145, 200, 158); 
     triangle(aumenta, height/10, 156, 145, 200, 158); 
      triangle(aumenta, height/12, 156, 145, 200, 158); 
       triangle(aumenta, height/14, 156, 145, 200, 158); 
        triangle(aumenta, height/16, 156, 145, 200, 158); 
         triangle(aumenta, height/18, 156, 145, 200, 158); 
          triangle(aumenta, height/20, 156, 145, 200, 158); 
           triangle(aumenta, height/22, 156, 145, 200, 158); 
            triangle(aumenta, height/24, 156, 145, 200, 158);
  fill(255,157,8);
  rect(mouseX,mouseY,25,25);
 
  fill(255,157,8);
  
  stroke(243, 243, 243);
  ellipse(aumenta, height/2, aumenta, aumenta);
  aumenta = aumenta + 15;
  ellipse(aumenta, height/2, aumenta, aumenta);
  aumenta = aumenta + 15;

}
