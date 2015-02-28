
int myState = 0 ;
int counter = 0 ;
int counter2 = 0 ;
PImage trapeze1 ;
PImage trapeze2 ;
PImage trapeze3 ;
PImage trapeze4 ;
PImage trapeze5 ;
PImage trapeze6 ;
PImage trapeze7 ;
PImage trapeze8 ;
PImage trapeze9 ;
PImage trapeze10 ;
PImage trapeze11 ;
PImage trapeze12 ;
PImage trapeze13 ;
PImage trapeze14 ;
PImage trapeze15 ;
PImage trapeze16 ;

void setup() {
  size(900, 500) ;
  frameRate(24) ;
  trapeze1 = loadImage("trapeze1.png") ;
  trapeze2 = loadImage("trapeze2.png") ;
  trapeze3 = loadImage("trapeze3.png") ;
  trapeze4 = loadImage("trapeze4.png") ;
  trapeze5 = loadImage("trapeze5.png") ;
  trapeze6 = loadImage("trapeze6.png") ;
  trapeze7 = loadImage("trapeze7.png") ;
  trapeze8 = loadImage("trapeze8.png") ;
  trapeze9 = loadImage("trapeze9.png") ;
  trapeze10 = loadImage("trapeze10.png") ;
  trapeze11 = loadImage("trapeze11.png") ;
  trapeze12 = loadImage("trapeze12.png") ;
  trapeze13 = loadImage("trapeze13.png") ;
  trapeze14 = loadImage("trapeze14.png") ;
  trapeze15 = loadImage("trapeze15.png") ;
  trapeze16 = loadImage("trapeze16.png") ;  
}


void draw() {
  
  background(160) ;
  noStroke();
  
  counter = counter + 1 ;
  if (counter > .25*frameRate) {
    //it's time to change states!!!
    myState = myState + 1 ;
    if (myState > 15) {
      myState = 0 ;
    }
    counter = 0 ;
  }
  
  
  switch(myState) {
    
    case 0:
    fill(random(255), random(255), random(255), random(20));
    rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze1, 0, 0, width, height);
    break ;
    
    case 1:
    fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze2, 0, 0, width, height);
    break ;
    
    case 2:
    fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze3, 0, 0, width, height);
    break ;
    
    case 3:
    fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze4, 0, 0, width, height);
    break ;
    
    case 4:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze5, 0, 0, width, height);
    break ;
    
    case 5:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze6, 0, 0, width, height);
    break ;
    
    case 6:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze7, 0, 0, width, height);
    break ;
    
    case 7:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze8, 0, 0, width, height);
    break ;
    
    case 8:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze9, 0, 0, width, height);
    break ;
    
    case 9:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze10, 0, 0, width, height);
    break ;
    
    case 10:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze11, 0, 0, width, height);
    break ;
    
    case 11:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze12, 0, 0, width, height);
    break ;
    
    case 12:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze13, 0, 0, width, height);
    break ;
    
    case 13:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze14, 0, 0, width, height);
    break ;
    
    case 14:
        fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze15, 0, 0, width, height);
    break ;
    
    case 15:
    fill(random(255), random(255), random(255), random(10));
        rect(0, 0, width, height);
    rect(0, 100, width, height);
    rect(0, 200, width, height);
    rect(0, 300, width, height);
    rect(0, 400, width, height);
    image(trapeze16, 0, 0, width, height);
    break ;
  }
}
  


