
float bearX = 250;
float bearY = 250;
float r = 255;
float g = 255;
float b = 255;
float speed = 1;
float w = 150;
float h = 50;
float x = 175;
float y = 400;

boolean button = false;

void setup () {
  //set the size of the window
  size (500,500);
 
  smooth();
 
}

void draw() {
  
  background(r,g,b);
  
 /*  if (mouseX > width/2) {
    r = r+1;
  } else {
    r = r - 1;
  }
  
  if (mouseY>height/2) {
    b = b + 1;
  } else {
    b = b - 1;
  }
  
  if(mousePressed) {
    g = g + 1;
  } else {
    g = g - 1;
  }
  
  r = constrain(r,0,255);
  g = constrain(g,0,255);
  b = constrain(b,0,255); */
  
  
  //set CENTER mode
 ellipseMode(CENTER);
  //rectMode(CENTER);
  
//Draw the ears
noStroke();
fill(192,102,0);
ellipse(bearX-70,bearY-50,40,40);
ellipse(bearX+70,bearY-50,40,40);
fill(mouseX,mouseY/2,mouseY);
ellipse(bearX-75,bearY-45,25,25);
fill(mouseX,mouseX/2,mouseY);
ellipse(bearX+75,bearY-45,25,25);

//Draw the head
fill(192,102,0);
//ellipse(100,80,170,130);
ellipse(bearX,bearY,170,130);

//Draw the face
fill(255);
ellipse(bearX,bearY+20,50,40);
fill(0);
ellipse(bearX-40,bearY+10,20,20);
ellipse(bearX+40,bearY+10,20,20);
ellipse(bearX,bearY+15,15,15);
stroke(0);
strokeWeight(4);
line(bearX,bearY+15,bearX-8,bearY+28);
line(bearX,bearY+15,bearX+8,bearY+28);


//Controls
if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    strokeWeight(2);
} else {
  noStroke(); }
  
if (button) {
bearX = bearX + speed;
fill (225,35,35);

} else {
  fill (120,225,35);
}

rect(x,y,w,h);

if ((bearX > width) || (bearX < 0)) {
  speed = speed * -1;
}


//Let's do the rest of the exercises here

}

void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
    button = !button;
  }
}

