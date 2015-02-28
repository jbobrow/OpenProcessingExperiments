
//copyright SophieVennix
//Homework4
//1.28.14

//typing any lowercase letter on the keyboard creates a colored dot in respect to that key's position on the keyboard
//scrolling changes the background to white
//clicking changes the background color

//PImage imageA;
float x, y, w, h;
{
  x=120;
  y=230;
  w=75;
  h=75;
}

void setup()
{
  size (400, 400);
  background(255);
  //imageA= loadImage("imageA.png");
}

void draw()
{
  //x=mouseX;
  //y=mouseY;
  fill(255);
  //rectMode(CORNER);
  //rect(0,0,width,height);
  //noCursor();
  noStroke();
  frameRate(60);
}

void keyPressed()
//////////1//////////
{
  if (key=='1')
  {
    fill(random(255), random(255), random(255));
    ellipse(x-1.20*w, 0, .40*w, .40*h);
  }
  else 
  {
    noFill();
    ellipse(x-1.20*w, 0, .40*w, .40*h);
  }


  //////////Q//////////
  if (keyPressed) {
    if (key=='q') {
      //image(imageA,x-25,y-40,.50*w,.50*h);
      fill(random(255), random(255), random(255));
      ellipse(x-.80*w, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x-.80*w, y-.80*h, .40*w, .40*h);
  }

  //////////W//////////
  if (keyPressed) {
    if (key=='w') {
      fill(random(255), random(255), random(255));
      ellipse(x-.40*w, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x-.40*w, y-.80*h, .40*w, .40*h);
  }

  //////////E//////////
  if (keyPressed) {
    if (key=='e') {
      fill(random(255), random(255), random(255));
      ellipse(x, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x, y-.80*h, .40*w, .40*h);
  }

  //////////R//////////
  if (keyPressed) {
    if (key=='r') {
      fill(random(255), random(255), random(255));
      ellipse(x+.40*w, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+.40*w, y-.80*h, .40*w, .40*h);
  }

  //////////T//////////
  if (keyPressed) {
    if (key=='t') {
      fill(random(255), random(255), random(255));
      ellipse(x+.80*w, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+.80*w, y-.80*h, .40*w, .40*h);
  }

  //////////Y//////////
  if (keyPressed) {
    if (key=='y') {
      fill(random(255), random(255), random(255));
      ellipse(x+1.20*w, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+1.20*w, y-.80*h, .40*w, .40*h);
  }

  //////////U//////////
  if (keyPressed) {
    if (key=='u') {
      fill(random(255), random(255), random(255));
      ellipse(x+1.60*w, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+1.60*w, y-.80*h, .40*w, .40*h);
  }

  //////////I//////////
  if (keyPressed) {
    if (key=='i') {
      fill(random(255), random(255), random(255));
      ellipse(x+2.0*w, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+2.0*w, y-.80*h, .40*w, .40*h);
  }

  //////////O//////////
  if (keyPressed) {
    if (key=='o') {
      fill(random(255), random(255), random(255));
      ellipse(x+2.40*w, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+2.40*w, y-.80*h, .40*w, .40*h);
  }

  //////////P//////////
  if (keyPressed) {
    if (key=='p') {
      fill(random(255), random(255), random(255));
      ellipse(x+2.80*w, y-.80*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+2.80*w, y-.80*h, .40*w, .40*h);
  }

  //////////A//////////
  if (keyPressed) {
    if (key=='a') {
      fill(random(255), random(255), random(255));
      ellipse(x-.60*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x-.40*w, y-.40*h, .40*w, .40*h);
  }

  //////////S//////////
  if (keyPressed) {
    if (key=='s') {
      fill(random(255), random(255), random(255));
      ellipse(x-.20*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x-.20*w, y-.40*h, .40*w, .40*h);
  }

  //////////D//////////
  if (keyPressed) {
    if (key=='d') {
      fill(random(255), random(255), random(255));
      ellipse(x+.20*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+.20*w, y-.40*h, .40*w, .40*h);
  }


  //////////F//////////
  if (keyPressed) {
    if (key=='f') {
      fill(random(255), random(255), random(255));
      ellipse(x+.60*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+.60*w, y-.40*h, .40*w, .40*h);
  }

  //////////G//////////
  if (keyPressed) {
    if (key=='g') {
      fill(random(255), random(255), random(255));
      ellipse(x+1.0*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+1.0*w, y-.40*h, .40*w, .40*h);
  }  

  //////////H//////////
  if (keyPressed) {
    if (key=='h') {
      fill(random(255), random(255), random(255));
      ellipse(x+1.40*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+1.40*w, y-.40*h, .40*w, .40*h);
  }    

  //////////J//////////
  if (keyPressed) {
    if (key=='j') {
      fill(random(255), random(255), random(255));
      ellipse(x+1.80*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+1.80*w, y-.40*h, .40*w, .40*h);
  }    

  //////////K//////////
  if (keyPressed) {
    if (key=='k') {
      fill(random(255), random(255), random(255));
      ellipse(x+2.20*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+2.20*w, y-.40*h, .40*w, .40*h);
  }  

  //////////L//////////
  if (keyPressed) {
    if (key=='l') {
      fill(random(255), random(255), random(255));
      ellipse(x+2.60*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+2.60*w, y-.40*h, .40*w, .40*h);
  }  

  //////////;//////////
  if (keyPressed) {
    if (key==';') {
      fill(random(255), random(255), random(255));
      ellipse(x+3.0*w, y-.45*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+3.0*w, y-.40*h, .40*w, .40*h);
  }  

  //////////Z//////////
  if (keyPressed) {
    if (key=='z') {
      fill(random(255), random(255), random(255));
      ellipse(x-.40*w, y-.10*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x-.40*w, y-.10*h, .40*w, .40*h);
  }  

  //////////X//////////
  if (keyPressed) {
    if (key=='x') {
      fill(random(255), random(255), random(255));
      ellipse(x, y-.10*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x, y-.10*h, .40*w, .40*h);
  }    

  //////////C//////////
  if (keyPressed) {
    if (key=='c') {
      fill(random(255), random(255), random(255));
      ellipse(x+.40*w, y-.10*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+.40*w, y-.10*h, .40*w, .40*h);
  }    

  //////////V//////////
  if (keyPressed) {
    if (key=='v') {
      fill(random(255), random(255), random(255));
      ellipse(x+.80*w, y-.10*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+.80*w, y-.10*h, .40*w, .40*h);
  }   

  //////////B//////////
  if (keyPressed) {
    if (key=='b') {
      fill(random(255), random(255), random(255));
      ellipse(x+1.20*w, y-.10*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+1.20*w, y-.10*h, .40*w, .40*h);
  }   

  //////////N//////////
  if (keyPressed) {
    if (key=='n') {
      fill(random(255), random(255), random(255));
      ellipse(x+1.60*w, y-.10*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+1.60*w, y-.10*h, .40*w, .40*h);
  }  

  //////////M//////////
  if (keyPressed) {
    if (key=='m') {
      fill(random(255), random(255), random(255));
      ellipse(x+2.0*w, y-.10*h, .40*w, .40*h);
    }
  }
  else {
    noFill();
    ellipse(x+2.0*w, y-.10*h, .40*w, .40*h);
  }
}

//////////BACKGROUNDCLRCHANGE//////////
void mousePressed()
{
  background(random(255), random(255), random(255));
}

void mouseWheel(MouseEvent event) {
  background(255);
  frameRate(3);
}




