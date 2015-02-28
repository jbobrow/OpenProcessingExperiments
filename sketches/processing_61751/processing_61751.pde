
void setup(){
size(400, 400);
background(60);
  smooth();  
  fill(#FF1CAE);
  rect(0, 0, 200, 200);
  fill(#FFFF00);
  rect(200, 0, 200, 200);
  fill(#7CFC00);
  rect(0, 200, 200, 200);
  fill(#00B2EE);
  rect(200, 200, 200, 200);
}

void draw(){
  frameRate(1000);
  if (mousePressed==false){
    noStroke();
    noFill();
  }
  if ((mousePressed==true)&&(mouseX<=200)&&(mouseY<=200)){
    stroke(#FFFF00);
  }
  else if ((mousePressed==true)&&(mouseX>=200)&&(mouseY<=200)){
    stroke(#00B2EE);
  }
  else if ((mousePressed==true)&&(mouseX<=200)&&(mouseY>=200)){
    stroke(#FF1CAE);
  }
  else if ((mousePressed==true)&&(mouseX>=200)&&(mouseY>=200)){
    stroke(#7CFC00);
  }    
  
strokeWeight(4);
line(mouseX, mouseY, pmouseX, pmouseY);

  stroke(255);
  strokeWeight(3);
  line(200, 0, 200, 400);
  line(0, 200, 400, 200);
  }

