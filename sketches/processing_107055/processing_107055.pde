
int numberOfCreatures = 5;
Creature [] arrayOfCreatures = new Creature [numberOfCreatures];
int xwindowsize = 400;
int ywindowsize = 400;
int i;

void setup() {
  size(xwindowsize, ywindowsize);
  smooth(2);
  for (int j = 0; j<numberOfCreatures ;j++) {
    arrayOfCreatures [j] = new Creature ();
    i++;
  }
}


void draw() {
  background(255);
  for (int k = 0; k<numberOfCreatures; k++) {
    arrayOfCreatures[k].draw_creature();
    arrayOfCreatures[k].move_creature();
    arrayOfCreatures[k].collide_creature();
  }
}


class Creature { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float CreatureSize;
  float radius;
  int id;




  Creature() {
    xpos= random(100, 250);      
    ypos= random(100, 250);      

    CreatureSize=1;
    radius=60;

    xspeed = random (1, 5);
    yspeed = random (1, 5);

    id=i;
    c = color(random(0,255));
  }


  void draw_creature() {
    fill(255, 192, 203);
    stroke(255, 192, 203);
    ellipse(xpos*CreatureSize, ypos*CreatureSize, 100*CreatureSize, 82*CreatureSize);

    /*darkpink nose*/

    fill(219, 112, 147);
    stroke(238, 229, 222);
    ellipse(xpos*CreatureSize, (ypos+4)*CreatureSize, 30*CreatureSize, 25*CreatureSize);

    /*nose holes*/

    fill(0, 0, 0);
    stroke(0, 0, 0);
    ellipse((xpos-5)*CreatureSize, (ypos+4)*CreatureSize, 4*CreatureSize, 8*CreatureSize);
    ellipse((xpos+5)*CreatureSize, (ypos+4)*CreatureSize, 4*CreatureSize, 8*CreatureSize);

    /*white eyes*/

    fill(255);
    stroke(255, 255, 255);
    ellipse((xpos-20)*CreatureSize, (ypos-21)*CreatureSize, 15*CreatureSize, 18*CreatureSize);
    ellipse((xpos+20)*CreatureSize, (ypos-21)*CreatureSize, 15*CreatureSize, 18*CreatureSize);


    /*black eyes*/
    fill(0, 0, 0);
    stroke (0, 0, 0);
    if (keyPressed == true ) { 
      fill(255, 0, 0);
    }
    if (keyPressed == true ) {
      stroke(255, 0, 0);
    }
    ellipse((xpos-20)*CreatureSize, (ypos-16)*CreatureSize, 5*CreatureSize, 4*CreatureSize);
    ellipse((xpos+20)*CreatureSize, (ypos-16)*CreatureSize, 5*CreatureSize, 4*CreatureSize);


    /*ears*/

    fill(255, 192, 203);
    stroke(255, 192, 203);
    quad((xpos+17)*CreatureSize, (ypos-43)*CreatureSize, (xpos+35)*CreatureSize, (ypos-63)*CreatureSize, (xpos+17)*CreatureSize, (ypos-90)*CreatureSize, xpos*CreatureSize, (ypos-65)*CreatureSize);
    quad((xpos-17)*CreatureSize, (ypos-43)*CreatureSize, (xpos-35)*CreatureSize, (ypos-63)*CreatureSize, (xpos-17)*CreatureSize, (ypos-90)*CreatureSize, xpos*CreatureSize, (ypos-65)*CreatureSize);


    /*ear holes*/

    fill(0, 0, 0);
    stroke(238, 232, 205);
    quad((xpos+17)*CreatureSize, (ypos-55)*CreatureSize, (xpos+10)*CreatureSize, (ypos-65)*CreatureSize, (xpos+17)*CreatureSize, (ypos-75)*CreatureSize, (xpos+24)*CreatureSize, (ypos-65)*CreatureSize);
    quad((xpos-17)*CreatureSize, (ypos-55)*CreatureSize, (xpos-10)*CreatureSize, (ypos-65)*CreatureSize, (xpos-17)*CreatureSize, (ypos-75)*CreatureSize, (xpos-24)*CreatureSize, (ypos-65)*CreatureSize);

    /*lines*/

    stroke(0, 0, 0);
    strokeWeight(2);
    line((xpos-25)*CreatureSize, (ypos-36)*CreatureSize, (xpos-15)*CreatureSize, (ypos-33)*CreatureSize);
    line((xpos+25)*CreatureSize, (ypos-36)*CreatureSize, (xpos+15)*CreatureSize, (ypos-33)*CreatureSize);
  }

