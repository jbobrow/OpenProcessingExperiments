
//02/13/2011  |  Molly Morin  |  mollymorin.com
 
//created for Emerging Formats for Digital Art, University of Notre Dame
//Examples to support Daniel Shiffman's Learning Processing, www.learningprocessing.com
//Here's how I might turn blob into an object. 
//I use arrows --> or <-- to point out things that I changed from the previous version

////variables////////////////////////////////////////////////////////////////////
//--> all those variables that have built up get moved to the blob class,
//--> when the variables are here they are global:  accesible by everything else
//--> when moved to the Class they become local:  accesible only by the object (well, kinda)
//--> makes this top part pretty, don't you think?

//--> in place if all those variables, I'll declare an object as a global variable

Blob blobOne; 
// so Blob refers to the Class genrally...the basic definition of what a blob is
// and blobOne is one instance of Blob, later we'll add blobTwo and blobThree, they will also be Blobs
 
void setup(){
  size(500,500);
  smooth();
  blobOne = new Blob();//<--my blobOne gets INITIALIZED here
}

void draw(){
  float a = random(0,50);
  background(100,250, 250);
   
  //blob(a,50,50);<--this function gets moved to class Blob
  //it is RENAMED "display"
  
  //so now I need to call blobOne, then tell it to diplay/move
  blobOne.display(a,50,50);
  blobOne.moveH(.2);   
}

//<--party trick:  use this code to capture a screenshot to upload
//<--I turn it off before saving the online version
//void mousePressed(){
 //saveFrame ("screenshot.jpg");
// }
 
////class//////////////////////////////////////////////////////////////
//--> here we go...
//--> take a look at how things are indented here, consistecy is important
class Blob{ //Begin defining your class by moving those variables here
  float centerX;//<--These were the variables from above setup
  float centerY;//<--We will define the VALUES of these later
  float dir;
  
  Blob() { //<--A constructor, put start values here
    centerX = 250;
    centerY = 250;
    dir = 1;
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


