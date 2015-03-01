
/* 

This project is a combination of all the work done until now, using the concepts of the previous 
assignments, and some more tricky things. I would like to evolve it a bit more, but actually I had
no time. So it's a project that depends basically on the movement of the mouse creating two types 
of shapes, lines and ellipses, producing really interesting results. Hope you enjoy it !

commands
h / H            pressing h will bring up help
s / S            pressing h will bring up help
1                pressing 1 you start drawing
DELETE or 0      pressing DELETE or 0, everything is erased
moving mouse you control the drawing


Artemis Psaltoglou
05/03/2014

*******************/

// setting global variables
float x = 0;
float y = 0;
float r = 350;
int stroke = 0;

void setup(){
  size(1000,800);
  background(0);
  smooth();
  text( "Artemis Psaltoglou", 20, height - 50 ); //  name of creator
  text( "05/03/2014", 20, height - 25);         // date of project
}
void draw(){
 int a= width/2;
 int b= height/2;
 int points=50;
  fill(random(255), random(255), random(255));

if (stroke == 1) {                    // pressing 1 everything starts
  for (int i=0; i<50; i++) {
  x= a+r*cos(i*TWO_PI/points);
  y= b+r*sin(i*TWO_PI/points);
    strokeWeight(0.02);
    stroke(random(255), random(255), random(255));    
    line(x, y, mouseX, mouseY);  
    fill(255, 5);
    ellipse (x, y, mouseX, mouseY);
    }
}

if ( key == 'h'|| key == 'H') {
    ShowHelp();
    }

}

void ShowHelp() {
  fill(255, 255,255, 100 );
  text( "Pressing h will bring up help", 10, height - 175 );
  text( "Pressing 1 you start drawing", 10, height - 150 );
   text( "Pressing DELETE or 0, everything is erased", 10, height - 125 );  
}

void mousePressed() {
  background(0);
}
void keyPressed() {
  if (key==DELETE || key==BACKSPACE) background(0);
  if (key=='s' || key=='S') saveFrame("screenshot.png");
  if (key=='0') stroke = 0;

  switch(key){
  case '1':
    stroke = 1;
    strokeWeight(0);
    break;
    }
  }




