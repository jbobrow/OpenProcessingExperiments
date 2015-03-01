
Rectangle rect1;
Rectangle rect2;
Rectangle rect3;
Rectangle rect4;
Rectangle rect5;
Rectangle rect6;
Rectangle rect7;
Rectangle rect8;
Rectangle rect9;
Rectangle rect10;
Rectangle rect11;
Rectangle rect12;


int x1 = 50;
int x2 = 160;
int x3 = 270;
int x4 = 380;
int y1 = 50;
int y2 = 215;
int y3 = 380;

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

void setup() {
  size(530, 580);
  background(200);
  color red = (#DE3838);
  color blue = (#57D3F7);
  color green = (#57F776);
  color purple = (#AC57F7);
  color yellow = (#F7DD57);
  color orange= (#FF7B39);
  
 
  rect1 = new Rectangle(x1, y1, orange);
  rect2 = new Rectangle(x2, y1, purple);
  rect3 = new Rectangle(x3, y1, blue);
  rect4 = new Rectangle(x4, y1, red);
  rect5 = new Rectangle(x1, y2, green);
  rect6 = new Rectangle(x2, y2, yellow);
  rect7 = new Rectangle(x3, y2, red);
  rect8 = new Rectangle(x4, y2, blue);
  rect9 = new Rectangle(x1, y3, green);
  rect10 = new Rectangle(x2, y3, purple);
  rect11 = new Rectangle(x3, y3, yellow);
  rect12 = new Rectangle(x4, y3, orange);
  
  rect1.turnwhite();
  rect2.turnwhite();
  rect3.turnwhite();
  rect4.turnwhite();
  rect5.turnwhite();
  rect6.turnwhite();
  rect7.turnwhite();
  rect8.turnwhite();
  rect9.turnwhite();
  rect10.turnwhite();
  rect11.turnwhite();
  rect12.turnwhite();
}

void mouseClicked() {
  rect1.mouseClicked();
  rect2.mouseClicked(); 
  rect3.mouseClicked(); 
  rect4.mouseClicked();
  rect5.mouseClicked();
  rect6.mouseClicked(); 
  rect7.mouseClicked(); 
  rect8.mouseClicked();
  rect9.mouseClicked();
  rect10.mouseClicked(); 
  rect11.mouseClicked(); 
  rect12.mouseClicked();
  println("2 ="+  inside2);
  println("1 =" +inside1); 
  
   //count everytime the mouse is clicked
  count += 1;
}

void draw() {
  
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
    rect1.display();
    rect2.display();
    rect3.display();
    rect4.display();
    rect5.display();
    rect6.display();
    rect7.display();
    rect8.display();
    rect9.display();
    rect10.display();
    rect11.display();
    rect12.display();
}

void one() {
  int locx = x1;
  int farx = 100 + locx;
  int locy = y1;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside1 = true;
  }
}

 void two() {
  int locx = x2;
  int farx = 100 + locx;
  int locy = y1;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside2 = true;
  }
 }
 
void three() {
  int locx = x3;
  int farx = 100 + locx;
  int locy = y1;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside3 = true;
  }
} 

void four() {
  int locx = x3;
  int farx = 100 + locx;
  int locy = y1;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside4 = true;
  }
} 

void five() {
  int locx = x1;
  int farx = 100 + locx;
  int locy = y2;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside5 = true;
  }
} 

void six() {
  int locx = x2;
  int farx = 100 + locx;
  int locy = y2;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside6 = true;
  }
} 

void seven() {
  int locx = x3;
  int farx = 100 + locx;
  int locy = y2;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside7 = true;
  }
} 

void eight() {
  int locx = x4;
  int farx = 100 + locx;
  int locy = y2;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside8 = true;
  }
} 

void nine() {
  int locx = x1;
  int farx = 100 + locx;
  int locy = y3;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside9 = true;
  }
} 

void ten() {
  int locx = x2;
  int farx = 100 + locx;
  int locy = y3;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside10 = true;
  }
} 

void eleven() {
  int locx = x3;
  int farx = 100 + locx;
  int locy = y3;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside11 = true;
  }
} 

void twelve() {
  int locx = x4;
  int farx = 100 + locx;
  int locy = y3;
  int fary = 150 + locy;
  if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary ) {
    inside12 = true;
  }
} 

void reds() {
  if (inside4 && inside7 ) {
    rect4.takeaway();
    rect7.takeaway();
  }
 
  if (!inside4 && inside7 ) {
    rect4.turnwhite();
    rect7.turnwhite();
 
    inside7 = false;
  }
 
  if (inside4 && !inside7) {
    rect4.turnwhite();
    rect7.turnwhite();
 
    inside4 = false;
  }
}

void oranges() {
  if (inside1 && inside12 ) {
    rect1.takeaway();
    rect12.takeaway();
  }
 
  if (!inside1 && inside12 ) {
    rect1.turnwhite();
    rect12.turnwhite();
 
    inside12 = false;
  }
 
  if (inside1 && !inside12) {
    rect1.turnwhite();
    rect2.turnwhite();
 
    inside1 = false;
  }
}

void yellows() {
  if (inside6 && inside11 ) {
    rect6.takeaway();
    rect11.takeaway();
  }
 
  if (!inside6 && inside11 ) {
    rect6.turnwhite();
    rect11.turnwhite();
 
    inside11 = false;
  }
 
  if (inside6 && !inside11) {
    rect6.turnwhite();
    rect11.turnwhite();
 
    inside6 = false;
  }
}

void greens() {
  if (inside5 && inside9 ) {
    rect5.takeaway();
    rect9.takeaway();
  }
 
  if (!inside5 && inside9 ) {
    rect5.turnwhite();
    rect9.turnwhite();
 
    inside9 = false;
  }
 
  if (inside5 && !inside9) {
    rect5.turnwhite();
    rect9.turnwhite();
 
    inside5 = false;
  }
}

void blues() {
  if (inside3 && inside8 ) {
    rect3.takeaway();
    rect8.takeaway();
  }
 
  if (!inside3 && inside8 ) {
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

void purples() {
  if (inside10 && inside2 ) {
    rect10.takeaway();
    rect2.takeaway();
  }
 
  if (!inside10 && inside2 ) {
    rect10.turnwhite();
    rect2.turnwhite();
 
    inside2 = false;
  }
 
  if (inside10 && !inside2) {
    rect10.turnwhite();
    rect2.turnwhite();
 
    inside10 = false;
  }
}


//Class

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
 
    rectwidth = 100;
    rectheight = 150;
    locx = x;
    locy = y;
    farx = locx + 100;
    fary = locy + 150;
    col=colo;
    
  }
 
 
  void display() {
    fill(vis); 
    stroke(border); 
    rect(locx, locy, rectwidth, rectheight); 
  }
 
  void turnwhite() {
    vis = 255; 
    border = 0;
  }
 
  void mouseClicked() {
   
    if (mouseX > locx && mouseX < farx && mouseY > locy && mouseY < fary) {
      vis = col;
      border = 0;
    }
  }
  
  void takeaway() {
    border = 200;
    vis = 200;
  }
} 
