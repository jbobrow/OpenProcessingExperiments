

float randomHue = random(0,1); //color matching... the key to everything!



void setup() {
    colorMode(HSB, 1.0); //it's just nicer this way... you know...
    size( 600, 600 ); 
    noLoop();
}



//MOUSE PRESS
void mousePressed() {
    redraw();
}


void drawRect(int x1,int y1,int w1, int h1, int value){
    stroke(1);
   float hStart = randomHue - 0.1;
    float hEnd = randomHue + 0.1;
   float h = random(hStart, hEnd);
    float s = random(0.1,0.3);
    float b = random(0.8,1);
    fill(h,s,b);
    rect(x1, y1, w1, h1); //we draw a rectangle    
    fill(0.3);
    text(str(value), x1+6, y1+20); 
  }



void draw() {
  background(1);
  
  //we re-pick a new color hue (the best part);
  randomHue = random(0,1);
  
  // FIRST, we generate an array with n number of random values.
  ///////////////////////////////////////////////////////////////
  int nbItems = floor(random(2,12)); 
  int[] numbers = new int[nbItems]; 
  for( int i=0; i < numbers.length; i++ ) {
    float tempVal = random(3,1000);
    if(tempVal > 500){ // we tweak a bit the random to make sure we have an inverted bell curve (good for treemaps)
      tempVal = tempVal + (tempVal *random (1*6));
    }else{
      tempVal = tempVal / random(0, tempVal/500);
    }
    //tempVal = sqrt(tempVal) ;
    
    numbers[i] = floor(tempVal); 
  }  
 
 
 //basic param for the sake of this prototype ...
  int blockW = width-20;
  int  blockH = height-20; 
  int  refX = 10;
  int  refY = 10;
  
  makeBlock(refX, refY, blockW, blockH, numbers); //x,y,w,h
} //end DRAW...
  
  
  
void makeBlock(int refX, int refY, int blockW, int blockH, int[] numbers){
  // We sort the received array.
  ///////////////////////////////////////////////////////////////
  numbers = reverse(sort(numbers));// we sort the array from biggest to smallest value.
 // println(numbers);
 
  int valueA = numbers[0];//the biggest value
  int valueB = 0;//value B will correspond to the sum of all remmaining objects in array
  int[] numbersB = new int[numbers.length-1]; //a new array excluding the big value.
 
  for( int i=1; i < numbers.length; i++ ) {
    numbersB[i-1] = numbers[i]; //we populate our new array of values, we'll send it recursivly...
    valueB += numbers[i];
    
  }
  float ratio = float(valueA) / float(valueB + valueA);
  println("ratio = " + ratio);
  println("A val = " + valueA);
  println("B val = " + valueB);
  //now we split the block in two according to the right ratio...
  
  int xA, yA, heightA, widthA, xB ,yB, heightB, widthB;
  if(blockW > blockH){ //si plus large que haut...
    //we split vertically; so height will stay the same...
    
    xA = refX;
    yA = refY;// we draw the square in top right corner, so same value.
    heightA = blockH;
    widthA  = floor(blockW * ratio);
    
    xB = refX + widthA;
    yB = refY;
    heightB = blockH;
    widthB = blockW - widthA; //the remaining portion of the width...
    
  }else{//tall rectangle, we split horizontally.
    xA = refX;
    yA = refY;// we draw the square in top right corner, so same value.
    heightA = floor(blockH * ratio);
    widthA  = blockW;
    
    xB = refX;
    yB = refY+ heightA;
    heightB = blockH - heightA;
    widthB = blockW; //the remaining portion of the width...
    
  }
  
  
  
   
  
  
  //We add the block A to the display List
  // for now, we just draw the thing, let's convert to OOP later...
  //drawRect(xA, yA, widthA, heightA, valueA); //(x, y, width, height)
  //int pcntA = floor(valueA / float(valueA + valueB)*100);
  //int pcntB = floor(valueB / float(valueA + valueB)*100);
 // drawRect(xA, yA, widthA, heightA, pcntA); //(x, y, width, height)
  drawRect(xA, yA, widthA, heightA, valueA);
  
  println("numbers.length = "+numbers.length);
  println("numbersB.length = "+numbersB.length);
  if(numbers.length > 2){//this mean there is still stuff in this arary...
     makeBlock(xB, yB, widthB, heightB, numbersB);

  }else{
    //if it's done, we add the B to display list, and that's it for recussivity, we return to main level... 
    // the main function will then deal with all the data...
    drawRect(xB, yB, widthB, heightB, valueB);
  }
  
  //If it represent more than one value, we send the block B to be split again (recursivly)
  
  
}







