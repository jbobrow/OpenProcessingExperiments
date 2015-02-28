
//// BUTTERFLIES random art generator ////
/// Based on Dot swarm code developed in class with Mitchell Whitelaw /////
/// Demonstrates - Iteration 
// Arrays (and/or ArrayLists) 
// Functions (with arguments) 
// Custom classes 
// Mouse and keyboard interaction 
// Loading and saving files 
// Use of external libraries
///

PFont font; // new font 
ArrayList Dots = new ArrayList(); // Butterfly array list
Dot D; // the Butterfly

int number =  round(random(10,60)); //set number of butterflies in explosion

void setup(){
  size(600,600); // window size
  //smooth(); //smooth jaggered lines
  frameRate(25); // sets the rate of frames per second
  font = loadFont("Butterflies-48.vlw"); // load font stored in data folder
}

void draw(){ // itterate  
noStroke(); // mo stroke on all objects until redefined elsewhere

background(0); // reset background to black to remove trails let behind
rect(0,0,width,height); // make a rectangle the size of the windoew draw each time to create a fade effect

  for (int i=0; i<Dots.size(); i++){// iterate over our ArrayList
    Dot D = (Dot) Dots.get(i); // get one Dot out
    D.run(); // do your thing

}
}

void mousePressed(){ // when the mouse is pressed
  int r = round(random(1,3)); // r is a random number between 1 and 3
  for( int w = 0; w < number; w = w + 1){ // iterate number of times equal to "name" variable
   if( r == 1){ // test is r  equal to 1 
  Dot D = new Dot( new PVector(mouseX,mouseY), color(random(0,255),0,0, random(50,100)), random(7,25) ); // calls on new dot function and fills with updated values inc random colours
  Dots.add(D); // add the new butterfly to the bucket
   }
   else{ // if r is not equal to 1 continue to next line
     if( r ==2){ // test if r = 2
     Dot D = new Dot( new PVector(mouseX,mouseY), color(random(0,255),255,0,random(50,100)), random(7,30) );  // calls on new dot function and fills with updated values
  Dots.add(D); // add the new butterfly to the bucket
   }else{ // if r is not equal to 2 continue to next line
     Dot D = new Dot( new PVector(mouseX,mouseY), color(0,244,random(0,255), random(50,100)), random(7,27) );  // calls on new dot function and fills with updated values
  Dots.add(D); // add the new new butterfly to the bucket
   }
   }
  }
}
void  keyPressed(){ /// if any key is pressed
save("butterflyPic.jpeg");  // save a jpeg named ButterflyPic.jp
  }
   
 
  
  
  




