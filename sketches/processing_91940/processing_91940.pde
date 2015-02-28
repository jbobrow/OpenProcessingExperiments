
color from = color(random(0,50),random(0,50),random(190,255));
color to = color(random(190,255),random(190,255),random(0,50));

void setup(){
size(600,300);

}

void draw(){
   background(50);
   text("click the red button",width/2, 300);
  fill(180,0,0);
 ellipse(75,75,50,50);

fill(from);
rect(100, 100, 100, 100);
fill(to);
rect(400, 100, 100, 100);

  if(dist(mouseX, mouseY, 75, 75) < 25){
      textSize(32);
      fill(0, 102, 153);
      text("left click for new box colors,", 50,250);
      text(" right click to interpolate!",50,275);
     fill(255,0,0);
    }
    
if(mousePressed && (mouseButton == LEFT) && dist(mouseX,mouseY,75,75)<25){
//from = color(random(25,50),random(25,50),random(190,255));
// to = color(random(190,255),random(80,190),random(0,50));
from =color(random(255),random(255),random(255));
to =color(random(255),random(255),random(255));
fill(from);
rect(100, 100, 100, 100);
fill(to);
rect(400, 100, 100, 100);
  } else if (mousePressed && (mouseButton == RIGHT) && dist(mouseX,mouseY,75,75)<25) {
color interA = lerpColor(from, to, .33);
color interB = lerpColor(from, to, .66);
fill(interA);
rect(200, 100, 100, 100);
fill(interB);
rect(300, 100, 100, 100);




  } }

