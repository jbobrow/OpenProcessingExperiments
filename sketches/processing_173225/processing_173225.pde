
void setup() {
  size(400, 400);
  background(30,30,150);
  smooth();
} 

void draw() {
   //sky
    for (int x = 20; x <= width; x += 40) {
    for (int y = 20; y <= height; y += 40) {
      noStroke();
      fill(0);
      ellipse(x, y, 40, 40);
    }
  }
 
  fill(255);
  triangle(180, 200, 120, 140, 130, 100); //left wing1
  triangle(120, 140, 130, 100, 5, 190); //left wing2
  triangle(220, 200, 280, 140, 270, 100); //right wing1
  triangle(395, 190, 280, 140, 270, 100); //right wing2
  triangle(200, 200, 190, 50, 210, 50); //tail 
  fill(0);
  stroke(255);
  triangle(200, 280, ((width/2)-20), 210, ((width/2)+20), 210); //beak
  fill(150);
  stroke(0);
  triangle(200, 270, ((width/2)-5), 210, ((width/2)+5), 210); //beak
  fill(255);
  ellipse(width/2, height/2, 80, 60); //head
  fill(0);
  ellipse(((width/2)-20), 220, 5, 5); //left eye
  ellipse(((width/2)+20), 220, 5, 5); //right eye
  
}



