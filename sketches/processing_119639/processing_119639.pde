
// Colliding Critters
// Ed Matinian, Creative Technology Module 1 End Assignment, University Of Twente
// Sketch creates a number of cute critters that move and bounce around the screen
// Attributions - code adapted from lecture examples and Animated Sprite (Shifty + Teddy) by James Paterson



int numbcritters=15;                            //defines number of critters
Critters[] crits=new Critters[numbcritters];    
int windowsize=500;                             //window size - do not change value. Background image dimentions need to match window size. If not background image will not display.


void setup(){
  size(windowsize,windowsize);
  for (int j=0; j<numbcritters; j++){          //for loop that creates critters
    crits[j]= new Critters(j, "Critter_", 13); //2nd value statement points to filename of critters with index number and filename extension ommited, 3rd value sets number of frames 
  }
}

void draw(){
  
  PImage bg;
  bg = loadImage("bg.jpg");
  background(bg);
  
  
  for (int j=0; j<numbcritters; j++)
  { crits[j].move_critters();
    crits[j].collide();
    crits[j].draw_critters();}
  }    



class Critters {
  

  float xpos;     
  float ypos;     
  float radius;    // radius of collision body. Make sure to keep it close to the size of critters and collision will look ok.
  float dx;       
  float dy;       
  int id;         
  
  PImage[] images;        // animation related variables
  int imageCount;         // animation related variables
  int frame;              // animation related variables
  
  Critters(int j, String imagePrefix, int count) {  // constructor
    
    imageCount = count;
    images = new PImage[imageCount];
    
    radius=40;
    xpos=int(random(radius,windowsize-radius));
    ypos=int(random(radius,windowsize-radius));
    
    radius=40;
    dx=int(random(-3,4));               // speed in x-direction
    while (dx==0) dx=int(random(-3,4)); // dont want nonmoving critters
    dy=int(random(-3,4));               // speed in y-direction
    while (dy==0) dy=int(random(-3,4)); // dont want nonmoving critters
    
    id=j;
    
    for (int i = 0; i < imageCount; i++) {               // for loop used for animation
    // Use nf() to number format 'i' into four digits   
    String filename = imagePrefix + nf(i, 3) + ".png";     // forms filename of frames to load. current value of "3" determines the decimals in filename index 
    images[i] = loadImage(filename);
    }
  }
      
  void draw_critters() {         
    noStroke();                        // removes collision ellipse stroke 
    ellipse(xpos,ypos,radius,radius);  // draws collision ellipse
    frame = (frame+1) % imageCount;                     
    image(images[frame], xpos -35, ypos -45);   
  }
  
  
  
  void move_critters() {
    //if a critter reaches the left wall or the right wall, it bounces
    if ((xpos>windowsize-radius/2-dx) || (xpos<radius/2-dx))  dx=-dx;
    xpos=xpos+dx;
    //if a critter reaches the top wall or the botton wall, it bounces
    if ((ypos>windowsize-radius/2-dy) || (ypos<radius/2-dy))  dy=-dy;
    ypos=ypos+dy;
  }
  
  void collide() {
    for (int j = id + 1; j < numbcritters; j++) {
      float distx = crits[j].xpos+crits[j].dx - xpos-dx;
      float disty = crits[j].ypos+crits[j].dy - ypos-dy;
      float distance = sqrt(distx*distx + disty*disty);
      float minDist = crits[j].radius/2 + radius/2;
      
      if (distance < minDist) {    // physics of collission
        float angle = atan2(disty, distx);
        float sine = sin(angle);
        float cosine = cos(angle); 
        
        float temp1x = cosine * distx + sine * disty;
        float temp1y = cosine * disty - sine * distx;
        
        float ax = cosine * dx + sine * dy;
        float ay = cosine * dy - sine * dx;
        
        dx = ax;                   // change of the movement vector of the calling object
        dy = ay;
        
        ax = cosine * crits[j].dx + sine * crits[j].dy;
        ay = cosine * crits[j].dy - sine * crits[j].dx;
        
        crits[j].dx = ax;          // change of the movement vector of the other object 
        crits[j].dy = ay;
        
        
      }
    }   
  }
  

  
}


