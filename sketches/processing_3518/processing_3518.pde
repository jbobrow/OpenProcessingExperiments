

void setup() {
  size(500, 500,P3D);
background(0);
}

void draw() {
  
  if(mousePressed) {
    fill(0);
    stroke(random(255),random(255),random(255));
} else {
    stroke(0);
  }
    fill(0);
  for(int i = 0; i < 500; i += 20){ 
      for(int x = 20; x <200 ; x += 40){
 rotate(100);
        ellipse(i, i, pmouseX, pmouseY);
  
  ellipse(x, x,mouseX, pmouseY); 

   }
  }
}

