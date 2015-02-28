
void setup(){
  
  size(500, 500);
  smooth();
  rectMode(CENTER);
}

float angle;

void draw(){
  if(mousePressed == true){
   fill(0, 10);
   rect(0, 0, 1000, 1000);
  angle += PI/45;
 
  translate(mouseX, mouseY);

  rotate(angle);

  noStroke();
  fill(255, 80);
 
  rect(0, 0, 5, height);
  rect(0, 0, width, 5);
  
  } else {
   background(255);  
  fill(20);
  rect(width/2, height/2, 5, height);
  rect(width/2, height/2, width, 5);
  }

}
