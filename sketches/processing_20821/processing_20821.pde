
//02/13/2011  |  Molly Morin  |  mollymorin.com
 
//created for Emerging Formats for Digital Art, University of Notre Dame
//Examples to support Daniel Shiffman's Learning Processing, www.learningprocessing.com

//Here's how I pass variables to a class. This builds on the classes_01 example 
//I use arrows --> or <-- to point out things that I changed from the previous version

////variables////////////////////////////////////////////////////////////////////

Blob blobOne; // declare
Blob blobTwo; //<--this is what all of the class-building fuss is about...making multiples!
 
void setup(){
  size(500,500);
  smooth();
  
  //so my blobs have ARGUMENTS now...see the hard part of this in the Blob class
  blobOne = new Blob(100, 100, 1);//<--I've added arguments for centerX, centerY and dir
  blobTwo = new Blob(200, 250, -1);//<--my second blob can have different arguments
}

////draw////////////////////////////////////////////////////////////////

void draw(){
  float a = random(0,50);
  float b = random(20,30);//<--a second variable for my second blob
  background(100,250, 250);
   
  // then I can have different arguments for the functions too! 
  blobOne.display(a,50,50);
  blobOne.moveH(4);  
 
  blobTwo.display(b,100,25);//<--more variables!  So each blob can be a little different
  blobTwo.moveH(1);//<--it can move a little differently too!
}

//void mousePressed(){
 //saveFrame ("screenshot.jpg");
// }
 
////class//////////////////////////////////////////////////////////////


class Blob{ //Begin defining your class by moving those variables here
  float centerX;//
  float centerY;//
  float dir;
  
  //Here's the odd part...we need to set up a way to PASS those arguments to the class
  //your text uses "temp" where I am using "_".  I use "_" because its only one keystroke
  Blob(float _centerX, float _centerY, float _dir) { //<--i add my temporary values here
    centerX = _centerX;//<--so this says "make centerX whatever is defined in the instance as _centerX."
    centerY = _centerY;
    dir = _dir;
  }//<--close brackets

  //--> this used to be my "blob" function
  //--> i renamed it because I have a Blob class now
  //--> but its still a function, just within a class now
  void display(float a, int b, int c){
    noStroke();
    fill(250, 100, 100,250);
    ellipse(centerX, centerY, a,a);
    fill(250, 150, 150, 180);
    ellipse(centerX-10, centerY-5, b, b);
    fill(200, 150, 150, 200);
    ellipse(centerX+5, centerY-20, c, c);
  }
 
  //--> moveH is still a function too, just inside class Blob
  void moveH(float sp){
    centerX = centerX+sp*dir;
   
    if (centerX>width || centerX<0){
    dir=dir*-1;
    }
  }
}


