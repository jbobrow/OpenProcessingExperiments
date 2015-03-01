

void setup() {

size(400, 400);

}

void draw() {


for (int x = 0; x < width ; x+=30) {

for (int y = 0; y < height; y+=30) {

fill(random(255));
rectMode(CENTER); 
rect(210, 193, 90, 125);
   
  if(mouseX > 150 && mouseX < 250 && mouseY > 150 && mouseY <250) {
     
  fill(0, 0, 255);
  } 
   
  rect(x, y, 30, 30);
  strokeWeight(2);  // Thicker


}
}
}


