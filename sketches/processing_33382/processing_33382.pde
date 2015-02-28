


int line_y = 0;
int space_between_line = 10;

int x = 0;
int y = 0;


int a = 0; //parade attempt
int b = 10; //parade attempy


 
int size = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 3.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;


void setup(){

  size(600,600);
  background(255);
  
  noStroke();
   smooth();
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
  
  frameRate(10);
}

void draw(){
  
    

  
  background(255,0,0);

if(line_y < height){

  
  strokeWeight(5);  
  line(0, line_y, width, line_y);
  
  line_y += space_between_line;
  
  strokeWeight(1);
  background(255);
  
              
                        for( int i= 10; i <= width - 10; i+=25) {
                      // do stuff   --------write code that you want to execute inside the brackets
                        
                        
                         fill(random(255), random(255), random(255));
                          ellipse(i,b, 20,20);
                          
                      
                      }
                        b+=5;
  
   for( int i= 5; i < width; i+=10) {
// do stuff   --------write code that you want to execute inside the brackets
  fill(random(255), random(255), random(255));
  ellipse(x+i, y+i, i, i);


fill(random(155),random(155),random(155));
 // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1

  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  

  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
    
  
  }



  // Draw the shape
  ellipse(xpos+size/2, ypos+size/2, size, size);


}

}


}

