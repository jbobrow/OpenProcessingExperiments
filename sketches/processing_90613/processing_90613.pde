
/*

My first sketch in Processing. Monster sketch.
Kathleen Judge February 2013

*/

void setup(){
  size(600,600);
  smooth();
  rectMode(CENTER);
}

void draw(){
  background(68);

//body
//style
strokeJoin(ROUND);
stroke(255,0, 0);
fill(255, 0, 0);
rect(300, 500, 500, 300);

//hair
//style
noStroke();
fill(255, 0, 0);
triangle(310, 30, 330, 170, 350, 110);
triangle(270, 110, 230, 150, 200, 30);

//head
//style
noStroke();
fill(205, 205, 0);
ellipse(width/2, height/2 + 75, 200, 200);
rect(300, 250, 199, 280);

//rt eye
//style
strokeWeight (25);
stroke(238, 232, 170);
fill(0, 0, 0);
ellipse(375, 210, 40, 50);

//lft eye
//style
strokeWeight (30);
stroke(238, 232, 170);
fill(0, 0, 0);
ellipse(225, 210, 50, 50);
 
//nose
//style
strokeWeight (20);
stroke(238, 232, 170);
fill(0, 0, 0);
ellipse(310, 270, 10, 90);

//mouth
//style
strokeWeight (8);
stroke(255, 0, 0);
fill(0, 0, 0);
curve(50, 200, 350, 360, 250, 320, 400, 50);

}


