
//Class for the airplane

class Airplane {
    int value = 0;
     float x= 180;
     float y= 400;
     float angle = 0.0;
     int images = 3; // 3 Images set for sky
     int frame = 0; 

     // Array for airplane
      PImage[] airplanes = new PImage[images];
        Airplane(){
          airplanes[0] = loadImage("airplane.png"); // calling up the airplane image 
                  }

  void display () {
  
    x = (mouseX);
    y = (mouseY);      //x and y coordinates

  imageMode(CENTER); //Makes the mouse locate itself in the center of the image. 
  
  image (airplanes[0], x, y); //calling up the image in the array
  
                }  
            }

