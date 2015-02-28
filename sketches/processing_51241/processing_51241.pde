
// SIMONE ROTH, PS1_2  // 


void setup () {
  size (400, 400);
 smooth();
}
 

void draw(){

  
if (mousePressed==false) {

  fill(171, 213, 245);
  rect(0, 0, 400, 170);
  fill(175, 245, 171);
  rect(0, 170, 400, 400);

// background decorations

strokeWeight(1);

// right ear
  fill(234, 232, 232);
  ellipse (150, 100, 60, 180);
  
  
  // left ear
  ellipse (250, 100, 60, 180);
  fill(234, 232, 232);
  
// right inner ear
fill(234, 194, 222);
ellipse (150, 90, 50, 100);


// left inner ear
fill(234, 194, 222);
ellipse(250, 90, 50, 100);


//// head
 fill(234, 232, 232);
  ellipse (200, 200, 200, 200);
  
  // left tooth
  fill(255, 245, 252);  
rect (179, 275, 20, 55);

// right tooth
fill(255, 245, 252);
rect (201, 275, 20, 55);

// left eye
  ellipse (180, 175, 35, 50);
  
// right eye
  ellipse (220, 175, 35, 50);
  
// mouth left
  fill(252, 245, 217);
  ellipse (166, 260, 70, 70);
  
// mouth right
  fill(252, 245, 217);
  ellipse (233, 260, 70, 70);
  
// mouth top
fill(234, 173, 234);
  triangle(170, 225, 230, 225, 200, 276);
  
// left pupil
fill(207, 244, 250);
ellipse(180, 175, 20, 30);

// right pupil
fill(207, 244, 250);
ellipse(220, 175, 20, 30);


// whiskers 

line (175, 250, 90, 250);
line(175, 250, 85, 240);
line(175, 250, 80, 260);
line(225, 250, 300, 250);
line(225, 250, 310, 240);
line(225, 250, 305, 260);
strokeWeight(1.5);


}
}

