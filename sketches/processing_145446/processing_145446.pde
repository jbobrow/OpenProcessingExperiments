
//program to make a memory tile game by Emma Wexler BPIM: G Block 
//this program is the first simple level with set color inputs 

Rectangle rect1; 
Rectangle rect2; 
Rectangle rect3; 
Rectangle rect4; 
Rectangle rect5; 
Rectangle rect6; 
Rectangle rect7; 
Rectangle rect8; 

//setting up rectangle locations making it easier to change 
int locx1 = 40; 
int locx2 = 140;
int locx3 = 240; 
int locx4 = 340;
int locy1 = 40;
int locy2 = 180; 

//the variable that decides if the rectangle is clicked on 
boolean inside1 = false ;
boolean inside2 = false; 
boolean inside3 = false ;
boolean inside4 = false; 
boolean inside5 = false ;
boolean inside6 = false; 
boolean inside7 = false ;
boolean inside8 = false; 

int count = 0; 

void setup() {

  size(450, 400); 
  background(200); 
  //making colors that are easy to see/change 
  color red = color(220, 30, 30);
  color blue = color(30, 40, 200);
  color green = color(30, 230, 80);
  color pink = color(255, 20, 147);

  //creating my rectangles, in this case 8 
  rect1 = new Rectangle(locx1, locy1, red); 
  rect2 = new Rectangle(locx2, locy1, pink);
  rect3 = new Rectangle(locx3, locy1, blue); 
  rect4 = new Rectangle(locx4, locy1, pink);
  rect5 = new Rectangle(locx1, locy2, green); 
  rect6 = new Rectangle(locx2, locy2, red);
  rect7 = new Rectangle(locx3, locy2, green); 
  rect8 = new Rectangle(locx4, locy2, blue);

  //starting them all white 
  rect1.turnwhite();
  rect2.turnwhite();
  rect3.turnwhite(); 
  rect4.turnwhite();
  rect5.turnwhite();
  rect6.turnwhite();
  rect7.turnwhite(); 
  rect8.turnwhite();
}


void mouseClicked() {
  //single mouse clicked program to combine the function of the class for all variables 
  rect1.mouseClicked();
  rect2.mouseClicked();  
  rect3.mouseClicked();  
  rect4.mouseClicked();
  rect5.mouseClicked();
  rect6.mouseClicked();  
  rect7.mouseClicked();  
  rect8.mouseClicked();
  println("2 ="+  inside2);
  println("1 =" +inside1);
  //count everytime the mouse is clicked 
  count += 1;
}


void draw() {

  if ( count %2 ==0) {
    //if its even, generally 2 tiles have been clicked on 
    //if its clicked find out which tile was clicked on 
    one(); 
    two(); 
    three();
    four(); 
    five();
    six(); 
    seven(); 
    eight();
    //see if 2 of a color have been clicked on
    reds(); 
    blues();
    pinks();
    greens();
  }

  else {
    //if the count is odd, then only 1 tile has been clicked on, record which and continue
    one(); 
    two(); 
    three();
    four(); 
    five();
    six(); 
    seven(); 
    eight();
  }
  //actually display the rectangles -- we are still in the draw funtion 
  rect1.display();
  rect2.display();
  rect3.display(); 
  rect4.display();
  rect5.display();
  rect6.display();
  rect7.display(); 
  rect8.display();
}

// the following are to tell which tile is clicked on in the main program, writen separately for easier editing 
//there are definitely simpler ways to do this, I don't know how though 
void one() { 
  int  locx = locx1;
  int farx = 70 + locx;
  int locy = locy1; 
  int fary = 100 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside1 = true;
  }
}

void two() { 
  int  locx = locx2;
  int farx = 70 + locx;
  int locy = locy1; 
  int fary = 100 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside2 = true;
  }
}

void three() { 
  int  locx = locx3;
  int farx = 70 + locx;
  int locy = locy1; 
  int fary = 100 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside3 = true;
  }
}

