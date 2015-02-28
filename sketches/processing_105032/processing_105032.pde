
void setup() {
  size(400, 370);
  background (255);
  
 
  
 frameRate(10);
}
 
void draw() {
  float m = map(mouseX, 0 , width, 0, 255);
  background(m);

   
  if(mousePressed == true) {
   
    noStroke(); 
  
    for (int i = 20; i < 390; i+=30) {
  
      for (int j = 20 ; j < 375; j = j+30) {
        fill(random(250),random(250),random(250));
        ellipse (i, j, 13, 13);
      }
    }
  }
}
