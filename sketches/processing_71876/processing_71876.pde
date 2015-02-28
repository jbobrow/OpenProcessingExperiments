
//well, I got jump to work from last time, and random stars in the background woot...
//anything else? Uh...right.
//I did attempt to get it to flip depending on the directional button
//and make the stars stay put while the llama jumped around
//flip wouldn't stay, randomSeed interfered with body sparkles
//ugh...

void setup()
{

size(800, 600);
ellipseMode(CENTER);
rectMode(CENTER);

}

int localX = 400;
int localY = 400;
int maxJump = localY-100;
int minJump = localY;
int movement = 5;
boolean jumping = false;
boolean falling = false;


void jump() {
  if (keyPressed == true) {
    if (keyCode == LEFT) {
      localX = localX - movement;
    }
    else if (keyCode == RIGHT) {
      localX = localX + movement;
    }
  }
  
  if (localX > width-235) {
   localX = width-235; 
  }
  else if (localX < 235) {
    localX = 235;
  }
  
  if (keyPressed) {
    if ((key == ' ') && (localY == minJump)) {
      jumping = true;
      falling = false;
    }
  }
  
    if (jumping == true) {
    localY = localY - 5;
  }
  if (localY < maxJump) {
    jumping = false;
    falling = true;
  }
    if (falling == true) {
    localY = localY + 5;
  }
  if (localY > minJump) {
   falling = false;
   localY = minJump; 
  } 
}

void sparkle() {
  if ((jumping) || (falling)) {
    scale(random(0.25, 1.2));
}
}

void starry() {
 //randomSeed(0); //interferes with body star twinkle @@
 noStroke();
 fill(255, 255, 255, 150);
  for (int i=1; i < 3;  i++) {
    for (int j=1; j < 3; j++) {
    pushMatrix();
    translate(random(i*1, i*400), random(j*1, j*480));
    rotate(radians(45));
    //rect(i*80, j*60, 10, 10);
    rect(0, 0, 5, 5);
    popMatrix();
    }
  }
}

