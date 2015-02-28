
//Made by Emma Wexler for BPIM:2, G Block 4/13/14
// program to have soccer ball shoot to different spots 
//and goalie randomly choose to dive to different spots
//simulates a PK, if the goalie saves it screen turns red 
//some of the starting code came from http://www.learningprocessing.com/examples/chapter-10/example-10-2/
//Thanks to Ms. Freed, Heidi and Dalton for help and inspiration 
//the programm still needs a lot of work, I would like to have it reset with a button, have the program interact with the user,
//have the ball shoot to both sides of the goal, have the goalie respond to the shot instead of guessing (however many goalkeeper do guess on PKs)
// video for inspiration http://www.youtube.com/watch?v=SzhdaByUiWU

Ball ball1; //introduces objects 
Ball ball2; 


void setup() {
   size(500,400); 
   
 ball1 = new Ball(250,300); //starting positions for ball/goalkeeper 
 ball2 = new Ball(250, 65); 

  
}

void draw() {
  
 field(); 
 ball1.shoot(); //call shooting function for shooting ball
 ball2.keep(); //call goalkeeping function for keeper
 
if (ball1.x - ball2.x < 0.01 && ball1.y - ball2.y < 0.01) {
  background(200, 30, 50); //if they are in the same place that's a save and turns red
  
}

  
 
}

void field() { //have one function to set the background 
  background(20,100,50);
  rect(50,5, 400, 60);
 
  ellipse(250, 300, 30, 30); 
}


//The class of objects for the striker/keeper (although both represented as soccer balls)
class Ball {
  float x; 
  int y; 
  float theta; 
 float side ; 

 
  
  Ball(int posx, int posy) {
    x = posx;
    y = posy; 
   
   int i = int(random(0,4)); 
  
   float[] angles = { 0, 15, 30, 45, 60}; 
   float[] sines = { 0, 0.2588 , 0.5 , 0.707, 0.866 }; 
   theta = angles [i] ;
   
   side = sines[i] ; 

    println(theta);
    
 
    
  }
  
  void shoot() { //shooting function
  if (y > 60){
   y -= 1; 
   x = x + side; 
  ellipse(x, y, 20, 20);
 }  
    
   
  }
  
  
  void keep() { //keeping function 
   if (x < (250 + 240*side))  {
     x += 1;
   }
   
ellipse(x, 60, 20 , 20) ;

  }
  
 
  
}