  void move_creature() {  

    xpos = xpos+xspeed;
    if (xpos>=(width/CreatureSize)-50) xspeed = -xspeed;
    if (xpos<=50) xspeed = -xspeed;

    ypos = ypos+yspeed;
    if (ypos>=(height/CreatureSize)-30) yspeed=-yspeed;
    if (ypos<=80) yspeed=-yspeed;

    //if the confetti reaches the left wall or the right wall, it bounces
    // added the case that is is over the border: then i just put it at the border
    if (xpos>xwindowsize-radius/2-xspeed) { 
      xpos=xwindowsize-radius/2-xspeed; 
      xspeed=-xspeed;
    }
    if (xpos<radius/2-xspeed) { 
      xpos=radius/2-xspeed; 
      xspeed=-xspeed;
    }

    xpos=xpos+xspeed;
    //if the confetti reaches the top wall or the botton wall, it bounces
    // added the case that is is over the border: then i just put it at the border
    if (ypos>ywindowsize-radius/2-yspeed) { 
      ypos=ywindowsize-radius/2-yspeed; 
      yspeed=-yspeed;
    }
    if (ypos<radius/2-yspeed) {
      ypos=radius/2-yspeed;  
      yspeed=-yspeed;
    }
    ypos=ypos+yspeed;
  }

  void collide_creature() {

    float distx, disty;
    float temp1x, temp1y, temp2x, temp2y, temp3x, temp3y, temp4x, temp4y;
    float distance, distance1, distance2, minDist;
    float axisx, axisy;

    // for each confetti only those with greater index are checked
    // otherwise we get double checks of the same collission
    for (int j = id+1; j < i; j++) {


      // check here, whether there is a collission
      distx = arrayOfCreatures[j].xpos + 1.5*arrayOfCreatures[j].xspeed - xpos-1.5*xspeed;
      disty = arrayOfCreatures[j].ypos + 1.5*arrayOfCreatures[j].yspeed - ypos-1.5*yspeed;
      distance = sqrt(distx*distx + disty*disty);
      minDist = arrayOfCreatures[j].radius/2 + radius/2;

      if (distance < minDist) {  // collission case

        // simplified physics of collission
        //collission for the first confetti

        // this is the axis between the centers of the confettis
        axisx = arrayOfCreatures[j].xpos-xpos;
        axisy = arrayOfCreatures[j].ypos-ypos;
        // for normalisation we need the length of the vector axis 
        distance1 = (axisx*axisx+axisy*axisy);

        // if the speed of the first confetti was zero, then the force vectors are all zero
        if (xspeed*xspeed+yspeed*yspeed==0) { 
          temp1x=0; 
          temp1y=0; 
          temp2x=0; 
          temp2y=0;
        }
        else {  
          // the projection of the (xspeed,yspeed) vector on the axis vector 
          // this vector will go to th second confetti

          temp1x = axisx * ((axisx*xspeed + axisy*yspeed) / distance1);
          temp1y = axisy * ((axisx*xspeed + axisy*yspeed) / distance1);

          // this must be the missing vector in the triangle
          // this will be the speed vector that the confetti keeps
          temp2x = xspeed - temp1x;
          temp2y = yspeed - temp1y;
        }


        // now for the other confetti, pretty symetrically
        // this is the axis between the centers of the confettis
        axisx = -axisx;
        axisy = -axisy;

        // if the speed of the second confetti was zero, then again both force vectors are zero
        if ((arrayOfCreatures[j].xspeed*arrayOfCreatures[j].xspeed+arrayOfCreatures[j].yspeed*arrayOfCreatures[j].yspeed)==0) {
          temp3x=0; 
          temp3y=0; 
          temp4x=0; 
          temp4y=0;
        }
        else {
          // the projection of the (xspeed,yspeed) vector of the second confetti on the axis vector 
          // this force vector will go to the first confetti
          temp3x = axisx * ((axisx*arrayOfCreatures[j].xspeed + axisy*arrayOfCreatures[j].yspeed) / distance1);
          temp3y = axisy * ((axisx*arrayOfCreatures[j].xspeed + axisy*arrayOfCreatures[j].yspeed) / distance1);

          // this must be the missing vector in the triangle
          // this will be the speed vector that the confetti keeps
          temp4x = arrayOfCreatures[j].xspeed - temp3x;
          temp4y = arrayOfCreatures[j].yspeed - temp3y;
        }

        // the new speed vector gets a component from the first and from the second confetti
        // tried to bring in that tsmaller confettis have less momentum,
        // but taking the "real" physical value looks weird
        xspeed = temp2x + pow(arrayOfCreatures[j].radius/radius, 1.7) * temp3x;
        yspeed = temp2y + pow(arrayOfCreatures[j].radius/radius, 1.7) * temp3y;

        // the new speed vector gets a component from the first and from the second confetti
        arrayOfCreatures[j].xspeed = pow(radius/arrayOfCreatures[j].radius, 1.7) * temp1x + temp4x;
        arrayOfCreatures[j].yspeed = pow(radius/arrayOfCreatures[j].radius, 1.7) * temp1y + temp4y;
      }
    }
  }
}



