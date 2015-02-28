
void setup() {   //initial set-up stuff
  size(300,300);
  background(30,144,255);
  smooth();
}

void draw() {
  
if (mouseY < height/3) {  //conditional so that the two images I made will switch when the mouse passes the vertical center of the image
  rectMode(CORNERS);
  noStroke();
  fill(30,144,255);
  rect(0,0,300,250);  //rectangle that makes the blue sky
  fill(0,255,0);
  rect(0,250,300,300);  //grassy ground rectangle
  fill(255,165,0);
  ellipse(width/3,mouseY,50,50);  //sun that moves around
  stroke(0,255,0);
  strokeWeight(5);
  line(width/2,250,width/2,150);  //flower stem
  noStroke();
  fill(255,20,147);
  ellipse(width/2+12,height/2+15,40,40);  //flower petals
  ellipse(width/2-12,height/2+15,40,40);
  ellipse(width/2+18,height/2-10,40,40);
  ellipse(width/2-18,height/2-10,40,40);
  ellipse(width/2,height/2-22,40,40);
  fill(148,0,211);
  ellipse(width/2,height/2,30,30);  //flower center
  
}

if (mouseY > height/2) {  //conditional that makes cold picture appear
  fill(30,144,255);
  rect(0,0,300,250);  //blue sky
  stroke(0);
  strokeWeight(3);
  line(width/2,115,200,95);  //snowman arms
  line(width/2,115,100,95);
  noStroke();
  fill(255);
  rect(0,250,300,300);  //snowy ground
  ellipse(width/2,200,120,120);  //snowman body
  ellipse(width/2,120,80,80);
  ellipse(width/2,60,60,60);
  fill(0);
  ellipse(width/2-10,50,5,5);  //snowman eyes
  ellipse(width/2+10,50,5,5);
  ellipse(width/2,95,5,5);  //snowman buttons
  ellipse(width/2,115,5,5);
  ellipse(width/2,135,5,5);
}
}  //yay it's done and works!  


