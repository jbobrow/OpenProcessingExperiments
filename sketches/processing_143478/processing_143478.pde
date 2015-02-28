

/*name: JU Hwiyeon  
 ID:201420109
 
 
 */
void setup() {   
  size(600, 600);
}   

float x;
float angle;
float direction;

void draw() {   
  noStroke();   
  translate(width/2, height/2); 
  angle += 0.001;
  background (0);
  //  ellipses   
  for (int i = -310; i < width; i = i +50) {   
    for (int j = -310; j < height; j = j +50 ) {   
      rotate(angle); 
      stroke(255);   
      strokeWeight(6);   
      noFill();   
      ellipse(i, j, 100, 100);
      ellipse(i, j, 50, 50);
    }
  }
  strokeWeight(10);
  stroke(#ED7FD5);
  noFill();
  ellipse (100, 300, x, x);
  ellipse (-100, -300, x, x);
  ellipse (-100, 300, x, x);
  ellipse (100, -300, x, x);
  ellipse (300, -100, x, x);
  ellipse (300, 100, x, x);
  ellipse (-300, -100, x, x);
  ellipse (-300, 100, x, x);

  if (x>2000) {
    x=100;
  }
  x=x+30;
}

