
int mouthsize= 10;
int mouthgrowthrate;
int teeth= 280;
int teethgrowthrate;
// for the 'moving picture'

void setup() {
  size(400, 400);
  // I want to make the all line look smooth
  smooth();
  // 'Fat' help the line look smooth
  strokeWeight(5);
  mouthgrowthrate = 1;
  teethgrowthrate = 1;
}
void draw() {
  //First, let's make two purple ears
  fill(250);
  background(100, 100, 110);
  //let's setting the moving parts - mouth and teeth
  if (mouthsize >= 150) {
    mouthgrowthrate= -1;
  } 
  else if ( mouthsize<=0) {
    mouthgrowthrate=1;
  }
  mouthsize= mouthsize + mouthgrowthrate;
  if (teeth >= 300) {
    teethgrowthrate= -3;
  } 
  else if ( teeth <= 280) {
    teethgrowthrate= 3;
  }
  teeth= teeth+ teethgrowthrate;
  stroke(50);

  fill(175, 69, 229);
  triangle(60, 140, 130, 65, 50, 50);
  triangle(340, 140, 270, 65, 350, 50);
  //Point the ear hole by 'rect'function
  strokeWeight(20);
  stroke(40, 10, 50);
  rect(80, 80, 2, mouseX/ 40);
  rect(320, 80, 2, mouseY/ 40);
  //whole circle(face) paints in pink
  strokeWeight(5);
  fill(255, 200, 230);
  stroke(220, 90, 140);
  //the head centered at 200, 200 with width 300 and height 300
  ellipse(200, 200, 300, 300);
  //Point the nose by 'point' function and make smellers by 'line' function
  stroke(100);
  strokeWeight(25);
  point(200, 200);
  strokeWeight(1);
  line(200, 200, 100, 200);
  line(200, 200, 300, 200);
  line(200, 200, 120, 180);
  line(200, 200, 280, 180);
  line(200, 200, 120, 220);
  line(200, 200, 280, 220);
  //make the eyes by using 'quad'
  strokeWeight(3);
  fill(240, 240, 220);
  quad(90, 150, 130, 130, 170, 150, 130, 160);
  quad(310, 150, 270, 130, 230, 150, 270, 160);
  strokeWeight(1);
  fill(50, 90, 210);

  //and interactive purpil
  ellipse(130, 147, mouseY / 10, mouseX / 15 );
  ellipse(270, 147, mouseX / 10, mouseY / 15 );

  //and change the image when we have pressed mouse button
  if (mousePressed) {
    clear();
  }
  if (mousePressed) {
    background(mouseX+mouseY, mouseX, mouseY);
    fill(250, 20, 50);
    ellipse(130, 147, 15, 15);
    ellipse(270, 147, 15, 15);
    fill(250, 30, 80);
    triangle(60, 140, 130, 65, 50, 50);
    triangle(340, 140, 270, 65, 350, 50);
    //show white teeth
    fill(255, 255, 255);
    triangle(120, 260, 140, 260, 130, teeth);
    triangle(280, 260, 260, 260, 270, teeth);
  }
  strokeWeight(1);
  //make the movable mouth by using 'arc'
  fill(230, 10, 40);
  arc(200, 260, 180, mouthsize, 0, PI);
  if (mousePressed) {
    mouthsize = 10;
  }
}
