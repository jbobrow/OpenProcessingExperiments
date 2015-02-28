
int myState = 0;
PImage horse;
PImage Part2;
PImage Part3;
PImage Part4;
PImage Part5;
PImage Part6;
PImage Part7;
PImage Part8;
int counter = 0;

void setup() {
  size(700, 700);
  frameRate(58);
  horse = loadImage("Part1.png");
  Part2 = loadImage("part2.png");
  Part3 = loadImage("part3.png");
  Part4 = loadImage("part4.png");
  Part5 = loadImage("part5.png");
  Part6 = loadImage("part6.png");
  Part7 = loadImage("part7.png");
  Part8 = loadImage("part8.png");
}

void draw() {
  background(100);
  
  counter = counter + 1;
  if (counter > 6*5) {
    
    // changing states!!!
    
    myState = myState + 1;
    if (myState > 7) {
      myState = 0;
    }
    counter = 0;
  }
  
  
  switch(myState) {
    
    case 0:
    image(horse, 0, 0);
    break ;
    
    case 1:
    image(Part2, 0, 0);
    break ;
    
    case 2:
    image(Part3, 0, 0);
    break ;
    
    case 3:
    image(Part4, 0, 0);
    break ;
    
    case 4:
    image(Part5, 0, 0);
    break ;
    
    case 5:
    image(Part6, 0, 0);
    break;
    
    case 6:
    image(Part7, 0, 0);
    break;
    
    case 7:
    image(Part8, 0, 0);
    
  }
  
  
 
}


