
float x;
float y;
float targetX, targetY;
float easing = 0.006;
float dx, dy;
int mid = 238;
float tx = 0;
float tx2 = 0;
int h = hour();
float shutdown = 0;
float shutdown2 = 1;
float sleep = 0;


void setup() {

  size(480,320);
  background(244);
  smooth();
  noCursor();
}


void draw() {
background (255-(abs(12-h)*31.25));

  //GOBI
  pushMatrix();
  float rx = map(mouseY-8,0,height,-0.3,0.4); // smoothing out the leaf
  float sx = map(y,0,height,0.5,1.5); // smoothing out the shadow
  dx = abs(mouseX-x); // distance between sun and Gobi
  dy = abs(mouseY-y);
  
  //SHADOW
  pushMatrix();
  beginShape();
  translate(mid,290);
  scale(sx);
  translate((1/sx)*(x - width/2),0);
  fill(0,40);
  noStroke();
  ellipse(0,0,100,30);
  endShape();
  popMatrix();
  stroke(2);

  //KEYS
  if((keyPressed == true) && (keyCode == DOWN)) {
    h = 24;
  }
  if ((keyPressed == true) && (keyCode == UP)) {
    h = 12;
  }
  if ((keyPressed == true) && (keyCode == LEFT)) {
    h = hour();
  }
   
  //GOBI ON AND SHUTDOWN
  if ((h > 19) || h < 6) {
    targetY = 185;
    float dy = targetY - y;
      if(abs(dy) > 1) {
        y += dy*easing;
      }
    translate ((x-width/2),(y-height/2));
  }
  else {
    targetX = mouseX;
    dx = mouseX - x;
      if(abs(dx) > 1) {
        x += dx*easing;
      }
    targetY = mouseY;
    dy = mouseY - y;
      if(abs(dy) > 1) {
        y += dy*easing;
      } 
      if(y>185){ //establishing the ground
        y=185;
       }
    translate(x-width/2, (y-height/2)); 
  }
    
  //body
  strokeWeight(2);
  fill(190);
  beginShape();
  vertex(161,103);
  bezierVertex(116,153,161,225,161,225);
  bezierVertex(197,261,233,261,237,261);
  vertex(242,261);
  bezierVertex(278,261,314,225,314,225);
  vertex(314,225);
  bezierVertex(359,153,314,103.5,314,103.5);
  endShape();
  //top side
  fill(220);
  ellipse(237.5,103.5,155,60);
  fill(200);
  strokeWeight(1);
  ellipse(237.5,110,141.5,50);
  fill(0);
  ellipse(237.5,94.85,45,9);
  fill(100);
  arc(237.5,94.85,45,9,PI,TWO_PI);
  noFill();
  
  //leaves
  pushMatrix();
  strokeWeight(1);
  beginShape();
  translate(224,99);
  tx += PI/(20+(abs(12-h)*8));
  if((h<7) || (h > 19)) {
    rotate(0);
  }
  else {
    rotate(((sin(tx)/4)+0.2)*shutdown2);
  }  
  fill(40,242,15);
  vertex(0,5);
  bezierVertex(-18,-44,-117,-46,-117,-47);
  bezierVertex(-135,-46,-117,-64,-117,-64);
  bezierVertex(-108,-73,-90,-73,-90,-73);
  bezierVertex(0,-64,9,-1,8,8);
  endShape();
  popMatrix();
  
  pushMatrix();
  strokeWeight(1);
  beginShape();
  translate(251,99);
  tx2 += PI/(20+(abs(12-h)*8));
  if((h < 7) || (h > 19)) {
    rotate(0);
  }
  else {
    rotate((sin(-tx2)/4)-0.2);
  }  
  vertex(0,5);
  bezierVertex(18,-44,117,-46,117,-47);
  bezierVertex(135,-46,117,-64,117,-64);
  bezierVertex(108,-73,90,-73,90,-73);
  bezierVertex(0,-63,-9,0,-9,8);
  endShape ();
  popMatrix();
  
  //leaf tuck in
  beginShape();
  stroke(0,1);
  fill(200);
  vertex(214,96);
  bezierVertex(241,107,259,96,259,96);
  vertex(295,115);
  vertex(178,115);
  endShape();

  //mouth
  fill(170);
  stroke(1);
  arc(237, 260, 200, 100, PI+0.73, TWO_PI-0.73);
  noFill();
  arc(237, 270, 190, 100, PI+0.8, TWO_PI-0.8);

  //bolts
  fill(220);
  ellipse(165.5,211.5,9,9);
  ellipse(309.5,211.5,9,9);
  stroke(255);
  line(167,207,165,216);
  line(311,216,309,206);

  //buttons
  if ((abs(dx) < 60) && (abs(dy) < 60)) {
    fill (36,247,5);
    rect(230,195,5,5);
    rect(235,195,5,5);
    rect(240,195,5,5);
    rect(245,195,5,5);
  }
  else {
    fill(random(0,255), random(0,255), random(0,255));
    rect(230,195,5,5);
    fill(random(0,255), random(0,255), random(0,255));
    rect(235,195,5,5);
    fill(random(0,255), random(0,255), random(0,255));
    rect(240,195,5,5);
    fill(random(0,255), random(0,255), random(0,255));
    rect(245,195,5,5);
  }
  
  //WAKING UP, SHUTTING DOWN
  if ((h > 18) || (h < 7)) {
    fill (247,143,5);
    rect(230,195,5,5);
    rect(235,195,5,5);
    rect(240,195,5,5);
    rect(245,195,5,5);
  }
  if ((h > 19) || (h < 6)) {
    fill (0);
    rect(230,195,5,5);
    rect(235,195,5,5);
    rect(240,195,5,5);
    rect(245,195,5,5);
  }
  fill(255);

  //arms
  stroke(0);
  strokeWeight(1);
  fill(220);
  beginShape();
  vertex(133,189);
  vertex(142,207);
  vertex(115,225);
  vertex(106,225);
  endShape(CLOSE);
  beginShape();
  vertex(342,189);
  vertex(369,225);
  vertex(360,225);
  vertex(333,207);
  endShape(CLOSE);
  
  //left eye
  pushMatrix();
  translate(179,167);
  if ((h>18) || (h<8)) {
    rotate(10/(dx));
  }
  else {
     rotate(100/(dx));
  }
  fill(170);
  strokeWeight(1);
  ellipse(0,0,72,72);
  fill(200);
  strokeWeight(2);
  ellipse(0,0,52,52);
  strokeWeight(1);
  line(-26,0,26,0);
  line(-26,2,26,2);
  stroke(255,201,3);
  line(-26,1,26,1);
  stroke(0);
  popMatrix();
  
  //right eye
  pushMatrix();
  translate(296,167);
  if ((h>18) || (h<8)) {
     rotate(10/(-dx));
  }
  else {
    rotate(100/(-dx));
  }
  fill(170);
  strokeWeight(1);
  ellipse(0,0,72,72);
  fill(200);
  strokeWeight(2);
  ellipse(0,0,52,52);
  strokeWeight(1);
  line(-26,0,26,0);
  line(-26,2,26,2);
  stroke(255,201,3);
  line(-26,1,26,1);
  stroke(0);
  popMatrix();
  
  popMatrix();
  //END GOBI
  
  //SUN
  noStroke();
  fill(255,236,157,80);
  for (int s = 15*(7-abs(12-h)); s > 0; s -= 10){
    ellipse(mouseX,mouseY,s,s);
  }
  
  stroke(1);
 
}











