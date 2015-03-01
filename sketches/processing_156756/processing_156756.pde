
int diameter = 50;
int divisor = 20;

void setup() {
  size(600, 600);
  background(0);
  
}

void draw() {
  smooth();
  stroke(4, 196, 129);
  fill(64, 143, 255);
  for(int i = height/divisor; i < height; i += height/divisor){
    for(int x = width/divisor; x < width; x += width/divisor){
      if (dist(mouseX, mouseY, x, i) < diameter / 2){
      
        fill(0);
                if(mouseX > 200) {
            fill(255);
      } 
          if(mouseX>400) {
              fill(64, 143, 255);
          }
        ellipse(x, i, diameter, diameter);
        


    }
  
}
  }
}







