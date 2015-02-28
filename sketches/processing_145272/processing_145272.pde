
/* Inspired by the book of Douglas R. Hofstadter - GÃ¶del, Escher Bach: an Eternal Golden Braid. 
   My aim was to visualize idea of never-ending, forever self-referencing loop.
   
   Created by Matus Solcany in 2014. 
   
   P.S: Sorry for super-inefficient code, I'm still getting into OOP. 
   
   use r key for relaxed mode or t key for twitchy mode. ( You need to wait approx. one second for mode to take effect. ) */
   


import java.util.*; 

decide myDecide;


controls myControls;

initialCommand myInitialCommand;


int rhytm; // how often will change happen. Based on approximate amount of pixels drawn.(linesPerCycle). min. 100,000, max. 500,000

int count_B; 
int count_E;
int count_G;

int Xmean_B; //Bach's variables declaration
int Ymean_B;
int sd_B;
PImage img_B;
int linesPerCycle_B;
int lengthOfLine_B;

int Xmean_E; //Escher's variables declaration
int Ymean_E;
int sd_E;
PImage img_E;
int linesPerCycle_E;
int lengthOfLine_E;

int Xmean_G; //Godel's variables declaration
int Ymean_G;
int sd_G;
PImage img_G;
int linesPerCycle_G;
int lengthOfLine_G;

int relax = 20; // variable used in controls class, stores possible length of line.
int twitch = 200; // variable used in controls class, stores possible length of line.
int maxLength;

int slowly = 600; // variable used in controls class, stores possible amount of cycles per cycle.
int faster = 1000; // variable used in controls class, stores possible amount of cycles per cycle.
int maxCycles;


void setup() {
  img_B = loadImage("bach.jpg");
  img_G = loadImage("godel.jpg");
  img_E = loadImage("escher.jpg");

  size(607, 700);

  myInitialCommand = new initialCommand();

  myDecide = new decide();
  
  myControls = new controls();
  
  myInitialCommand.start(); 

  background(255);
}

void draw() {
  myControls.keyPressed();

  loadPixels();

  myDecide.decision();
  myDecide.display();

  updatePixels();
}

class Bach {

  Random generator; // declaration of variable which provides gaussian distribution


  int x; // X position of pixel in pixel array
  int y; //Y position of pixel in pixel array

  int loc; // location of pixel

  color c; // color data of given pixel

  



  Bach() {


    generator = new Random(); //initialize Gaussian Generator
  }





  void grow () {

    for (int i = 0; i < linesPerCycle_B; i ++) {
      count_B += 1;
      float num = (float) generator.nextGaussian(); // get gaussian number with Mean of 0 and Standard distribution of 1
      float num1 = (float) generator.nextGaussian();


      // Calculate X and Y coordinate of Pixel. Round it(to restrict it to integer based pixel array). 
       
      x = round(sd_B * num + Xmean_B); 
      y = round(sd_B * num1 + Ymean_B);

      int lengthrand = int(random(lengthOfLine_B)); // calculate random length of line of pixels which will be drawn.

      loc = x + y * width;   // Calculate location in pixel grid


      loc = abs(constrain(loc, 0, pixels.length) - lengthrand);   // restrict location to the range of given pixel array


      for (int b = loc; b < loc + lengthrand; b++) { // draw pixels on screen
        c = img_B.pixels[b];
        pixels[b] = c;
      }
    }
  }
}



class Escher {
  
  Random generator; 
  


  int x; 
  int y; 

  int loc; 

  color c; 
  

  
  Escher() {
    

       generator = new Random(); 

  }
  
  void grow () {
    
    for (int i = 0; i < linesPerCycle_E; i ++) {
      count_E +=1;
      float num = (float) generator.nextGaussian(); 
      float num1 = (float) generator.nextGaussian();


       
      x = round(sd_E * num + Xmean_E); 
      y = round(sd_E * num1 + Ymean_E);

      int lengthrand = int(random(lengthOfLine_E));

      loc = x + y * width;  


      loc = abs(constrain(loc, 0, pixels.length) - lengthrand);   


      for (int b = loc; b < loc + lengthrand; b++) { 
        c = img_E.pixels[b];
        pixels[b] = c;
      }
    
    }
  }
}
class Godel {
  
