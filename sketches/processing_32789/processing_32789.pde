
//Follow the Bouncing Ball
//Day 4 HW, Code Yellow, Juan Pablo Patino

//Begin with a ball at the top
//Starting direction is down
//  
//Repeat this sequence 
//{
//  The ball moves to the floor
//
//  When it reaches the bottom Switch rules for direction
//   
//  The ball moves to the top
//
//  When it reaches the top Switch rules for direction
//}

//HW Part Deux - New Drawing with type on top

PFont myFont;
  int fontPosY = 135;

void setup() {
     size(600,300);
     background(#1E102C);
     smooth();
     colorMode(HSB,600);
     println("The sun is gone, but I have a light.");
     println("-Kurt Cobain of Nirvana, Dumb from In Utero, 1993");
     
}

//This next section is copied from today's exercise. Then tweaked with the mousePress function.
//Big ups to Dan and Sam for showing me the light!

  void draw () {
   //randomSeed(0);
   if(mousePressed) {
     for(int i=0; i<width; i+=30) {
       for(int j=0; j<height; j+=30) {
         fill(random(0,500),100,1000); 
         // second two parameters are for saturation and brightness
         // which are 0 to 100 by default
         rect(i,j,30,30);
        }
      }
   }  
   else{
     fill(#1E102C);
     rect(0,0,600,300);
     fill(#FFB005,75);
     noStroke();
     ellipse(369,172,50,50);
     myFont=createFont("Helvetica",48,true);
     textFont(myFont);
     fill(255);
     text("The sun is gone",50,fontPosY);
     fill(#FFFABF);
     text("but I have a light.",65,fontPosY+50);      
   }
}


