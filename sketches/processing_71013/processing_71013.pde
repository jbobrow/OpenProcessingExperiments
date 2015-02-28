
//initial code provided in-class by Francisco and modified by me.

class Spot {
  float xPos, yPos, s_ize; //basic parameters of the spot object
//  float mouseXpos, mouseYpos; //not sure these are necessary. see below in the void update ("confused comment block").
  float mouseDist; //gonna calculate the distance between the mouse and the center of the spot...
  float mouseDistMapped; //...then reduce that distance proportionately for controlling the size of the spot.
  int lim = 200; //control the size of the area in which spot size is affected. 
  int r_color = 58; //red fill value
  int b_color = 68; //blue fill value

  Spot(float x_, float y_, float s_){ //give the spot object its inherent properties - this is a "constructor" so we don't need
  //a "void" and/or separate function.
    xPos = x_; //I don't totally get this (see the "confused comment block") but we are setting the constructor's parameters
    //(which will be given when we call the object in the main tab) equal to a variable outside the constructor, which is used
    //in the "display" function.
    yPos = y_; //ditto
    s_ize = s_; //ditto
  }

  void update(float mx, float my){ //will supply these variables with their values in the main tab when calling the function.

//THIS IS MY CONFUSED COMMENT BLOCK:    
//    mouseXpos = mx; //I still don't entirely understand this setting the local variable (mx) equal to a global variable (mouseXpos),
//but the code seems to work the same regardless in this case, so I commented out what appears to be a superfluous step.
//    mouseYpos = my; //ditto.
//    mouseDist = dist(mouseXpos, mouseYpos, xPos, yPos); //if using line below, remove this one.
//(END CONFUSED COMMENT BLOCK.)    
    mouseDist = dist(mx, my, xPos, yPos); //if using line above, remove this one.
    //this calculates the distance between the point (identified in the main tab as the mouse position) and the center of the spot.
    mouseDist = constrain(mouseDist, 0, lim); //the actual distance between the mouse and the spot's center controls the size
    //of the spot. but we only want the effect to apply up to a certain distance so only nearby spots are affected. we use
    //constrain to limit how big mouseDist can get so that the spots outside our chosen distance are all the same size.
    //otherwise spots at a distance greater than that specified in the mapping below will not have their distances mapped and
    //will behave incorrectly (in this case getting larger). Now any distance greater than 200 becomes mouseDist of 200.
    mouseDistMapped = map(mouseDist, 0, lim, 1.5, 0.3); //since we are multiplying the size of the spot by its distance from
    //the mouse, and distances get pretty big, we need to reduce the proportionate size of the distance so the spots aren't
    //enormous. We map any distance from 0 to 200 onto the much smaller range of 1.5 to 0.3. Each distance keeps its relative
    //place in the size range (so the effect works the way we want), but the number we use to draw the ellipse is much more
    //managable. By putting the big number (1.5) before the small (0.3), we set an inverse relationship so that the bigger
    //the distance from the mouse, the smaller it makes the spot size. 
  }
  
  
  void display(){
//    fill(#3AF044); //one color for all.
    fill((r_color + 100*mouseDistMapped), (240 - 200*mouseDistMapped), (b_color - 50*mouseDistMapped)); //color changes based on how close the mouse is.
    noStroke();
    ellipse (xPos, yPos, s_ize * mouseDistMapped, s_ize * mouseDistMapped); //size of ellipse changes depending on proximity of mouse.
  }
 
}

