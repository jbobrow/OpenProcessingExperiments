
void setup () {
  size(500,500);
  strokeWeight(random (10) );
  frameRate(5);
}

void draw(){
   background (random(0,345) , random(0,115), random(0,235));
  stroke (54);
line(random(30), 25, random(340), 300);
stroke(100);
rect(100, 150, random(80), 80);
fill(235);
ellipse(100, 300, random(35), 50);
fill(159);
stroke(130);
ellipse(200, 45, 90, random(65));
fill(450);
stroke(89);
line(450, 45, 100, random(199));
stroke(35);
frameRate(5);
rect(200, 280, 45, random(100));
fill(108);
rect(225, 119, random(39),89);
fill(25);
line(random(300), random(208), 128, 35);
stroke(105);
line(102, random(430), 25, random(89));
stroke(15);
ellipse(380, 210, random(35), random(58));
rect(300, 340, random(109), 25);
fill(58);
ellipse(400, 23, 57, random(80));
line(random(240), 1, random(320), 500);
stroke(1);
line(354, random(1), 80, random(508));
stroke(0);
ellipse(350, 109, random(70), 70);
ellipse(175, 439, 90, random(101));


}
