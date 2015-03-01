
int x = 250;
int y = 250;
// noget med radians???
//float deg = 45.0;
//float rad = radians (deg);

void setup() {
  size(500, 500);
}

void draw() {
  //println radians??
  //println (deg + "degree is" + rad + "radians");
  
background(53, 229, 192);
text("x: "+mouseX+" y: "+mouseY, 10, 15);

//face
stroke(240, 128, 128);
strokeWeight(3);
ellipseMode(CENTER);
fill(250, 177, 177);
ellipse(x, y, 200, 260);

//right eyebrow
strokeWeight(5);
stroke(142, 75, 9);
fill(250, 177, 177);
arc(250, 163, 30, 30, PI, PI+PI);

//left eyebrow
line(214, 166, 191, 158);

//left eye
strokeWeight(3);
stroke(0, 0, 0);
fill(255, 255, 255);
ellipse(200, 170, 20, 15);
fill(0, 0, 0);
ellipse(195, 170, 7, 7);
line(191, 177, 189, 182);
line(197, 181, 196, 186);
line(203, 181, 205, 186);
line(208, 178, 211, 184);

//right eye
stroke(0, 0, 0);
fill(255, 255, 255);
ellipse(250, 170, 20, 15);
fill(0, 0, 0);
ellipse(245, 170, 7, 7);
line(241, 177, 237, 181);
line(248, 180, 246, 185);
line(255, 180, 256, 185);
line(259, 178, 264, 185);

//mouth
if(mousePressed){
stroke(247, 140, 167);
fill(211,17,66);
arc(207, 229, 30, 30, 0, PI+QUARTER_PI, OPEN);
line(196, 220, 222, 230);
}else{
 stroke(247, 140, 167);
 line(194, 231, 223, 231);
}

//cap

stroke(0, 0, 0);
strokeWeight(7);
line(175, 69, 329, 162);
fill(0, 0, 0);
//rotate??
//translate(width/2, height/2);
//rotate(PI/0.1);
arc(285, 138, 100, 100, 3.8, 6.8);  

//



}
