
// Brian Mislang
// Assignment 5

// light switch variables: credit Light switch function to Matthew Wood http://www.openprocessing.org/sketch/36403
boolean on = false;
int a = 470;
int b = 0;
int c = 35;
int d = 75;

// ball variables
float r, X, Y, Xspeed, Yspeed;

// environment variables
float gravity, stopSpeed, dissipation;

void setup() {
  size(500,500);
  smooth();
  ellipseMode(RADIUS); // uses first two parameters in ellipse(); as the location to where the ellipse is located,
                       // and last two parameters to specify width and height
  
  // initialize ball variables
  r = 50;
  X = width/2;
  Y = r;
  
  
  // initialize physical variables
  gravity = 0.6; 
  stopSpeed = 0.2;
  dissipation = .08;

}

void draw() {
 if(on==true){ // sets the background to black or white depending on if user press switch (default black)
   background(255);
 } else {
   background(0);
 }
  // light switch
  fill(155);
  rect(a,b,c,d);
  
 
  displayMonster(); // calls displayMonster function
  if( mousePressed && mouseOnMonster() ){ // if the mouse is pressed and mouse in on the monster,
    holdMonster(); // calls holdMonster function
    println("Release me!"); // and then prints statement on interface in Processing editor
  }else{ // otherwise, calls next two functions
    moveMonster(); //calls moveMonster function
    updateSpeed(); //calls updateSpeed function
  }
}

// light switch function
void mousePressed() {
  if ( mouseX > a && mouseX < (a+c) && mouseY > b && mouseY < (b+d)) {
    on = !on;   
  }
}

void displayMonster(){
  //constrains the monster to not go past the borders of the window so monster bounces off walls opposite of where it came from
  Y = constrain(Y,r,height-r); 
  X = constrain(X,r,width-r);
  
  //body
  stroke(255);
  fill(0);
  ellipse(X,Y,r,r);
  
  //left eye
  fill(X); // eye color depends on location
  arc(X-20, Y-25, 10, 10, 0, PI+QUARTER_PI, OPEN);
  fill(0);
  ellipse(X-22, Y-22, 5, 5);
  
  //right eye
  fill(Y); // eye color depends on location
  arc(X+20, Y-25, 10, 10, 0, PI+QUARTER_PI, OPEN);
  fill(0);
  ellipse(X+20, Y-22, 5, 5);
  
  //mouth
  stroke(255);
  line(X-28, Y+38, X+28, Y+38);
  
  stroke(255);
  line(X-28, Y+15, X+28, Y+15);
  
  fill(255);
  triangle(X, Y+18, X-10, Y+38, X+10, Y+38);
  
  fill(255);
  triangle(X-22, Y+32, X-25, Y+38, X-15, Y+38);
  
  fill(255);
  triangle(X+22, Y+32, X+25, Y+38, X+15, Y+38);
  
  fill(255);
  triangle(X-17, Y+30, X-29, Y+14, X-15, Y+14);
  
  fill(255);
  triangle(X+17, Y+30, X+29, Y+14, X+15, Y+14);
  
  stroke(255);
  line(X+29, Y+37, X+29, Y+15);
  
  stroke(255);
  line(X-29, Y+37, X-29, Y+15);
  
  //nose
  ellipse(X+8, Y, 10, 10);
  ellipse(X-8, Y, 10, 10);
  fill(0);
  ellipse(X+7, Y, 6, 6);
  fill(0);
  ellipse(X-7, Y, 6, 6);
  
  
  //chains (top)
  stroke(0);
  line(5, 0, X-40, Y-30);
  line(137, 0, X-20, Y-45);
  line(269, 0, X, Y-50);
  line(421, 0, X+20, Y-45);
  
  //chains (left)
  stroke(0);
  line(0, 100, X-40, Y-10);
  line(0, 200, X-45, Y+6);
  line(0, 300, X-35, Y+20);
  line(0, 400, X-30, Y+30);
  
  //chains (bottom)
  stroke(0);
  line(25, 500, X-25, Y+40);
  line(137, 500, X-20, Y+45);
  line(269, 500, X, Y+50);
  line(421, 500, X+20, Y+45);
  
  //chains (right)
  stroke(0);
  line(500, 100, X+30, Y-20);
  line(500, 200, X+35, Y-5);
  line(500, 300, X+20, Y+5);
  line(500, 400, X+25, Y+5);
}

void holdMonster(){
  // X & Y variables set to onto the mouse
  X = mouseX; 
  Y = mouseY;
  Xspeed = (mouseX-pmouseX);
  Yspeed = (mouseY-pmouseY);
  
}

void moveMonster(){
    X += Xspeed;
    Y += Yspeed;
}

void updateSpeed(){
  // function to achieve monster gravity, oscilliation physics
  if( abs(Yspeed)<stopSpeed ){
    Yspeed = 0.0;
  }else if( Y > height-r ){
    Yspeed *= -(1-dissipation);
  }else if( Y < r ) {
    Yspeed *= -(1-dissipation);
  }
   if( abs(Xspeed)<stopSpeed ){
    Xspeed = 0.0;
  }else if( X > width-r){
    Xspeed *= -(1-dissipation);   
  }else if( X < r ) {
    Xspeed *= -(1-dissipation);
}
 Yspeed += gravity;
}

boolean mouseOnMonster(){
  return dist(X,Y, mouseX,mouseY) < r;
}


