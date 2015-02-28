
// micky mouses with class, array, collision and creation on mouseclick
// mouses change clothing when hitting each other or walls

int maxmouse = 20;
mouse [] mice = new mouse[20]; //declaration of the array of mouses
int i=0;        //number of mouses that is created
int windowsize=650;


void setup() {
  size(windowsize, windowsize);
  smooth();
}

void draw() {
  background(255);
// i contains the number of mouses created so far
  for (int k = 0; k< i; k++) {    //calls of the methods
    mice[k].move_mouse();
    mice[k].collide();
    mice[k].draw_mouse();
  }
}
void mousePressed() {    
  if (i < maxmouse)
  { 
    mice[i] = new mouse();   //creation of a new mouse
    i++;
  };
}



class mouse {
  
  color c;        // a mouse has a colour
  float xpos;     // a mouse has a x-position
  float ypos;     // a mouse has a y-position
  float radius;   // the eclipse which lays under the mouse has a radius
  float dx;       // the mouse moves with some speed in x direction
  float dy;       // the mouse moves with some speed in y direction
  int id;         // we need an id for each mouse
  //constructor: gives values to the variables
  mouse() {  
    c= color(int(random(0,255)), int(random(0,255)), int(random(0,255))); //a random colour
    xpos=mouseX;
    ypos=mouseY;
    
    radius=60;
    dx=int(random(-2, 4));               // speed in x-direction
    while (dx==0) dx=int(random(-2, 4)); // dont want nonmoving mouses
    dy=int(random(-2, 4));               // speed in y-direction
    while (dy==0) dy=int(random(-2, 4)); // dont want nonmoving mouses
    
    id=i;  // i is a global variable that counts how many mouses we already have created
  }
  
mouse(int _xpos, int _ypos, int _dx, int _dy){
  xpos= _xpos;
  ypos= _ypos;
  radius= 20;
  dx= _dx;
  dy= _dy;
  id=i;
  }

  void draw_mouse() {
    fill(0); //black coloured ears and head
    noStroke();
    //ears
    ellipse (xpos+50, ypos+20, 25, 25);
    ellipse (xpos+10, ypos+20, 25, 25);
    //head 
    ellipse(xpos+30, ypos+40, 37, 37);
    //eyes
    fill(255, 255, 255); //white coloured eyes
    ellipse (xpos+33, ypos+35, 2, 6);
    ellipse (xpos+27, ypos+35, 2, 6);
    fill(c);
    //body
    ellipse(xpos+30, ypos+80, 35, 40);
    //legs 
    rect(xpos+19, ypos+70, 5, 60);
    rect(xpos+37, ypos+70, 5, 60);
    //arms
    rect(xpos+3, ypos+65, 15, 5);
    rect(xpos+40, ypos+65, 15, 5);
    rect(xpos+3, ypos+55, 5, 10);
    rect(xpos+50, ypos+70, 5, 10);
    //feet
    ellipse(xpos+21, ypos+123, 16, 17);
    ellipse(xpos+41, ypos+123, 18, 16);
    //hands 
    fill(220, 220, 220); //grey coloured hands
    ellipse(xpos+3, ypos+48, 10, 10);
    ellipse(xpos+55, ypos+87, 10, 10);
  }

