
float i = 0;
void setup () {
  size(600, 600);
  colorMode(HSB);
  noStroke();
  

}
void draw() {
  i=i+0.002;
  float aleatorio = random(0, 250);
  
  float fondo =(127*sin(i))+127;
  float fondob=(127*sin(i+PI))+127;
  background ((aleatorio)+fondo/2, 122, 255);
  for (int i = 500;i>0;i=i-2) {


    stroke((i/2)+(pmouseX/3), 255, 255);
    ellipse(i, 300, i/2, i/2);
    
    
 
    line(mouseX, mouseY, pmouseX, pmouseY);
  

  }
}
