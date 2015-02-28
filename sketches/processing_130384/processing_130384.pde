
//charlotte stiles (c) 2014
//cstiles
//Spy Cat!
//Click anywhere to disco-cat
//Click on the cat's mouth, and feed it with your mouse(!)
//Scoll down/up to switch to spy night vision mode
//Hit space bar to see some wiggly text.

Boolean isMousePressed = false;
Boolean isKeyPressed = false;

void setup(){
  size(600,600);
  smooth();
}



void mouseWheel( MouseEvent event)
{
  background(0);
  frameRate(20);
  fill(0,255,0);
  stroke(255);
  ellipse(400, 250, 50, 75);
  
  fill(0,255,0);
  stroke(255);
  ellipse(200, 250, 50, 75);
}
 
void mousePressed () {
  isMousePressed = true;
}

void mouseReleased(){
  isMousePressed = false; 
}

void keyPressed() {
  isKeyPressed = true;
}

void keyReleased() {
  isKeyPressed = false;
}

void draw(){
  
// background flashes on click
 if (isMousePressed == true) {
  background(random(230,255),random(124,255),124); }
 else{ 
   background(124);
 }
 
 //Wiggle text
    if (isKeyPressed == true) {
     String message = "Cats love eating mice!";

 fill(0);   
  int x = 180;
  for (int i = 0; i < message.length(); i++) {
    textSize(random(20,25));
    text(message.charAt(i),x,height/2+180);
    // textWidth() spaces the characters out.
    x += textWidth(message.charAt(i));
   }
 }
 fill(0);
  stroke(0);
  ellipse(300, 300, 300, 300);

  fill(0);
  stroke(0);
  triangle(190, 200, 250, 200, 220, 90);

  fill(0);
  stroke(0);
  triangle(350, 200, 410, 200, 380, 90);

  fill(225);
  stroke(225);
  ellipse(400, 250, 50, 75);
  
  fill(225);
  stroke(225);
  ellipse(200, 250, 50, 75);

  fill(0);
  stroke(0);
  ellipse(200, 275, 20, 50);
  
  fill(0);
  stroke(0);
  ellipse(400, 275, 20, 50);

  fill(225);
  stroke(225);
  triangle(280, 300, 320, 300, 300, 320);

  fill(225);
  stroke(225);
  line(310, 310, 350, 310);
  fill(225);
  stroke(225);
  line(310, 310, 340, 340);
  fill(225);
  stroke(225);
  line(310, 310, 360, 330);
  fill(225);
  stroke(225);
  line(290, 310, 250, 310);
  fill(225);
  stroke(225);
  line(290, 310, 260, 340);
  fill(225);
  stroke(225);
  line(290, 310, 240, 330);
  // cat eats arrow
  if(isMousePressed == true && dist(300,375,mouseX,mouseY)<30){
    fill(225);
    stroke(225);
    noCursor();
    ellipse(300, 375, 70, 1);//mouth closed//
  }
  else{
    cursor(ARROW);
    fill(225);
    stroke(225);
    ellipse(300, 375, 70, 70);//mouth opened//
  }

}
