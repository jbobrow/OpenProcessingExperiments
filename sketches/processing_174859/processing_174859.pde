
//Eric Liu
//Professor Brinson, Professor Moser, Mr. Effenberger
//CTIN 101 - Project 2
//ericyl@usc.edu
int lineThickness = 1;
boolean button = true;
boolean button2 = false;
boolean button3 = false;
PImage myImage;
PImage myImage2;
PImage myImage3;
PImage myImage4;
PImage myImage5;
PImage myImage6;
PImage myImage7;
String s = "A screenshot of your work has been taken.";
void setup() {
  size(600, 320);
  strokeWeight(lineThickness);
  background(102);
  myImage=loadImage("a.jpg");
  myImage2=loadImage("b.jpg");
  myImage3=loadImage("c.jpg");
  myImage4=loadImage("d.jpg");
  myImage5=loadImage("e.jpg");
  myImage6=loadImage("f.jpg");
  myImage7=loadImage("g.jpg");
}
void draw() {      
noStroke();
  image(myImage,0,0);
  image(myImage2,0,80);
  image(myImage3,0,160);
  image(myImage4,0,240);
  image(myImage5,520,240);
  image(myImage6,520,0);
  image(myImage7,520,80);
  if (button) {
     noFill();
     stroke(255);
            if (mousePressed == true) {
            line(mouseX+20, mouseY+40, pmouseX, pmouseY);
          } 
  }
  else if (button2) {
    noFill();
    stroke(255);
      if (mousePressed == true) {
            line(mouseX+50, mouseY+50, pmouseX, pmouseY);
            stroke(150);
            translate(width/2,height/2);
            float theta = PI*mouseX / width; 
            rotate(theta);
            ellipseMode(CENTER);
            noFill();
            ellipse(0,0,50,100);
          }
  }
  else if (button3) {
    noFill();
    stroke(50);
      if (mousePressed == true) {
            line(mouseX, mouseY, pmouseX, pmouseY);
            stroke(lineThickness);
            translate(width/2,height/2);
            float theta = PI*mouseX / width; 
            rotate(theta);
            ellipseMode(CENTER);
            noFill();
            ellipse(0,100,500,300);
          }
  }
}
void mouseClicked() {
  if ( mouseX > 0 && mouseX < 80 && mouseY > 0 && mouseY < 80) {
   button = true;
   button3 = false;
   button2 = false;
  }
  else if ( mouseX > 0 && mouseX < 80 && mouseY > 80 && mouseY < 160) {
   button2 = true;
   button3 = false;
   button = false;
  }
  else if ( mouseX > 0 && mouseX < 80 && mouseY > 160 && mouseY < 240) {
   button3 = true;
   button2 = false;
   button = false;
  }
  else if ( mouseX > 0 && mouseX < 80 && mouseY > 240 && mouseY < 360) {
  setup();
  }
  else if ( mouseX > 520 && mouseX < 600 && mouseY > 240 && mouseY < 360) {
  println(s);
  saveFrame(); 
  }
  else if ( mouseX > 520 && mouseX < 600 && mouseY > 0 && mouseY < 80) {
  lineThickness = lineThickness +1;
    if (lineThickness>5) {
    lineThickness=5;  
    }
  }
  else if ( mouseX > 520 && mouseX < 600 && mouseY > 80 && mouseY < 160) {
  lineThickness = lineThickness - 1;
    if (lineThickness<1) {
    lineThickness=1;
  }
  }
strokeWeight(lineThickness);
}


