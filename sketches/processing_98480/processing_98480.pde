
class Ghost {

  color c;                              // int for the color
  float agex;                           // float for the x diameter
  float agey;                           // float for the y diameter
  float xpos;                           // float for the x position of the center of the ghost
  float ypos;                           // float for the y position of the center of the ghost
  float eyeheightl;                     // float for the eye height of the left eye
  float eyewidthl;                      // float for the eye width of the left eye
  float eyeheightr;                     // float for the eye height of the right eye
  float eyewidthr;                      // float for the eye width of the right eye
  float speedx;                         // float for the horizontal speed
  float speedy;                         // float for the vertical speed
  int id;                               // float to identify every ghost


Ghost()
{                                       // choosing a random greyish/white color for the ghost
  c= color(int(random(220,255)), int(random(220,255)), int(random(220,255)));
  xpos=mouseX;                          
  ypos=mouseY;                          // xpos and ypos are the same as the mouse cursor
  agex= random(25,75);                  
  agey= agex*1.5;                       // randomize the size of the ghost
  eyewidthl= random(0.20,0.40);         
  eyeheightl= random(0.20,0.40);        
  eyewidthr= random(0.20,0.40);          
  eyeheightr= random(0.20,0.40);        // randomize the eye height and size of the left and right eye seperatly 
  speedx=int(random(-3, 3));            // speed in horizontal-direction
  while (speedx==0) speedx=int(random(-2, 2));   // to avoid not moving ghosts
  speedy=int(random(-3, 3));            // speed in vertical-direction
  while (speedy==0) speedy=int(random(-2, 2));   // to avoid not moving ghosts
  id=i;                                 //to count the number of new ghosts
}


void draw_ghost()
{
  noStroke();                            // remove the line from the shapes
  fill(c);                               // fill the body of the ghost with the random color c from above
  ellipse(xpos,ypos,agex,agey);          // draw the body
  ellipse(xpos-(agex*0.35),ypos+(agey*0.26),agex*0.33,agey*0.45);    
  ellipse(xpos+(agex*0.35),ypos+(agey*0.26),agex*0.33,agey*0.45);    // side-skirtes of the ghost 
  
  fill(0);                               // fill the eye with black
  ellipse(xpos-(agex*0.20),ypos-(agey*0.13),agex*eyewidthl,agey*eyeheightl);
  ellipse(xpos+(agex*0.20),ypos-(agey*0.13),agex*eyewidthr,agey*eyeheightr);    // draw the eyes
}


  void hover_ghost()
  {
    if (xpos>width-agex/2-speedx) {      
        xpos=width-agex/2-speedx; 
        speedx=-speedx;                   
      }
    if (xpos<agex/2-speedx) { 
        speedx=-speedx;
      }
  
      xpos=xpos+speedx;                    // if it reaches the left or right side of the screen, it bounces back with the same speed
      
      
    if (ypos>height-agey/2-speedy) { 
        ypos=height-agey/2-speedy; 
        speedy=-speedy;
      }
    if (ypos<agey/2-speedy) {
        ypos=agey/2-speedy;  
        speedy=-speedy;
      }
      ypos=ypos+speedy;                     // if it reaches the top or bottom side of the screen, it bounces back with the same speed
  }

  void collide()
  {

    float distx, disty;
    float temp1x, temp1y, temp2x, temp2y, temp3x, temp3y, temp4x, temp4y;
    float distance, distance1, distance2, minDist;
    float axisx, axisy;
                                    
    for (int j = id+1; j < i; j++) {        // for each ghost only those with bigger index-number are checked
                                            // otherwise we get double checks of the same collission
      
      distx = spirit[j].xpos + 1.5*spirit[j].speedx - xpos-1.5*speedx;
      disty = spirit[j].ypos + 1.5*spirit[j].speedy - ypos-1.5*speedy;
      distance = sqrt(distx*distx + disty*disty);
      minDist = spirit[j].agex/2.5 + agey/2;    // check whether there is a collission

      if (distance < minDist) {              // if there is a collission


        axisx = spirit[j].xpos-xpos;
        axisy = spirit[j].ypos-ypos;          // this is the axis between the centers of the ghosts
        distance1 = (axisx*axisx+axisy*axisy);    // for normalisation we need the length of the vector axis 


        if (speedx*speedx+speedy*speedy==0) { 
           temp1x=0; temp1y=0; temp2x=0; temp2y=0;    // if the speed of the first ghost was zero, then the force vectors are all zero
        }
        else {  
          temp1x = axisx * ((axisx*speedx + axisy*speedy) / distance1);    // the projection of the (dx,dy) vector on the axis vector 
          temp1y = axisy * ((axisx*speedx + axisy*speedy) / distance1);    // this vector will go to th second ghost

          temp2x = speedx - temp1x;
          temp2y = speedy - temp1y;          // this will be the speed vector that the ghost keeps
        }
        
        // vectors for the second car

        axisx = -axisx;        // now for the other ghost, pretty symetrically
        axisy = -axisy;        // this is the axis between the centers of the confettis
        
       if ((spirit[j].speedx*spirit[j].speedx+spirit[j].speedy*spirit[j].speedy)==0) {
          temp3x=0; temp3y=0; temp4x=0; temp4y=0;        // if the speed of the second ghost was zero, then again both force vectors are zero
        }
        else {


          temp3x = axisx * ((axisx*spirit[j].speedx + axisy*spirit[j].speedy) / distance1);    // the projection of the (dx,dy) vector of the second ghost on the axis vector
          temp3y = axisy * ((axisx*spirit[j].speedx + axisy*spirit[j].speedy) / distance1);    // this force vector will go to the first ghost

          temp4x = spirit[j].speedx - temp3x;    // this must be the missing vector in the triangle
          temp4y = spirit[j].speedy - temp3y;    // this will be the speed vector that the confetti keeps
        }


                                                                     // the new speed vector gets a component from the first and from the second ghost
        speedx = temp2x + pow(spirit[j].agex/agex, 1.7) * temp3x;    // tried to bring that in the smaller ghost have less momentum,
        speedy = temp2y + pow(spirit[j].agey/agey, 1.7) * temp3y;    // but taking the "real" physical value looks weird


        spirit[j].speedx = pow(agex/spirit[j].agex, 1.7) * temp1x + temp4x;
        spirit[j].speedy = pow(agey/spirit[j].agey, 1.7) * temp1y + temp4y;    // the new speed vector gets a component from the first and from the second ghost
      }
    }
  }
}


