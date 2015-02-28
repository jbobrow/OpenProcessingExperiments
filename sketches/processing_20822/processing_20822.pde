
//02/13/2011  |  Molly Morin  |  mollymorin.com
 
//created for Emerging Formats for Digital Art, University of Notre Dame
//Examples to support Daniel Shiffman's Learning Processing, www.learningprocessing.com

//Here's my blob class as an array, just so you can get excited about classes
//I use arrows --> or <-- to point out things that I changed from the previous version

////variables////////////////////////////////////////////////////////////////////

Blob[] crazyblobs = new Blob[50]; //<--this makes 50 blobs!!!!
 
void setup(){
  size(500,500);
  smooth();
  background(100,250, 250);
 // This makes 100 blobs
  for(int i=0; i<crazyblobs.length; i++){
    crazyblobs[i] = new Blob(i*10, i*10, 1, random(20,70), random(20,50), random(1,5));
  }
}

////draw////////////////////////////////////////////////////////////////

void draw(){
  
  noStroke();
  fill(100,250, 250,10);
  rect(0,0,height,width);
  
  for (int i = 0; i< crazyblobs.length; i++){
    float a = random(3,25);
    crazyblobs[i].display(a);
    crazyblobs[i].moveH();  
  }
}

//void mousePressed(){
//saveFrame ("screenshot.jpg");
 //}
 
////class//////////////////////////////////////////////////////////////


class Blob{ //Begin defining your class by moving those variables here
  float centerX;//
  float centerY;//
  float dir;
  float b;
  float c;
  float sp;
  
  //Here's the odd part...we need to set up a way to PASS those arguments to the class
  //your text uses "temp" where I am using "_".  I use "_" because its only one keystroke
  Blob(float _centerX, float _centerY, float _dir, float _b, float _c, float _sp) { //<--i add my temporary values here
    centerX = _centerX;//<--so this says "make centerX whatever is defined in the instance as _centerX."
    centerY = _centerY;
    dir = _dir;
    b = _b;
    c = _c;
    sp = _sp;
  }//<--close brackets

  //--> this used to be my "blob" function
  //--> i renamed it because I have a Blob class now
  //--> but its still a function, just within a class now
  void display(float a){
    noStroke();
    fill(250, 150, 150, 180);
    ellipse(centerX-8, centerY-5, b, b);
    fill(200, 150, 150, 200);
    ellipse(centerX+5, centerY-10, c, c);
    fill(250, 100, 100,250);
    ellipse(centerX, centerY, a,a);
  }
 
  //--> moveH is still a function too, just inside class Blob
  void moveH(){
    centerX = centerX+sp*dir;
    if (centerX>width || centerX<0){
    dir=dir*-1;
    }
  }
}


