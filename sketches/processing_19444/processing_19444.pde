
void setup(){
  size(250,250);
  background(250);
  fill(0,30);
  smooth();
  noStroke();

}

void draw(){
  rect(pmouseX+140, pmouseX,5,5);
  rect(mouseX+70, mouseX-40, 17,17);
    rect(mouseY-30, mouseY+10, 60,60);
  // two grey square lines
    strokeWeight(1);
  stroke(204,204,30);
  rect(mouseX+70, mouseX-40, 17,17);
  // black square line with yellow border


if(mousePressed){
  stroke(204,204,30);
  //colour change of a square when mouse pressed

}

else{
  stroke(random(-50,250));
  //range of colour change of the border around squares
}

}


