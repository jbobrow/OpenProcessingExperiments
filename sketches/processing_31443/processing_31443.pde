
// -----------------------------Global Variables
//create an empty arrayList to store our balls
ArrayList ballList = new ArrayList () ;


// -----------------------------SETUP
// setup is a function that will run only once during the sketch
void setup () {

//set the size of processing window 
size (1200,900,P2D);
// Set Background 
noStroke ();
}
// -----------------------------DRAW LOOP
void draw () {
  fill(0,3);
  rect(0,0,width,height);

  for(int i =0; i<1000; i= i+2 ){
    myFunction(random (width) , random (height), 20 ,255);
  }
  
}


//  ----------------------------custom functions, mouse events etc

void myFunction (float x, float y, float r, int f) {
  fill (f,200);
  ellipse(x,y,r,r);
}

