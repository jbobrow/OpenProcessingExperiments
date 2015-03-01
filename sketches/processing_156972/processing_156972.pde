
//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 8, gravity
// Now turning all our properties into arrays
// Inspired by the work of Adrien M and Claire B
// Borrowing some code from Daniel Shiffman's
// "Learning Processing", Chapter 5
//----------------------------------------------------

int numObj = 50; //How many objects we have

//Declaring the properties of our object:
float[] size = new float[numObj];
float[] posX = new float[numObj];
float[] posY = new float[numObj];
float[] hue = new float[numObj];
char[] c = new char[numObj];
float[] speedX = new float[numObj];
float[] speedY = new float[numObj];
Boolean[] isMoving = new Boolean[numObj]; //is our object stationary or not?

//"Environment" properties
float gravity;      //That is, acceleration toward the bottom

void setup(){
  size(800, 800);
  colorMode(HSB);
  
  
  for(int i = 0; i < numObj; i++){
    size[i] = random(30, 80);
    posX[i] = random(width);
    posY[i] = random(height - 200);  
    hue[i] = random(90, 140);
    
    c[i] = (char) int(random(65, 90)); //converts a random number value that corresponds to ASCII codes into a char
    speedX[i] = 0;  
    speedY[i] = 0;
    isMoving[i] = false;
  }
  
  gravity = 0.8; //the rate at which things fall
}

void draw(){
  background(20);

  for(int i = 0; i < numObj; i++){
    fill(hue[i], 255, 225); //assign all the random colors
    float distance = dist(mouseX, mouseY, posX[i], posY[i]); //create a new variable to store the distance
  
    //Checking distance to mouse
    if(distance < size[i]/2 && !isMoving[i]){
        
      isMoving[i] = true; //trigger the movement for this letter
      speedX[i] = mouseX - pmouseX; //use the previous mouse position to determine the direction the collision came from
    }
    
    //Physics
    if(isMoving[i]){ //
      posX[i] = posX[i] + speedX[i];
      posY[i] = posY[i] + speedY[i];
      
      speedY[i] = speedY[i] + gravity; //speed y is increasing due to acceleration, gravity is decelerating
     
      if (posY[i] > height - size[i]/2) { //keep object on screen
        posY[i] = height - size[i]/2;      
        // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
        speedY[i] = speedY[i] * -0.6; //dampening makes the letter bounce back (negative Y movement is up in the sketch)
       
       
        //Still, it may bounce forever unless we make it stop
        if(abs(speedY[i]) < 3){
          speedY[i] = 0; //stop moving on the y
          speedX[i] = 0; //stop moving to the left or right after you stopped bouncing
        }
      println(speedY[i]);

      }
    }
    
    //Drawing the object
    textSize(size[i]);
    textAlign(CENTER, CENTER);
    text(c[i], posX[i], posY[i]);
  }
}
