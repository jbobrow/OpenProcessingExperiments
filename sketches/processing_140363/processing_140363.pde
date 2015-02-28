
//Dan Riemen
//Under direction of Florence Gouvrit
//March 18th, 2014
//Project 2

Eater MyEater;                                          //Build the block that eats circles

 // int count = 0;                                      //debugging for the intersecting command

int satiation = 0;

int eaten = 0;

Nummin[] n = new Nummin [50];                           // Build 50 circles to be eaten


void setup(){
  
  size(800, 600);
  MyEater = new Eater (119, 200, 200, 20);              
  for (int i = 0; i < n.length; i++) {                 //use a for loop to make the circles, named "Nummin"s
  n[i] = new Nummin();
}
}

void draw(){

  background(255);
  MyEater.display();
  MyEater.embark();                                      //Eaters walk command is listed as "embark", while Nummins are "Exist",
  for (int i = 0; i < n.length; i++) {                        //to help keep them separate
    n[i].display();
    n[i].exist();
    //*                                                   //These are just a set of ellipses that make it seem as if this is being viewed through a microscope
    stroke(24, 24, 24, 2);                                //while visually necessary, they kill the framerate on my machine, so I have comment asterisks nearby just in case
    strokeWeight(200);
    fill(201, 233, 114, 4);
    ellipse(400, 300, 900, 900);
    noFill();
    stroke(24, 24, 24, 20);
    strokeWeight(200);
    ellipse(400, 300, 900, 900);
    //*/
   if (n[i].intersect(MyEater)){
      //println( "it's working" + count);                   //more debugging to make sure everything was working
      //count = count + 1;               //somehow, it was
    //as far as I understand, this if statement isn't doing anything. That being said, when it's here, it makes the intersect function as intended. 
  }
  
  if (keyPressed)         //Press R to restart
  if (key == 'r' || key == 'R') {
  setup();
} //--end keyPressed

 
}
}

class Nummin{
  int g = 255;
  int xposn;
  int yposn;
  
  Nummin(){
    xposn = int(random(width));
    yposn = int(random(height));
  }
  
  void display(){
    noStroke();
     fill(112, 112, 112, 112);
    ellipse(xposn + 5 , yposn + 5, 10 + 10, 10);
    fill(194, 215, 111, g);
    ellipse(xposn, yposn, 10, 10);
  }
  
  void exist(){
    if (xposn > width && xposn < (width + 100)) {
      xposn = 0;
    }
    if (xposn < 0 && xposn > (width + 100)) {
      xposn = width;
    }
    if (yposn > height && yposn < (height + 100)) {
      yposn = 0;
    }
    if (yposn < 0 && yposn > (height + 100)) {
      yposn = height;
    }
   
    int option = int(random(4));            //A movement if ladder taken from an example
    
    if (option == 0) {    
      xposn++;
    } else if (option == 1) {
      xposn--;
    } else if (option == 2) {
      yposn++;
    } else {
      yposn--;
    }   
    
  }
    
    
     boolean intersect(Eater MyEater) {                       // Use Object as arguments in functions
     float d = dist(xposn,yposn,MyEater.xpos,MyEater.ypos);  //distance between any given Nummin and the Eater
     if ((d > 0) && (d < 5 + eaten)) {               
       g = 0;         //if a Nummin is eaten, it "disappears" (sets its opacity to 0)
       xposn = xposn - 1000;          //and moves off of the area to make sure it doesn't accidentally get eaten while invisible. 
       yposn = yposn - 1000;
       satiation = satiation + 50;
       eaten = eaten + 5;
       return true;
     } else {
        return false;
     }
  }//--end boolean
  
  }



class Eater {
  
  int h;
  int xpos;
  int ypos;
  float size;
  float hunger;
  
  Eater(int EaterH, int EaterXpos, int EaterYpos, float EaterSize) {
    h = EaterH;
    xpos = EaterXpos;
    ypos = EaterYpos;
    size = EaterSize;
    
  }
  
  void display() {
    noStroke();
    fill(112, 112, 112, 112);
    rect(xpos , ypos + 5, size + eaten + 10, size + eaten);
    fill(h + hunger,136 - hunger,153 + hunger);                            //Eater's level of hunger is displayed by its hunger
    rect(xpos, ypos, size + eaten, size + eaten);
  }
  
  void embark() {
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = width;
    }
    if (ypos > height) {
      ypos = 0;
    }
    if (ypos < 0) {
      ypos = height;
    }
    
    int option = int(random(4));
    if (option == 0) {
      xpos = xpos + 3;
    } else if (option == 1) {
      xpos = xpos - 3;
    } else if (option == 2) {
      ypos = ypos + 3;
    } else {
      ypos = ypos - 3;
    }   
    
    hunger = hunger + 0.1;                                            //hunger grows steadily over time
    hunger = hunger - satiation; 
    satiation = 0; 
  }
}


