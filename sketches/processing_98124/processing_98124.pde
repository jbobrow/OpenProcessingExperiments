
int myState = 0 ;
int zeroCtr = 60*4 ;
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;

void setup(){
  size (500,500);
  one = loadImage("one.png");
  two = loadImage("two.png");
  three = loadImage("three.png");
  four = loadImage("four.png");
  five = loadImage("five.png");
  six = loadImage("six.png");
}

void draw(){
  background(0);
  
  
  switch (myState){
    case 0:
   image(one,0, 0, width, height);
    zeroCtr-- ;
     if (zeroCtr < 0 ) {
      myState = 1;
       zeroCtr = 60*2 ;
}
    break;
    
    case 1:
    image(two,0, 0, width, height);
     zeroCtr-- ;
     if (zeroCtr < 0 ) {
      myState = 2;
       zeroCtr = 60*2 ;
    }
    break;
    
    case 2:
    image(three,0, 0, width, height);
     zeroCtr-- ;
     if (zeroCtr < 0 ) {
      myState = 3;
       zeroCtr = 60*2 ;
    }
    break;
    
    case 3:
    image(four,0, 0, width, height);
     zeroCtr-- ;
     if (zeroCtr < 0 ) {
      myState = 4;
       zeroCtr = 60*2 ;
    }
    break;
    
    case 4:
    image(five,0, 0, width, height);
     zeroCtr-- ;
     if (zeroCtr < 0 ) {
      myState = 5;
       zeroCtr = 60*2 ;
    }
    break;
    
    case 5:
    image(six,0, 0, width, height);
     zeroCtr-- ;
     if (zeroCtr < 0 ) {
      myState = 0;
       zeroCtr = 60*2 ;
    }

}
}
voide mousePressed() {
  background (255, 255, 255);
  if (myState >6) {
    myState = 0;
  }
}


