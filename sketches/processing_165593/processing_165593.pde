
int numStars = 200;
float xPos[] = new float [numStars];
float yPos[] = new float [numStars];
float xSpeed[] = new float [numStars];
float ySpeed[] = new float [numStars];



void setup() {
  
  size(600,600); 
  background(0);
  smooth();
  noStroke();

 for (int i = 20; i < numStars; i += random(10000,100000)) {
    fill(255);
    ellipse(random(width), random(height), 3, 3);
    
    //xPos[i] = int(random(0, width));
    //yPos[i] = int(random(0,height));
    //xSpeed[i] = random(-1,1);
    //ySpeed[i] = random(-1,1);
    
    
   

  }
}


void draw() {
  
  fill(0, 3);
  rect(0, 0, width, height);
  
   
  for (int i = 50; i < numStars; i += random(10000,100000)) {
    fill(255);
    ellipse(random(width), random(height), 3, 3);
    
  
     
      }
      
     // starMovement ();
}

// Movement array code taken from Huitian Angela Chen
//void starMovement () {
  //for (int i=0; i<numStars; i++) {
    //xPos[i] = xPos[i] + xSpeed[i];
    //yPos[i] = yPos[i] + ySpeed[i];


 


  // The idea to draw a low opacity rectangle to clear the screen
  //  rather than using the background() came from Youtube user
  //  'hamold' on Youtube in his video here:
  //  https://www.youtube.com/watch?v=spGP0B8SGnk.
 



