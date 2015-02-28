
int maxpiggies = 50;
//a declaration of an array of pigs
Pig[] piggies = new Pig[50];
PImage img;
int i=0; // number of pigs that is created already
int windowradius=800;
void setup() {
  size(windowradius, windowradius);
  img = loadImage ("farm.jpg");
}

/////////

void draw() {
  background(0);
  image(img, 0, 0);
  // i contains the number of pigs created so far
  for (int k=0; k<i; k++) 
  { // add here the calls of the methods
    piggies[k].draw_pig();
    piggies[k].move_pig();
    piggies[k].collide();
  }
}
/////////

void mousePressed() { 
  if (i<maxpiggies)
  { // add here the creation of a new pig
    piggies[i] = new Pig(); 
    i++;
  };
}

/////////

class Pig {
  color c; // a pig has a colour
  float xpos; // a pig has an x-position
  float ypos; // a pig has an y-position
  float radius; // a pig has a radius;
  float dx; // the pig moves with some speed in x direction
  float dy; // the pig moves with some speed in y direction
  int id; // we need an id for each pig

  /////////
  //constructor: gives values to the variables
  Pig() { 
    c= color(int(random(180, 255)), int(random(0, 50)), int(random(100, 125))); //pinkish
    xpos=mouseX;
    ypos=mouseY;
    radius=45;
    dx=int(random(-3, 4)); // speed in x-direction
    while (dx==0) dx=int(random(-3, 4)); // dont want nonmoving pigs
    dy=int(random(-3, 4)); // speed in y-direction
    while (dy==0) dy=int(random(-3, 4)); // dont want nonmoving pigs
    id=i; // i is a global variable that counts how many pigs we already have created
  }

  /////////


  void draw_pig() {
    smooth();
    fill(c); //random pinkish color
    noStroke();
    triangle(xpos, ypos, xpos+radius/2, ypos, xpos+radius/2, ypos-radius/2); //right ear
    triangle(xpos, ypos, xpos-radius/2, ypos, xpos-radius/2, ypos-radius/2); //left ear
    ellipse(xpos, ypos, radius, radius); //head

    fill(237, 152, 186); //light pink
    ellipse(xpos+1, ypos+3, radius/3, radius/3); //nose

    fill(0); //black
    ellipse(xpos+4, ypos+3, radius/10, radius/10); //right nostril
    ellipse(xpos-2, ypos+3, radius/10, radius/10); //left nostril

    fill(255); //white
    ellipse(xpos-6, ypos-6, radius/5, radius/5); //left eye
    ellipse(xpos+7, ypos-6, radius/5, radius/5); //right eye

    fill(0); //black
    ellipse(xpos+7, ypos-5, radius/10, radius/10); //right pupil
    ellipse(xpos-6, ypos-5, radius/10, radius/10); //left pupil

    noFill();
    stroke(0); //black
    arc(xpos+1, ypos+5, radius/2, radius/2, QUARTER_PI/5, PI); //mouth
  }

  /////////  

  void move_pig() {
    //if the pig reaches the left wall or the right wall, it bounces
    // added the case that is is over the border: then it is just put at the border
    if (xpos>windowradius-radius/2-dx) { 
      xpos=windowradius-radius/2-dx; 
      dx=-dx;
    }
    if (xpos<radius/2-dx) { 
      xpos=radius/2-dx; 
      dx=-dx;
    }
    xpos=xpos+dx;
    //if the pig reaches the top wall or the bottom wall, it bounces
    // added the case that is is over the border: then it is just put at the border
    if (ypos>windowradius-radius/2-dy) { 
      ypos=windowradius-radius/2-dy; 
      dy=-dy;
    }
    if (ypos<radius/2-dy) {
      ypos=radius/2-dy; 
      dy=-dy;
    }
    ypos=ypos+dy;
  }

  /////////

  void collide() {
    float distx, disty;   // to calculate the distance between pig for collision detection
    float distance, distance1, minDist;  // different versions of pig distance
    float axisx, axisy;  // the vector between the pig centers
    // the new force vectors for the colliding balls:
    float temp1x, temp1y, temp2x, temp2y, temp3x, temp3y, temp4x, temp4y;

    // for each pig only those with greater index are checked
    // otherwise we get double checks of the same collision
    for (int j = id+1; j <i; j++) {
      // check here, whether there would be a collission in the next step
      distx = piggies[j].xpos + piggies[j].dx - xpos-dx;
      disty = piggies[j].ypos + piggies[j].dy - ypos-dy;
      distance = sqrt(distx*distx + disty*disty);
      minDist = piggies[j].radius/2 + radius/2;      // radius here is actually the diameter
      if (distance < minDist) {  // collision case
        //physics of collision
        //collision for the first pig
        // this is the axis between the centers of the pigs
        axisx = piggies[j].xpos-xpos;
        axisy = piggies[j].ypos-ypos;
        // for normalisation we need the length of the vector axis 
        distance1 = (axisx*axisx+axisy*axisy);
        // if the speed of the first pig was zero, then the force vectors are all zero
        if (dx*dx+dy*dy==0) { 
          temp1x=0; 
          temp1y=0; 
          temp2x=0; 
          temp2y=0;
        }
        else {  
          // the projection of the (dx,dy) speed vector on the axis vector 
          // this vector will go to the second pig
          temp1x = axisx * ((axisx*dx + axisy*dy) / distance1);
          temp1y = axisy * ((axisx*dx + axisy*dy) / distance1);
          // this must be the missing vector in the triangle
          // this will be the speed vector that the pig keeps
          temp2x = dx - temp1x;
          temp2y = dy - temp1y;
        }
        // now for the other pig, pretty symmetrically
        // this is the axis between the centers of the pigs
        axisx = -axisx;
        axisy = -axisy;

        // if the speed of the second pig was zero, then again both force vectors are zero
        if ((piggies[j].dx*piggies[j].dx+piggies[j].dy*piggies[j].dy)==0) {
          temp3x=0; 
          temp3y=0; 
          temp4x=0; 
          temp4y=0;
        }
        else {
          // the projection of the (dx,dy) vector of the second pig on the axis vector 
          // this force vector will go to the first pig
          temp3x = axisx * ((axisx*piggies[j].dx + axisy*piggies[j].dy) / distance1);
          temp3y = axisy * ((axisx*piggies[j].dx + axisy*piggies[j].dy) / distance1);
          // this must be the missing vector in the triangle
          // this will be the speed vector that the pig keeps
          temp4x = piggies[j].dx - temp3x;
          temp4y = piggies[j].dy - temp3y;
        }
        // the new speed vector gets a component from the first and from the second pig
        // tried to bring in that smaller pigs have less momentum,
        // but taking the "real" physical value looks weird
        dx = temp2x + pow(piggies[j].radius/radius, 1) * temp3x;
        dy = temp2y + pow(piggies[j].radius/radius, 1) * temp3y;
        // the new speed vector gets a component from the first and from the second pig
        piggies[j].dx = pow(radius/piggies[j].radius, 1) * temp1x + temp4x;
        piggies[j].dy = pow(radius/piggies[j].radius, 1) * temp1y + temp4y;
      }
    }
  }
}