  void move_mouse() {
    //if the confetti reaches the left wall or the right wall, it bounces
    // added the case that is is over the border: then it is just put at the border
    if (xpos>windowsize-radius/2-dx) { 
      xpos=windowsize-radius/2-dx; 
      dx=-dx;
      c= color(0,0,255);  //the mouses get blue when it reaches the right wall
    }
    if (xpos<radius/2-dx) { 
      xpos=radius/2-dx; 
      dx=-dx;
      c= color(255,0,0);  //the mouses get red when it reaches the left wall  
    }
    xpos=xpos+dx;
    //if the mouse reaches the top wall or the bottom wall, it bounces
    // added the case that is is over the border: then it is just put at the border
    if (ypos>windowsize-radius/2-dy) { 
      ypos=windowsize-radius/2-dy; 
      dy=-dy;
     c= color(0,255,0);  //the mouses get green when it reaches the bottom wall     
    }
    if (ypos<radius/2-dy) {
      ypos=radius/2-dy;  
      dy=-dy;
     c= color(255,255,0);  //the mouses get yellow when it reaches the top wall
    }
    ypos=ypos+dy;
  }
   
  
  void collide() {
    float distx, disty;   // to calculate the distance between mouses for collision detection
    float distance, distance1, minDist;  // different versions of mouse distance
    float axisx, axisy;  // the vector between the mouse centers
    // the new force vectors for the colliding mouses
    float temp1x, temp1y, temp2x, temp2y, temp3x, temp3y, temp4x, temp4y;

    // for each mouse only those with greater index are checked
    // otherwise we get double checks of the same collision
    for (int j = id+1; j < i; j++) {
      // check here, whether there would be a collission in the next step
      distx = mice[j].xpos + mice[j].dx - xpos-dx;
      disty = mice[j].ypos + mice[j].dy - ypos-dy;
      distance = sqrt(distx*distx + disty*disty);
      minDist = mice[j].radius/2 + radius/2;      // radius here is actually the diameter
      if (distance < minDist) {  // collision case
        //physics of collision
        //collision for the first mouse
        // this is the axis between the centers of the mouses
        axisx = mice[j].xpos-xpos;
        axisy = mice[j].ypos-ypos;
        c=color(0);  //mouses get black when they collide
        // for normalisation we need the length of the vector axis 
        distance1 = (axisx*axisx+axisy*axisy);
        // if the speed of the first mouse was zero, then the force vectors are all zero
        if (dx*dx+dy*dy==0) { 
          temp1x=0; 
          temp1y=0; 
          temp2x=0; 
          temp2y=0;
          
        }
        else {  
          // the projection of the (dx,dy) speed vector on the axis vector 
          // this vector will go to the second mouse
          temp1x = axisx * ((axisx*dx + axisy*dy) / distance1);
          temp1y = axisy * ((axisx*dx + axisy*dy) / distance1);
          // this must be the missing vector in the triangle
          // this will be the speed vector that the mouse keeps
          temp2x = dx - temp1x;
          temp2y = dy - temp1y;
          
        }
        // now for the other mouse, pretty symmetrically
        // this is the axis between the centers of the mouses
        axisx = -axisx;
        axisy = -axisy;

        // if the speed of the second mouse was zero, then again both force vectors are zero
        if ((mice[j].dx*mice[j].dx+mice[j].dy*mice[j].dy)==0) {
          temp3x=0; 
          temp3y=0; 
          temp4x=0; 
          temp4y=0;
          
        }
        else {
          // the projection of the (dx,dy) vector of the second mouse on the axis vector 
          // this force vector will go to the first mouse
          temp3x = axisx * ((axisx*mice[j].dx + axisy*mice[j].dy) / distance1);
          temp3y = axisy * ((axisx*mice[j].dx + axisy*mice[j].dy) / distance1);
          // this must be the missing vector in the triangle
          // this will be the speed vector that the mouse keeps
          temp4x = mice[j].dx - temp3x;
          temp4y = mice[j].dy - temp3y;
         
        }
        // the new speed vector gets a component from the first and from the second mouse
        // tried to bring in that smaller mouses have less momentum,
        // but taking the "real" physical value looks weird
        dx = temp2x + pow(mice[j].radius/radius, 1.7) * temp3x;
        dy = temp2y + pow(mice[j].radius/radius, 1.7) * temp3y;
        // the new speed vector gets a component from the first and from the second mouse
        mice[j].dx = pow(radius/mice[j].radius, 1.7) * temp1x + temp4x;
        mice[j].dy = pow(radius/mice[j].radius, 1.7) * temp1y + temp4y;
      }
    }
  }
}