void four() { 
  int  locx = locx4;
  int farx = 70 + locx;
  int locy = locy1; 
  int fary = 100 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside4 = true;
  }
}

void five() { 
  int  locx = locx1;
  int farx = 70 + locx;
  int locy = locy2; 
  int fary = 100 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside5 = true;
  }
}

void six() { 
  int  locx = locx2;
  int farx = 70 + locx;
  int locy = locy2; 
  int fary = 100 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside6 = true;
  }
}

void seven() { 
  int  locx = locx3;
  int farx = 70 + locx;
  int locy = locy2; 
  int fary = 100 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside7 = true;
  }
}

void eight() { 
  int  locx = locx4;
  int farx = 70 + locx;
  int locy = locy2; 
  int fary = 100 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside8 = true;
  }
}

//these functions tell if 2 of the same color have been clicked on or 2 of different colors 
void reds() {
  //2 of the same color (in this case red) 
  if (inside1  && inside6 ) {
    rect1.takeaway(); 
    rect6.takeaway(); 

    //2 different colors, and if statement for each possible pattern
  }
  if (inside1 && !inside6) {
    rect1.turnwhite(); //turns the tiles back to white because the 2 clicked don't match 
    rect6.turnwhite(); 

    inside1 = false; //makes sure the program knows its no londer clicked on
  }  

  if (!inside1 && inside6) {

    rect1.turnwhite(); 
    rect6.turnwhite(); 

    inside6 = false; //same with other combination
  }
}

void pinks() {
  if (inside4 && inside2 ) {
    rect4.takeaway(); 
    rect2.takeaway();
  }

  if (!inside4 && inside2 ) {
    rect4.turnwhite(); 
    rect2.turnwhite(); 

    inside2 = false;
  }

  if (inside4 && !inside2) {
    rect4.turnwhite(); 
    rect2.turnwhite(); 

    inside4 = false;
  }
}

void blues() {
  if (inside3  && inside8 ) {
    rect3.takeaway(); 
    rect8.takeaway();
  }

  if (!inside3 && inside8) {
    rect3.turnwhite(); 
    rect8.turnwhite(); 

    inside8 = false;
  }

  if (inside3 && !inside8) {
    rect3.turnwhite(); 
    rect8.turnwhite(); 

    inside3 = false;
  }
}

void greens() {
  if (inside5 && inside7 ) {
    rect5.takeaway(); 
    rect7.takeaway();
  }

  if (!inside5 && inside7) {
    rect5.turnwhite(); 
    rect7.turnwhite(); 

    inside7 = false;
  }

  if (inside5 && !inside7 ) {
    rect5.turnwhite(); 
    rect7.turnwhite();

    inside5 = false;
  }
}

//the following are functions for the rectangles/tiles themselves 
class Rectangle {

  int rectwidth ;
  int rectheight ;
  int locx;
  int locy; 
  int farx;
  int fary;
  int border; 
  color col;
  color vis; 
  boolean colorclicked; 
  boolean inside; 



  Rectangle(int x, int y, color colo) {

    rectwidth = 70; 
    rectheight = 100; 
    locx = x;
    locy = y; 
    farx = locx + 70;
    fary = locy + 100;
    col = colo;
   
  } 


  void display() {
    //draw the rectangle 
    fill(vis); //vis is whats always changing to change the tile appearance 
    stroke(border);  //making border a variable helps it disappear when matched 
    rect(locx, locy, rectwidth, rectheight); //draw the actual rectangle 
  }

  void turnwhite() {
    vis = 255; //function to turn vis white making tile white 
    border = 0;
  }

  void mouseClicked() {
    println(" i am in mouse clicked"); 

    println("mouseX = " + mouseX);
    println("mouseY = " + mouseY);
    println("locX = " + locx);
    println("locy = " + locy);

//if the mouse is clicked while in the rectangle bounds, then the fill turns to the assigned color 

    if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary) {
      vis = col;
      border = 0;
    }
  }

//takeaway makes the tile disapear when matched 
  void takeaway() {
    border = 200; 
    vis = 200;
  }
}

