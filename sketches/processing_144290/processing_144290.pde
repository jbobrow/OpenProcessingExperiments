
/* Shim Sang Joon
 201420086
 */

void setup() {
  size(600, 600);
  background(#5DFF8C);
  textSize(20);
}

void draw() {
  noStroke();  
  background(255);
  rect(0, 0, width, height);   

  // grid filled with ellipses  
  for (int i = -10; i < width; i = i +50 ) {  
    for (int j = -10; j < height; j = j +50 ) { 
      strokeWeight(2); 
      stroke(255);  
      noFill();  
      ellipse(i, j, 30, 30);
      ellipse(i, j, 2, 20);
      stroke(0);
      strokeWeight(1);
      fill(#2B9878, 80);
      ellipse(300, 300, 295, 295);
      fill(#90D9FF);
      ellipse(300, 300, minute()*5, minute()*5);
      fill(#9D32EA, 200);
      ellipse(300, 300, hour()*5, hour()*5);
      fill(0, 100);
      ellipse(300, 300, second()*5, second()*5);
      time(width/2, height/2);
    }
  }
}

void time(float a, float b)
{
  fill(#90D9FF);
  text(second(), a+60, b+10);
  text(minute(), a-10, b+10);
  text(hour(), a-80, b+10);
}
