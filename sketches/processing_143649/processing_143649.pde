
//* JU Hwiyeon
//* 201420109


void setup()
{
  size(600,600);
background(0);
smooth();
noLoop();
}

void draw(){
      stroke(255);    
      strokeWeight(6);    
      noFill();
for (int i = -310; i < width; i = i +50) {    
for (int j = -310; j < height; j = j +50){    
      ellipse(i, j, 100, 100); 
      ellipse(i, j, 50, 70); 
}
}
}
