



int myState = 0 ;

PImage Summer;
PImage Fall;
PImage Winter;
PImage Spring;
int x=0;
int y=0;
int z=0;
int j=0;

void setup() {
  size(500, 500);
  Summer = loadImage ("Summer.jpg");
  Fall=loadImage("Fall.jpg");
  Winter=loadImage("Winter.jpg");
  Spring=loadImage("Spring.jpg");
  
}

void draw() {
  background(100) ;

  switch(myState) {

  case 0:
    background(#4B0F0F);
    fill(#FFFFFF);
    textSize(25);
    text("Click to watch the seasons change!", 45, 230);
    break ;    
    
  case 1:
    image(Summer, 0, 0, 500, 500);
    fill(#FA8B03);
    textSize(270);
    text("Summer", x, 400);
    x=x-5;
   if(x < - width) {
     x = width;
   }
    break ;

  case 2:
    image(Fall, 0, 0, 500, 500);
    fill(#AD071A);
    textSize(400);
    text("Fall", y, 400);
    y=y-5;
     if(y < - width) {
     y = width;
   }
    break ;

  case 3:
    image(Winter, 0, 0, 500, 500);
    fill(#0BA7E3);
    textSize(280);
    text("Winter", z, 400);
    z=z-5;
     if(z < - width) {
     z = width;
   }

    break ;

  case 4:
    image(Spring, 0, 0, 500, 500);
    fill(#F094CB);
    textSize(400);
    text("Spring", j, 400);
    j=j-5;
     if(j < - width) {
     j = width;
   }
    break ;
  }
}

void mousePressed() {
  myState = myState + 1;
  if (myState > 4) {
    myState = 0 ;
  }
}



