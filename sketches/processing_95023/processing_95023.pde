
void setup(){
  size(600,500);
  background(255);
}

void draw(){
  background(255,191,112);
  smooth();
  //Checks if mouse is pressed
  //If not then eyes will be drawn
  //If so then a line will be drawn, makes it look like a blink
  if(mousePressed== false){
    stroke(1);
    fill(255);
    bezier(50,300,100,250,200,250,250,300);
    bezier(550,300,500,250,400,250,350,300);
    bezier(50,300,75,380,250,350,250,300);
    bezier(550,300,525,380,350,350,350,300);
    fill(0,0,175);
    ellipse((mouseX/15)+135,(mouseY/23)+293,60,60);
    ellipse((mouseX/15)+425,(mouseY/23)+293,60,60);
    fill(0);
    ellipse((mouseX/15)+135,(mouseY/23)+293,30,30);
    ellipse((mouseX/15)+425,(mouseY/23)+293,30,30);
  } else {
    stroke(1);
    line(50,300,250,300);
    line(550,300,350,300);
  }
  //Draws the rest of the face
  stroke(120,60,15);
  strokeWeight(10);
  noFill();
  bezier(50,250,100,200,200,200,250,250);
  bezier(550,250,500,200,400,200,350,250);
  noStroke();
  strokeWeight(1);
  noFill();
  stroke(1);
  bezier(270,300,270,300,270,600,200,600);
  fill(120,60,15);
  noStroke();
  triangle(-100,0,50,150,800,0);
}


