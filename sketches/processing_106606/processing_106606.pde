
float b;
float v;
float i;

void setup() {
  
  size(500,500);
 
  strokeWeight(0.7);
  smooth(8);
  colorMode(HSB);
  b = 0;
  v = 1;
  i = 300;
  
}

void draw() {
  background(0);
  
  if(v == 1) {
    
    b = b + 0.5;
    
  } else {
  
    b = b - 0.5;
    
  }
  
 
  if (b >= (200) ) {
    
   v = 0;
}

  if  (b <= 30) {
  
  v = 1;
}

 stroke(0, 0, 0, b);
 fill(0, 0, 0, b);
  ellipse(width/2, height/2, i, i);
  fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-20, i-20);
  fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-40, i-40);
  ellipse(width/2, height/2, i-60, i-60);
  fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-80, i-80);
  fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-100, i-100);
  fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-120, i-120);
  fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-140, i-140);
  fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-160, i-160);
  fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-180, i-180);
  fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-200, i-200);
    fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-220, i-220);
    fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-240, i-240);
    fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-260, i-260);
      fill(0, 0, 255, b);
  ellipse(width/2, height/2, i-280, i-280);

}
