
//INTERACTIVE TOOL, you control the ball via clicking to change the direction
 //use ‘z’ to speed up and ‘x’ to slow down, 
 //try to make it through the maze to the pad.


//setup ball

float d = 20;
float x = d/2;
float y = d/2;
float xspeed = 4;
float yspeed = 6;

 
void setup() {
 
  size (600, 600);
  smooth();
}
 
void draw () {
 
  background(255);
 
  //Ball Movement
  x = x + xspeed;
  y = y + yspeed;

 
 //Draw Ball
  fill (220, 0, 0);
  ellipse (x, y, d, d);
  noStroke();
 
 //Check the sides and change direction
  if (x > width-d/2 || x < d/2 ||  x<100 && y>300) {
    xspeed = xspeed * -1;
  }
   
  if (y > height-d/2 || y < d/2) {
    yspeed = yspeed * -1;
  }
 //MAKE A MAZE
 fill (0);
 rect(100, 0, 20,100);
 rect(400,400,20,200);
 rect(100,80,300,20);
 rect(200,100,20,150);
 rect(80,300,20,300);
 rect(300,400,100,20);
 rect(500,0,20,400);
 rect(300,300,20,100);
 rect(200,400,20,100);
 rect(400,200,100,20);
 
 
 //make the landpad
 ellipse(530,530,50,50);
 fill(200,0,0);
 noStroke();
 ellipse(530,530,40,40);
 fill(200,0,0);
 noStroke();
 
}
  
  //INTEREACTIVE PART, when clicked direction changes, how to get through the maze
  void mousePressed (){
    xspeed = xspeed * -1;
         
  }
   
//Pressing a key makes it go faster (a) or slower (d)
   
  void keyPressed (){
    if (key == 'z'){
      xspeed = xspeed *2;
      yspeed = yspeed *2;
    }
        
     if (key == 'x') {
       xspeed = xspeed /2;
       yspeed = yspeed /2;
     }
  }