void drawLlama() {
pushMatrix();

//noStroke();
fill(83, 78, 138);
ellipse(localX-150, localY-190, 20, 40);

//front leg shadowed
beginShape();
vertex(localX-80, localY+10);
bezierVertex(localX-60, localY+70, localX-80, localY+200, localX-80, localY+200);
vertex(localX-130, localY+20);
endShape();
//back leg shadowed
beginShape();
vertex(localX+100, localY-30);
bezierVertex(localX+140, localY+20, localX+110, localY+150, localX+70, localY+200);
bezierVertex(localX+70, localY+150, localX+80, localY+90, localX+60, localY+40);
endShape();

//back wing
fill(92, 136, 174);
strokeWeight(6);
stroke(189, 208, 225);
beginShape();
vertex(localX-10, localY-20);
bezierVertex(localX-50, localY+40, localX-150, localY-50, localX-70, localY-100);
bezierVertex(localX-100, localY-150, localX-40, localY-200, localX+40, localY-170);
endShape();

//chest cloud
fill(176, 205, 229);
stroke(236, 243, 248);
beginShape();
vertex(localX-180, localY-160);
bezierVertex(localX-220, localY-130, localX-210, localY-110, localX-190, localY-100);
bezierVertex(localX-230, localY-90, localX-260, localY-10, localX-190, localY-20);
bezierVertex(localX-200, localY+20, localX-170, localY+20, localX-160, localY+10);
bezierVertex(localX-160, localY+30, localX-130, localY+30, localX-120, localY);
endShape();
bezier(localX-200, localY-50, localX-170, localY-80, localX-150, localY-40, localX-190, localY-20);

//second layer
//tail cloud
beginShape();
vertex(localX+70, localY-70);
bezierVertex(localX+230, localY-100, localX+260, localY+30, localX+210, localY+40);
bezierVertex(localX+230, localY+80, localX+170, localY+120, localX+130, localY+60);
endShape();
noFill();
bezier(localX+190, localY-10, localX+140, localY-30, localX+150, localY+50, localX+210, localY+40);

//neck
noStroke();
fill(118, 114, 166);
beginShape();
vertex(localX-140, localY-170);
bezierVertex(localX-140, localY-170, localX-50, localY-30, localX-20, localY-20);
bezierVertex(localX+30, localY-20, localX-110, localY+30, localX-124, localY+35);
bezierVertex(localX-140, localY+10, localX-180, localY-150, localX-180, localY-150);
endShape();

//extra ear
ellipse(localX-140, localY-190, 20, 40);

//third layer
//head
ellipse(localX-182, localY-160, 90, 50);

//body
ellipse(localX+10, localY+20, 275, 120);

//fourth layer
//front leg
beginShape();
vertex(localX-50, localY+10); //start point of curve
bezierVertex(localX-30, localY+70, localX-50, localY+200, localX-50, localY+200); //1st handle, 2nd handle, end point of curve
vertex(localX-100, localY+20); //final vertex
endShape();
//back leg
beginShape();
vertex(localX+130, localY-30);
bezierVertex(localX+170, localY+20, localX+140, localY+150, localX+100, localY+200);
bezierVertex(localX+100, localY+150, localX+110, localY+90, localX+90, localY+40);
endShape();

//eye
fill(0, 0, 0);
ellipse(localX-175, localY-160, 30, 30);

//fifth layer
//eye shine
fill(255, 255, 255);
ellipse(localX-180, localY-165, 10, 10);

//diamonds
pushMatrix();
translate(localX-140, localY-120);
rotate(radians(45));
sparkle();
rect(0, 0, 18, 18);
popMatrix();

pushMatrix();
translate(localX-105, localY-95);
rotate(radians(45));
sparkle();
rect(0, 0, 10, 10);
popMatrix();

pushMatrix();
translate(localX-115, localY-50);
rotate(radians(45));
sparkle();
rect(0, 0, 25, 25);
popMatrix();

pushMatrix();
translate(localX-75, localY+10);
rotate(radians(45));
sparkle();
rect(0, 0, 35, 35);
popMatrix();

//body squares into diamonds
pushMatrix();
translate(localX-60, localY+80);
rotate(radians(45));
sparkle();
rect(0, 0, 15, 15);
popMatrix();

pushMatrix();
translate(localX-20, localY+50);
rotate(radians(45));
sparkle();
rect(0, 0, 10, 10);
popMatrix();

pushMatrix();
translate(localX+20, localY+5);
rotate(radians(45));
sparkle();
rect(0, 0, 50, 50);
popMatrix();

pushMatrix();
translate(localX+65, localY+40);
rotate(radians(45));
sparkle();
rect(0, 0, 5, 5);
popMatrix();

pushMatrix();
translate(localX+85, localY);
rotate(radians(45));
sparkle();
rect(0, 0, 15, 15);
popMatrix();

pushMatrix();
translate(localX+120, localY+35);
rotate(radians(45));
sparkle();
rect(0, 0, 25, 25);
popMatrix();

//final layer
//wing
fill(176, 205, 229);
strokeWeight(6);
stroke(236, 243, 248);
beginShape();
vertex(localX+20, localY-30);
bezierVertex(localX-20, localY+40, localX-120, localY-50, localX-40, localY-90);
bezierVertex(localX-70, localY-150, localX-10, localY-200, localX+70, localY-170);
bezierVertex(localX+100, localY-180, localX+120, localY-160, localX+120, localY-140);
bezierVertex(localX+140, localY-160, localX+200, localY-160, localX+200, localY-120);
bezierVertex(localX+240, localY-120, localX+240, localY-90, localX+210, localY-70);
bezierVertex(localX+210, localY-30, localX+110, localY+10, localX+80, localY-20);
bezierVertex(localX+80, localY-20, localX+50, localY+10, localX+20, localY-30);
endShape();

//finishing touches
noFill();
bezier(localX+10, localY-140, localX-10, localY-100, localX+140, localY-120, localX+70, localY-170);
bezier(localX+200, localY-120, localX+180, localY-80, localX+150, localY-120, localX+170, localY-130);
bezier(localX+20, localY-30, localX+40, localY-70, localX-20, localY-70, localX-20, localY-50);
bezier(localX+80, localY-20, localX+50, localY-70, localX+160, localY-90, localX+120, localY-40);

popMatrix();
}

//transferred everything to its own function and then called here
void draw()
{
background(37, 32, 78);
starry();
drawLlama();
jump();
}
