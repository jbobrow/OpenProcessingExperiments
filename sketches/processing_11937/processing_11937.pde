
//Sydney City Trail//
////Michael Khalil\\\\


 
//main setup  
  void setup() {
  smooth();
  size(540, 670);//screen size
  background (90);//background color
  rect();//calls the rectangle function below
   
  }
  
 // building outline 
 void rect() { 
    rect(92,50,400,700); // size and coordinates of the building's outline
    fill(100); // color of the building
    }
  
  // the windows in the building randomise in their color to represent the effect of the lights being swithched on/off
void draw() {
   
  if (mousePressed) {frameRate(20);//animates the scene, which makes the lights change when mouse pressed by 20 frames per sec
    fill(0,100,400,0);
    triangle(mouseX, mouseY, 92,50,400,700);//drwas traingular shapes from same top left origin point of the building when mouse is clicked which replicates an abstract redesign of facades skin  
  } else {frameRate(1); //animates the scene, which makes the lights change when mouse released by 1 frames per sec
  
  }
 
 int window = 7; //setting an integer value for the windows which would equal 6 in this case since ive set x1&2=1 below ,therefore 6 vertical windows 
 
    //creates a loop for the windows that randomly changes in color according to the fill values below
  for(int x1 = 1; x1<window; x1++) { 
  for (int x2 = 1; x2<window; x2++) {
      
    fill(random(125,250), random(250, 280),random(100,0));// loop for the random colors of the windows
    
     rect(x1*150/1.1, x2*100, 40, 40); //windows sizes & allocation on the buildings facade
   }
 }
}


