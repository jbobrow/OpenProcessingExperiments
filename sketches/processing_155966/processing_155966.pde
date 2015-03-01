
int monsterX = 300;
int monsterY = 300;
int eyeX = 275;
int eyeY = 145;

void setup(){
  size(600, 600);
//  background(176,240,242);
}

void draw(){
  background(176,240,242);
  
 //Body
 noStroke();
  fill(134, 133, 114);
  
  //Ears
 arc(eyeX, eyeY, 80, 80, 0, PI+QUARTER_PI, PI);
 arc(327, eyeY, 80, 80, -0.75, PI+QUARTER_PI, PI);
 
 //Upper Body 
  ellipse(monsterX, 200, 150,-175);

//Arms
arc(195, 225, 15, 15, -3, PI+QUARTER_PI, OPEN);
arc(405, 225, 15, 15, -3, PI+QUARTER_PI, OPEN);
 
//Legs
arc(250, 425, 15, 15, 0, PI+QUARTER_PI, OPEN);
arc(350, 425, 15, 15, -1, PI+QUARTER_PI, OPEN);
 
 //Lower Body
  ellipse(monsterX, monsterY, 250, -275);
  fill(252, 251, 229);
  ellipse(monsterX, 325, 200,-185);
 
 //Mouth
 fill(255);
 ellipse(monsterX, 175, 115, -25);

 //Eyes 
ellipseMode(RADIUS);
fill(255);
ellipse(eyeX, eyeY, 12, 12);
ellipseMode(CENTER);
fill(random(216), random(110), random(74));
ellipse(eyeX, eyeY, 7, 7);
ellipseMode(RADIUS);
fill(255);
ellipse(325, eyeY, 12, 12);
ellipseMode(CENTER);
fill(random(216), random(110), random(74));
ellipse(325, eyeY, 7, 7);
}


