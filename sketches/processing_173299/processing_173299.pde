
boolean tog = false;
void setup(){
  size(440,380);
  colorMode(RGB, 340);
  noCursor();
}

void draw(){


if(!tog){
background(0);
noStroke();
float top = dist(mouseX,mouseY,220,0);
float right = dist(mouseX,mouseY,440,380);
float left =  dist(mouseX,mouseY,0,380);
  fill(top, right, left);
 triangle(0,380,440,380,220,0); 
if(top<440 && right<440 && left<440){
  fill(340);

text("Technicality " + (440-floor(top)), 10, 30);
text("Originality " + (440-floor(right)), 10, 60);
text("Likeability " + (440-floor(left)), 10, 90);

}

else {
fill(340);
text("keep mouse in triangle", 10,30);
}
fill(0);
text("Technicality",180, 90); 
text("Likeability", 30, 360);
text("Originality", 350, 360);
stroke(340);
strokeWeight(10);
point(mouseX, mouseY);
}
}

void mouseClicked(){
  
  tog = !tog;
}


