
void setup(){
  size(400,400);
  background(#E9F7BB);
}

void draw(){
  line(175,125,175,275);
  line(225,125,225,275);
  line(125,175,225,175);
  line(125,225,225,225);
  line(175,125,225,125);
  line(125,175,125,225);
  line(175,275,225,275);
}  
void mouseClicked() {
  
  fill(#E9F7BB);
      rect(175,125,50,50);
      fill(#E9F7BB);
      rect(125,175,50,50);
      fill(#E9F7BB);
      rect(175,225,50,50);
            fill(#E9F7BB);
                  rect(175,175,50,50);
       fill(#E9F7BB);
  ellipse(25,25,25,25);
    fill(#E9F7BB);
  ellipse(25,375,25,25);
    fill(#E9F7BB);
  ellipse(375,25,25,25);
    fill(#E9F7BB);
  ellipse(375, 375,25,25);


  if(mouseX > 175 && mouseX < 225 && mouseY > 125 &&mouseY < 175){
    fill(255);
    rect(175,125,50,50);
    fill(255);
    ellipse(25,25,25,25);
    fill(255);
  ellipse(375,25,25,25);}
    else if(mouseX > 125 && mouseX < 175 && mouseY > 175 &&mouseY < 225){
    fill(255);
    rect(125,175,50,50);
    fill(255);
    ellipse(25,25,25,25);
    fill(255);
    ellipse(25,375,25,25);}
    else if(mouseX > 175 && mouseX < 225 && mouseY > 225 &&mouseY < 275){
      fill(255);
      rect(175,225,50,50);
      fill(255);
    ellipse(375,375,25,25);
    fill(255);
    ellipse(25,375,25,25);}
else if(mouseX > 175 && mouseX < 225 && mouseY > 175 &&mouseY < 225){
      fill(255);
      rect(175,175,50,50);
    fill(255);
      ellipse(25,25,25,25);
    fill(255);
      ellipse(25,375,25,25);
      fill(255);
        ellipse(375,25,25,25);
        fill(255);
          ellipse(375,375,25,25);}
  }


