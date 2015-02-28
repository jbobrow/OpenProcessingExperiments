
float x = 0;
float sw = 0.1;

void setup(){
  size(250, 250);
  smooth();
}

void draw(){ 
  background(#EDEBE6);
  strokeWeight(sw);
  noFill();
  frameRate(20);
  
  stroke(#D6E1C7, 150); //darker green
  ellipse(pmouseX, pmouseY, x, random(250));
  stroke(#94C7B6, 150);
  ellipse(pmouseX, pmouseY, x, random(250));
  stroke(#403B33, 150);
  ellipse(pmouseX, pmouseY, x, random(250));
  stroke(#D3643B, 150); // lightest green
  ellipse(pmouseX, pmouseY, x, random(250));
  x += 5;
  
  if(x > 250){
    x = -50;
  }
}

void mouseDragged(){
  sw+=0.5; //dragging increases stroke weight
}

void mouseReleased(){
  sw = 0.1; //releasing restarts stroke weight
  x = 0;
}



