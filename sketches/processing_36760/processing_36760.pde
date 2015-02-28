


// Code of random house placement in a subdivision  
 
void setup() {   

  size(600, 600);  

  background(46,164,15); 

  frameRate(7);   

}  

   

   

float count = 7; // Starts the city on the left side of the screen - at 0   

float num = 30; // Controls the width and number of houses    

int numOfhouses = 75; //Controls the number of houses

float RandomNumberX;
float RandomNumberY;

   

void draw() {    


  // House random count  

  if (numOfhouses > 0) {  
  RandomNumberX = random(width);
  RandomNumberY = random(height);
  
    noStroke();   

    fill(255);  

    rect (RandomNumberX, RandomNumberY, 20, 20);
       
    
    triangle(RandomNumberX, RandomNumberY, RandomNumberX+10, RandomNumberY-10,RandomNumberX+20,RandomNumberY);
    numOfhouses--; 
  }  
}
  


