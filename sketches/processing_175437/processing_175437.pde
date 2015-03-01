

Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;
Ball ball6;
Ball ball7;
Ball ball8;
Ball ball9;
Ball ball10;
Ball ball11;
Ball ball12;
  
boolean inside1 = false;
boolean inside2 = false;
boolean inside3 = false ;
boolean inside4 = false;
boolean inside5 = false ;
boolean inside6 = false;
boolean inside7 = false ;
boolean inside8 = false;
boolean inside9 = false;
boolean inside10 = false;
boolean inside11 = false;
boolean inside12 = false;

int count = 0;
color col;
int x;
int y;

void setup() {
  size(400,400);
  frameRate(100);
  background(200);
  smooth();
  
  color red = (#DE3838);
  color blue = (#57D3F7);
  color green = (#57F776);
  color purple = (#AC57F7);
  color yellow = (#F7DD57);
  color orange= (#FF7B39);
 
  
  // Initialize balls
  ball1 = new Ball(32, orange);
  ball2 = new Ball(32, purple);
  ball3= new Ball(32, blue);
  ball4= new Ball(32, red);
  ball5= new Ball(32, green);
  ball6= new Ball(32, yellow);
  ball7= new Ball(32, red);
  ball8= new Ball(32, blue);
  ball9= new Ball(32, green);
  ball10= new Ball(32, purple);
  ball11= new Ball(32, yellow);
  ball12= new Ball(32, orange);
  
  ball1.turnwhite();
  ball2.turnwhite();
  ball3.turnwhite();
  ball4.turnwhite();
  ball5.turnwhite();
  ball6.turnwhite();
  ball7.turnwhite();
  ball8.turnwhite();
  ball9.turnwhite();
  ball10.turnwhite();
  ball11.turnwhite();
  ball12.turnwhite();
}

void mouseClicked() {
   
  ball1.mouseClicked();
  ball2.mouseClicked(); 
  ball3.mouseClicked(); 
  ball4.mouseClicked();
  ball5.mouseClicked();
  ball6.mouseClicked(); 
  ball7.mouseClicked(); 
  ball8.mouseClicked();
  ball9.mouseClicked();
  ball10.mouseClicked(); 
  ball11.mouseClicked(); 
  ball12.mouseClicked();
   
    
  
  println("2 ="+  inside2);
  println("1 ="+ inside1); 
  
   //count everytime the mouse is clicked
  count += 1;
}


void draw() {
  background(200);
  
   if ( count %2 ==0) {
    one();
    two();
    three();
    four();
    five();
    six();
    seven();
    eight();
    nine();
    ten();
    eleven();
    twelve();
    //see if 2 of a color have been clicked on
    reds();
    oranges();
    yellows();
    greens();
    blues();
    purples();
  }
  
  else {
    one();
    two();
    three();
    four();
    five();
    six();
    seven();
    eight();
    nine();
    ten();
    eleven();
    twelve();
  }
  
  ball1.display();
  ball2.display();
  ball3.display();
  ball4.display();
  ball5.display();
  ball6.display();
  ball7.display();
  ball8.display();
  ball9.display();
  ball10.display();
  ball11.display();
  ball12.display();
  

 
  

  ball1.move();
  ball2.move();
  ball3.move();
  ball4.move();
  ball5.move();
  ball6.move();
  ball7.move();
  ball8.move();
  ball9.move();
  ball10.move();
  ball11.move();
  ball12.move();
 
 
}

void one() {
 
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11) {
    inside1 = true;
  }
}

 void two() {
  
   if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11) {
  inside2 = true;
  }
 }
 
void three() {
  
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside3 = true;
  }


void four() {
  
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside4 = true;
  }


void five() {

  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside5 = true;
  }
 

void six() {
  
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside6 = true;
  }


void seven() {
  
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside7 = true;
  }


void eight() {
 
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside8 = true;
  }


void nine() {
  
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside9 = true;
  }


void ten() {
 
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside10 = true;
  }


void eleven() {
  
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside11 = true;
  }


void twelve() {
 
  if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11)
    inside12 = true;
  }




void reds() {
  if (inside4 && inside7 ) {
    ball4.takeaway();
    ball7.takeaway();
  }
 
  if (!inside4 && inside7 ) {
    ball4.turnwhite();
    ball7.turnwhite();
 
    inside7 = false;
  }
 
  if (inside4 && !inside7) {
    ball4.turnwhite();
    ball7.turnwhite();
 
    inside4 = false;
  }
}

void oranges() {
  if (inside1 && inside12 ) {
    ball1.takeaway();
    ball12.takeaway();
  }
 
  if (!inside1 && inside12 ) {
    ball1.turnwhite();
    ball12.turnwhite();
 
    inside12 = false;
  }
 
  if (inside1 && !inside12) {
    ball1.turnwhite();
    ball2.turnwhite();
 
    inside1 = false;
  }
}

void yellows() {
  if (inside6 && inside11 ) {
    ball6.takeaway();
    ball11.takeaway();
  }
 
  if (!inside6 && inside11 ) {
    ball6.turnwhite();
    ball11.turnwhite();
 
    inside11 = false;
  }
 
  if (inside6 && !inside11) {
    ball6.turnwhite();
    ball11.turnwhite();
 
    inside6 = false;
  }
}

void greens() {
  if (inside5 && inside9 ) {
    ball5.takeaway();
    ball9.takeaway();
  }
 
  if (!inside5 && inside9 ) {
    ball5.turnwhite();
    ball9.turnwhite();
 
    inside9 = false;
  }
 
  if (inside5 && !inside9) {
    ball5.turnwhite();
    ball9.turnwhite();
 
    inside5 = false;
  }
}

void blues() {
  if (inside3 && inside8 ) {
    ball3.takeaway();
    ball8.takeaway();
  }
 
  if (!inside3 && inside8 ) {
    ball3.turnwhite();
    ball8.turnwhite();
 
    inside8 = false;
  }
 
  if (inside3 && !inside8) {
    ball3.turnwhite();
    ball8.turnwhite();
 
    inside3 = false;
  }
}

void purples() {
  if (inside10 && inside2 ) {
    ball10.takeaway();
    ball2.takeaway();
  }
 
  if (!inside10 && inside2 ) {
    ball10.turnwhite();
    ball2.turnwhite();
 
    inside2 = false;
  }
 
  if (inside10 && !inside2) {
    ball10.turnwhite();
    ball2.turnwhite();
 
    inside10 = false;
  }
}


//Class

class Ball {

  float r;   
  float x,y; 
  float xspeed,yspeed; 
  int border;
  color col;
  color vis;
  boolean colorclicked;
  boolean inside;

 
  
  // Constructor
  Ball(int tempR, color colo) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( - 1,1);
    yspeed = random( - 1,1);
    col=colo;
    
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }
  
  
  void display() {
    fill(vis);
    stroke(border);
    ellipse(x,y,r*2,r*2);
  }


  void turnwhite() {
    vis = 255; 
    border = 0;
  }

 void mouseClicked() {
   
    if (mouseX > x + 10 && mouseX < x + 11 || mouseX < x-10 && mouseX > x-11 && mouseY > y + 10 && mouseY < y + 11 || mouseY < y-10 && mouseY > y-11) {
      vis = col;
      border = 0;
    }
    
 }
     
  void takeaway() {
    border = 200;
    vis = 200;
  }
}

