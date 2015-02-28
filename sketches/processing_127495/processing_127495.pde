
//the scope of the variable is defined 
//by the {} where it is declared (initiated/defined)
//or: a variable is only valid in the function where it is declare
//if we define a variable outside of any {}, it is "global"
//if we define a variable within {}, it is "local"

//you can think of this initial code, outside of setup and draw,
//as a "intro" or "header"
float myNicePosition = 50;
float mySpeed = random(10); 
int red = 0;
void setup() {
  size(500, 500);
  background(255);
  smooth();
}
void draw() {
  //background(255);
  //myNicePosition = myNicePosition+1; is the same as:
  //myNicePosition+=1; is the same as
  //myNicePosition++;
  myNicePosition+=mySpeed;
  red+=2;
  //we have these main shortcuts for updating values:
  //+=, -=, *=, /=, ++, -- (* is multiply; / is divide)
  noStroke();
  fill(red, 0, 0);
  ellipse(myNicePosition, 250, 150, 150);
  // most usual comparisons: ==, !=, <, >, <=, >=
  // within if, you can use logical operators OR || or AND &&
  if(myNicePosition>width || myNicePosition<0){
    //mySpeed = mySpeed*-1; same as:
    mySpeed*=-1;
    println(mySpeed);
  }
  if(red>=255){
    red=0;
  }
}



