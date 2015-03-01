
// sets red colour
color c = color(250,0,0); 

void setup() { 

  size(500, 500); 
  background(0); 
  // sets origin of DLA and colour
  set(width/2, height/2, c);
  
} 


void draw() { 

  loadPixels(); 

  for (int i=0; i<200; i++) { 

// TWO_PI twice the ratio of the circumference of a circle to its diameter
// Sets the limits of the circle 
    float r = random(TWO_PI); 
    // width/2 tells x to go to half way across canvas
    // height/2 tells y to go to half way down canvas 
    // x, y coordinates set origin of circle
    // int(width/3*sin(r)defines extends of ellipse in the hirizontal
    // int(height/5*cos(r) defines extends of ellipse in the vertical
    int x = width/2 + int(width/3*sin(r)); 
    int y = height/2 + int(height/5*cos(r)); 

// it will be executed wihin the limits set in loop, therefore DLA will expand as far as circle
    while (x>2 && x<width-2 && y>2 && y<height-2) { 

//sets number of directions for expandian
      int move = (int)random(4); 

//Expension in 4 directions ste at right angles
      if (move == 0) {  
 x++;
      } else if (move == 1) {  
 x--;
      } else if (move == 2) {  
 y++;
      } else if (move == 3) {  
 y--;
      } 


      if (pixels[y*width+x-1]==c || pixels[y*width+x+1]==c || pixels[(y+1)*width+x]==c || pixels[(y-1)*width+x]==c) { 


        pixels[y*height+x] = c; 


        break;
      }
    }
  } 


  updatePixels();
} 