  Random generator; 
  


  int x; 
  int y; 

  int loc; 

  color c; 
  

  
  Godel() {

       generator = new Random(); 
      

  }
  
  void grow () {
    
    for (int i = 0; i < linesPerCycle_G; i ++) {
      count_G +=1;
      float num = (float) generator.nextGaussian(); 
      float num1 = (float) generator.nextGaussian();


      
      x = round(sd_G * num + Xmean_G); 
      y = round(sd_G * num1 + Ymean_G);

      int lengthrand = int(random(lengthOfLine_G));

      loc = x + y * width;   


      loc = abs(constrain(loc, 0, pixels.length) - lengthrand);   


      for (int b = loc; b < loc + lengthrand; b++) { 
        c = img_G.pixels[b];
        pixels[b] = c;
      }
    
    }
  }
}
class controls {



  controls() {
  }

  void keyPressed() {

      if (key == 'r' || key == 'R') {
        maxLength = relax;
        maxCycles = slowly;
        rhytm = 35000;
      }
    
        if (key == 't' || key == 'T') {
          maxLength = twitch;
          maxCycles = faster;
          rhytm = 7000;
        }
      }
    }
    
class decide {

  Bach myBach;
  Godel myGodel;
  Escher myEscher;

  int r;
  
  int count;

  decide() {

    myBach = new Bach();

    myGodel = new Godel();

    myEscher = new Escher();
    
    
  }

  void decision() {
      rhytm = constrain(rhytm, 100000, 500000);

      count = count_B + count_E + count_G; // adds all pixels that where drawn.
      
      
      if(count > rhytm) {
        
         r = int(random(3));


      if (r == 0) {
          Xmean_B = int(random(100, width-100));
          Ymean_B = int(random(100, height-100));
          sd_B = int(random(80, 130));
          linesPerCycle_B = int(random(300, maxCycles));
          lengthOfLine_B = int(random(4, maxLength));
        
      }


      if (r == 1) {
          Xmean_E = int(random(100, width-100));
          Ymean_E = int(random(100, height-200));
          sd_E = int(random(80, 130));
          linesPerCycle_E = int(random(300, maxCycles));
          lengthOfLine_E = int(random(4, maxLength));
        }
      


      if (r == 2) {

          Xmean_G = int(random(100, width-100));
          Ymean_G = int(random(100, height-100));
          sd_G = int(random(80, 130));
          linesPerCycle_G = int(random(300, maxCycles));
          lengthOfLine_G = int(random(4, maxLength));
        
      }
      count_B = 0; //start over
      count_E = 0;
      count_G = 0;
      count = 0;
    }
  }





  void display() {

    myBach.grow();
    myGodel.grow();
    myEscher.grow();
  }
}

class initialCommand {


  initialCommand() {
  }


  void start() { //sets starting values;
    
     maxCycles = slowly;
     maxLength = relax;


    Xmean_B = int(random(50, width-50));
    Ymean_B = int(random(50, height-50));
    sd_B = int(random(80, 130));
    linesPerCycle_B = int(random(300, maxCycles));
    lengthOfLine_B = int(random(4, maxLength));

    Xmean_E = int(random(50, width-50));
    Ymean_E = int(random(50, height-50));
    sd_E = int(random(80, 130));
    linesPerCycle_E = int(random(300, maxCycles));
    lengthOfLine_E = int(random(4, maxLength));

    Xmean_G = int(random(50, width-50));
    Ymean_G = int(random(50, height-50));
    sd_G = int(random(80, 130));
    linesPerCycle_G = int(random(300, maxCycles));
    lengthOfLine_G = int(random(4, maxLength));
  }

}

