
//This class controls the animations of the boss. It occupies locations 4 and 1 on the left hand side of the window. 
class boss {
  int count;
  float last;
  PImage[] bossimage = new PImage[3]; 

void update () {                                                                                //Load the images into the array.
  for (int i = 0; i < bossimage.length; i++) {
    bossimage[i] = loadImage("boss" + i + ".png");
  }
}

void display () {                                                                               //Display the images for each stage of formation. Using a flag ensures atomicity. 
  if (count == 1) { image(bossimage[0], -20, 90);; }
    else if (count == 2) { image(bossimage[1], -20, 90);; } 
    else if (count == 3) { image(bossimage[2], -20, 90);; }             
}

void spawn () {                                                                                 //Only allows the animation to update once every 0.5 seconds. 
  if (((millis() - last) > 500) && (count == 1)) { last = millis(); count = 2; }
    else if (((millis() - last) > 500) && (count == 2)) { last = millis(); count = 3; } 
    else if (((millis() - last) > 2500) && (count == 3)) { last = millis(); count = 0; } 
    else if (((millis() - last) > 500) && (count == 0)) { last = millis(); count = 1; }  
}                                                                                               //Add an extra image featuring the boss death for level 3.   

}

