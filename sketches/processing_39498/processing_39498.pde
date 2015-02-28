
int popX, popY, popDiam=150;
int shootspeed = 0;

//MOVING STARS
int star1x = 10;
int star1y = 10;
int star2x = 14;
int star2y = 92;
int star3x = 490;
int star3y = 55;
int star4x = 75;
int star4y = 490;
int star5x = 250;
int star5y = 400;
int star6x = 75;
int star6y = 75;
int star7x = 400;
int star7y = 290;
int star8x = 390;
int star8y = 100;
int star9x = 250;
int star9y = 400;
int star10x = 300;
int star10y = 30;
int star11x = 225;
int star11y = 225;
int star12x = 118;
int star12y = 69;
int star13x = 96;
int star13y = 196;
int star14x = 490;
int star14y = 490;
int star15x = 169;
int star15y = 369;


//trying to get the lazer to move up the screen - currently not working
int lazerX = mouseX;
int lazerY = 230;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  background(0);
  fill(0, 255, 0);
  stroke(0, 255, 0);
  popX=(mouseX-250);

  //making the ship shoot
  if (keyPressed ==  true) {
    //rect(mouseX-8,(shootspeed),2,350); 
    rect(mouseX-8, 0, 2, 350);
  }
  stroke(255);
  fill(255);

  //these values denote the stars x,y as well as their size
  ellipse(star1x, star1y, 1, 1);
  ellipse(star2x, star2y, 3, 3);
  ellipse(star3x, star3y, 2, 2);
  ellipse(star4x, star4y, 1, 1);
  ellipse(star5x, star5y, 1, 1);
  ellipse(star6x, star6y, 2, 2);
  ellipse(star7x, star7y, 2, 2);
  ellipse(star8x, star8y, 1, 1);
  ellipse(star9x, star9y, 3, 3);
  ellipse(star10x, star10y, 2, 2);
  ellipse(star11x, star11y, 2, 2);
  ellipse(star12x, star12y, 2, 2);
  ellipse(star13x, star13y, 1, 1);
  ellipse(star14x, star14y, 3, 3);
  ellipse(star15x, star15y, 2, 2);

  //these vary the speed of each stars descent 
  star1y = star1y+1;
  star2y = star2y+2;
  star3y = star3y+1;
  star4y = star4y+3;
  star5y = star5y+1;
  star6y = star6y+2;  
  star7y = star7y+1;
  star8y = star8y+3;
  star9y = star9y+1;
  star10y = star10y+2;
  star11y = star11y+2;  
  star12y = star12y+1;
  star13y = star13y+3;
  star14y = star14y+1;
  star15y = star15y+2;
  lazerX = lazerX-1;


  smooth();

  //these if statements make the stars restart at the top once they are > height  
  if (star1y>height) {
    star1y=0;
  }
  if (star2y>height) {
    star2y=0;
  }
  if (star3y>height) {
    star3y=0;
  }
  if (star4y>height) {
    star4y=0;
  }
  if (star5y>height) {
    star5y=0;
  }
  if (star6y>height) {
    star6y=0;
  }
  if (star7y>height) {
    star7y=0;
  }
  if (star8y>height) {
    star8y=0;
  }
  if (star9y>height) {
    star9y=0;
  }
  if (star10y>height) {
    star10y=0;
  }
  if (star11y>height) {
    star11y=0;
  }
  if (star12y>height) {
    star12y=0;
  }
  if (star13y>height) {
    star13y=0;
  }
  if (star14y>height) {
    star14y=0;
  }
  if (star15y>height) {
    star15y=0;
  }









  stroke(255);
  fill(255);

  /*
//stars
   rect(10,10,1,1);
   rect(14,92,1,1);
   rect(490,55,1,1);
   rect(75,490,1,1);
   rect(250,400,1,1);
   rect(75,75,1,1);
   rect(400,100,1,1);
   rect(439,422,1,1);
   rect(445,250,1,1);
   rect(380,430,1,1);
   rect(122,275,1,1);
   */

  // rect(popX,400,100,100);
  //fill(142,129,102);
  //stroke(142,129,102);
  fill(183,147,68);
  stroke(183,147,68);
  
  rect(popX+240, 240, 6, 30); //nose
  rect(popX+233, 270, 20, 60);  //big nose
  rect(popX+223, 330, 40, 70);  //body
  rect(popX+203, 360, 80, 20);  //wing
  rect(popX+193, 370, 100, 10);  //wing
  rect(popX+183, 380, 120, 10);  //wing
  rect(popX+240, 400, 6, 15);  //tail

  //cannons
  rect(popX+203, 330, 6, 30);
  //left cannon
  rect(popX+277, 330, 6, 30);
  //right cannon
  rect(popX+183, 350, 6, 30);
  //left lower cannon
  rect(popX+297, 350, 6, 30);
  //lower right cannon    
  fill(255, 10, 10);
  stroke(255, 10, 10);

  rect(popX+277, 310, 6, 20);
  rect(popX+203, 310, 6, 20);
  //r and l cannon tip

  rect(popX+183, 330, 6, 20);
  rect(popX+297, 330, 6, 20);
  //r and l lower cannon tip

  //boosters
  rect(popX+223, 391, 10, 20);  //left
  rect(popX+253, 391, 10, 20);  //right
  rect(popX+228, 386, 5, 5);
  rect(popX+253, 386, 5, 5);

  //window
  rect(popX+239, 350, 8, 15);  //middle
  rect(popX+231, 357, 8, 15);  //left
  rect(popX+247, 357, 8, 15);  //right

  fill(50, 50, 230);  //blue
  stroke(50, 50, 230);

  rect(popX+203, 360, 6, 9); //top left blue
  rect(popX+277, 360, 6, 9); //top right blue

  rect(popX+193, 370, 6, 9); //lower left blue
  rect(popX+287, 370, 6, 9); //lower right blue
}


