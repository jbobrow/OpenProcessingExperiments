

//face03

//variables
int rightEye_xpos =110;
int eyeWidth = 26;
int mouthHeight = 40;
int redish = 10;




// setup
void setup() {
size(500,500);
smooth();
strokeWeight(3);
strokeCap(ROUND);
fill(255);
}

void draw(){
  background(255);
  float leftEye_xpos = map(mouseX,0,width*2,100,184);
  float rightEye_xpos = map(mouseX,0,width*2, 290, 374);
  float mouthHeight = map(mouseX, 0, width, 0, 120);
  float redish = map(mouseX,0,width,0,80);

ellipse(227,251,380,406);
line(182,53, 175,447);
line(252,50, 263,450);
line(179,304, 258,304);
 
//mouse
line(179,316, 258,313);
line(178,389, 260,386);
line(198,317, 200,387);
line(223,315, 220,387);
line (241,315, 245,386);
line(179, 350+mouthHeight/2, 269,346+mouthHeight/2);

 
//lefteye
fill(255);
ellipse(leftEye_xpos,212, eyeWidth,23);
ellipse(leftEye_xpos,214,eyeWidth,23);
 
 
//righteye
fill(255);
ellipse(rightEye_xpos,190, eyeWidth, 27);
ellipse(rightEye_xpos,185, eyeWidth, 20);

  //red
fill(255,0,0,30);
ellipseMode(CENTER);
//noStroke();
ellipse(rightEye_xpos,300, redish, redish);
ellipse(leftEye_xpos-20,300, redish, redish);
}



