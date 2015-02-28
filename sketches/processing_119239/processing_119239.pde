
/*
 *
 * Project Name: Amoeba
 * Author: Bouke Regnerus
 * Author URI: http://create.regner.us
 * Description: Processing project created for the end assignment of the course Programming with Processing Create 2013.
 *
 * CollideObject function based on code from Keith Peters (the Processing in-app "BouncyBubbles" example).
 * Vector knowledge from the Processing Vector tutorial (http://processing.org/tutorials/pvector/).
 */

int nAlgae = 500; //Declare 500 Algae objects
ArrayList<Algae> algae; //Declare an ArrayList

int nAmoeba = 1; //Declare one Amoeba
ArrayList<Amoeba> amoeba; //Declare an ArrayList

/*Better random function that generates a random nummer between -i and i without returning 0*/
float nRandom(float i) {
  i = abs(i);
  float rand = random(-i, i);
  while (rand == 0) rand = random(-i,i);
  
  return rand;
}

void setup() {
  frameRate(30);
  size(1200, 620);
  smooth();
  background(227, 239, 242);
  
  amoeba = new ArrayList<Amoeba>();  //Create an empty ArrayList
  for (int i = 0; i < nAmoeba; i++) { //for-loop to create all Amoeba objects (currently one).
    PVector pos = new PVector(random(width),random(height)); //Random amoeba position.
    amoeba.add(new Amoeba(pos)); //Add a Amoeba to the ArrayList.
  }
  
  algae = new ArrayList<Algae>();  //Create an empty ArrayList
  for (int i = 0; i < nAlgae; i++) { //for-loop to create all Algae objects (currently 500).
    PVector pos = new PVector(random(width),random(height)); //Random amoeba position.
    algae.add(new Algae(pos)); //Add a Algae to the ArrayList.
  }
  
}

void draw() {
  
  /*Creating a rectangle the size of the screen instead of using background because fill works with alpha layers. */
  noStroke();
  fill(227, 239, 242, 60);
  rect(0,0,width,height);
  
  /*Loop to call all Algae functions*/
  for (int i = 0; i < algae.size(); i++) { //get the ArrayList size
    Algae objAlgae = algae.get(i); //get a copy of the current Algae from the ArrayList
    
    objAlgae.update();
    objAlgae.grow();
    objAlgae.collideEdges();
    objAlgae.collideObject();
    objAlgae.display(); 
  }
  
  /*Loop to call all Amoeba functions*/
  for(int i = 0; i < amoeba.size(); i++) { //get the ArrayList size
    Amoeba objAmoeba = amoeba.get(i); //get a copy of the current Amoeba from the ArrayList
    
    objAmoeba.update();
    objAmoeba.squiggle();
    objAmoeba.digest();
    objAmoeba.collideEdges();
    objAmoeba.collideObject();
    objAmoeba.collideAlgae();
    objAmoeba.display(); 
  }
  
  /*Spawn 30 more algae when mouse pressed on mouse position with a random variable*/
  if (mousePressed) {
    for(int i = 0; i < 30; i++) {
      int randMouseX = mouseX + int(random(-i, i)); 
      int randMouseY = mouseY + int(random(-i, i));
      PVector pos = new PVector(randMouseX,randMouseY); //mouse position with a small random
      algae.add(new Algae(pos)); //add Algae to the ArrayList.
    }
  }
}
/*
 *
 * Class Name: Algae_Class
 * Author: Bouke Regnerus
 *
 */

class Algae {
  /*Initialize all global variables*/
  PVector position, velocity;
  float r;
  int i = 0;
  
  int radius = int(random(1,4));
  float friction = -.9; //Friction on which the Algae will slowdown when he is over the treshold speed.
  float growSpeed = 0.1; //Speed on which the Algae will grow.

  /*Set variable values on object call*/
  Algae(PVector pos) {
    r = radius; //radius;
    position = pos;
    velocity = new PVector(nRandom(2), nRandom(2));
  }

  void update() {
    /*Slow down the Algae when the velocity is higher then 2*/
    if(velocity.x > 2 || velocity.x < -2) velocity.x *= abs(friction);
    else if(velocity.y > 2 || velocity.y < -2) velocity.y *= abs(friction);
    
    /*Change the position of the Algae by adding the velocity to its current position*/
    position.add(velocity);
  }

  void display() {
    noStroke();

    /*Algae body border*/    
    fill(color(62, 100, 28, 50));
    ellipse(position.x - 1, position.y - 1, (r*2.2), (r*2.2));
    ellipse(position.x - 1, position.y + 1, (r*2.2), (r*2.2));
    ellipse(position.x + 1, position.y + 1, (r*2.2), (r*2.2));
    ellipse(position.x + 1, position.y - 1, (r*2.2), (r*2.2));
    
    /*Algae body*/    
    fill(color(178, 206, 47));
    ellipse(position.x, position.y, (r*2), (r*2));
  }

  void grow() {
    if(algae.size() < 5000) r = r + growSpeed; //Limit the amount of Algae to prevent crashes.
    
    /*If the radius of the Algae is larger then 5, call function recreate()/*/
    if (r > 5) {
      this.recreate(); 
    }
  }

  void recreate() {
    PVector pos = new PVector(position.x, position.y + (r * 1.1)); //Position beneath the current Algae.
    algae.add(new Algae(pos)); //Add Algae to the ArrayList.
    r = radius; //Reset radius.
  }

  void die() {
    algae.remove(this); //Remove Algae from ArrayList.
    
    /*Hack to prevent complete Algae extinction, if all Algae died add one.*/
    /*(Unfortunately we don't have this function in nature.)*/
    if(algae.size() < 1) {
      PVector pos = new PVector(random(width),random(height));
      algae.add(new Algae(pos));
    }
  }

  void collideEdges() {
    /*On collison with edge, invert the velocity and set position inside the frame to prevent getting stuck in the border.*/
    if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -1;
    } 
    else if (position.x < r) {
      position.x = r;
      velocity.x *= -1;
    } 
    else if (position.y > height-r) {
      position.y = height-r;
      velocity.y *= -1;
    } 
    else if (position.y < r) {
      position.y = r;
      velocity.y *= -1;
    }
  }

  void collideObject() {
    for (int j = 0; j < algae.size(); j++) { //Loop trough all Algae.
      Algae objAlgae = algae.get(j); //get a copy of the current Algae from the ArrayList.
      
      /*Get distances between the Algae components.*/
      PVector bVect = PVector.sub(objAlgae.position, this.position);
      float bVectMag = bVect.mag(); //Calcuating the magnitude (or line distance) between the two vectors.

      float radii = this.r + objAlgae.r;

      /*Collision when the distance between the two vectors is smaller then the radii.*/
      if (bVectMag < radii) {
        float angle = bVect.heading(); //Get the angle from the vector.

        /*Converted the code from BounCyBubbles to vectors.*/
        PVector aVect = new PVector(position.x + cos(angle) * radii, position.y + sin(angle) * radii);
        aVect.sub(objAlgae.position);
        aVect.mult(0.05);
      
        this.velocity.sub(aVect);
        objAlgae.velocity.add(aVect);
      }
    }
  }
}
/*
 *
 * Class Name: Amoeba_Class
 * Author: Bouke Regnerus
 *
 */

class Amoeba {
  /*Initialize all global variables*/
  PVector position, velocity;
  float r;
  color c;
  int i = 0;
  
  int radius = 30;
  float friction = -.9; //Friction on which the Amoeba will slowdown when he is over the treshold speed.
  
  int k = 10; //Amount of spots on the Amoeba's body.
  float[] spotsX = new float[k];
  float[] spotsY = new float[k];
  float[] spotsR = new float[k];

  /*Set variable values on object call*/
  Amoeba(PVector pos) {
    r = radius;
    position = pos;
    
    /*Random speed between 3 and 6 and -3 and -6.*/
    velocity = new PVector(random(3,6) * nRandom(1), random(3,6) * nRandom(1));
    
    /*Random position and radius for the spots on the Amoeba's body.*/
    for (int i = 0; i < k; i++) spotsX[i] = random(.4,.5) * nRandom(1);
    for (int i = 0; i < k; i++) spotsY[i] = random(.4,.5) * nRandom(1);
    for (int i = 0; i < k; i++) spotsR[i] = random(.1,.3);
  }

  void update() {
    /*Slow down the Amoeba when the velocity is higher then 5*/
    if(velocity.x > 5 || velocity.x < -5) velocity.x *= abs(friction);
    else if(velocity.y > 3 || velocity.y < -3) velocity.y *= abs(friction);
    
    /*Change the position of the Amoeba by adding the velocity to its current position*/
    position.add(velocity);
  }

  void display() {
    noStroke();

    /*Amoeba body border*/     
    fill(color(230, 171, 22, 80));
    ellipse(position.x - 4, position.y - 4, (r*2.2), (r*2.2));
    ellipse(position.x - 4, position.y + 4, (r*2.2), (r*2.2));
    ellipse(position.x + 4, position.y + 4, (r*2.2), (r*2.2));
    ellipse(position.x + 4, position.y - 4, (r*2.2), (r*2.2));
   
    stroke(160, 57, 17, 60);
    strokeWeight(2);
    
    /*Amoeba body*/  
    fill(color(245, 96, 44));
    ellipse(position.x, position.y, (r*2), (r*2));
    
    /*Generate randomly generated spots on the Amoeba's body.*/
    noStroke();
    fill(color(230, 171, 22));
    for (int i = 0; i < k; i++) ellipse(position.x - r*spotsX[i], position.y - r*spotsY[i], (r*spotsR[i]), (r*spotsR[i]));
    
    /*Amoeba's Eye*/
    fill(color(0, 0, 0, 70));
    ellipse(position.x - 2, position.y - 2, (r*.5), (r*.5));
    ellipse(position.x - 2, position.y + 2, (r*.5), (r*.5));
    ellipse(position.x + 2, position.y + 2, (r*.5), (r*.5));
    ellipse(position.x + 2, position.y - 2, (r*.5), (r*.5));
    
    fill(color(255));
    ellipse(position.x, position.y, (r*.5), (r*.5));
    
    fill(color(0));
    ellipse(position.x, position.y, (r*.2), (r*.2));
    
    fill(color(255));
    ellipse(position.x - 1, position.y - 1, (r*.05), (r*.05));
  }

  void recreate() {
    PVector pos = new PVector(position.x, position.y + (r * 1.1)); //Position beneath the current Amoeba.
    amoeba.add(new Amoeba(pos)); //Add Amoeba to the ArrayList.
    this.r = radius; //Reset radius, make the current Amoeba the original size.
  }

  void squiggle() {
    /*Every third frame add a random to the current position to make the Amoeba squiggle/vibrate.*/
    if (i > 3) {
      position.x += int(nRandom(5));
      position.y += int(nRandom(5));
      i = 0;
    }
    else i ++;
  }

  void digest() {
    /*Hack to prevent complete Amoeba extinction, when only one Amoeba is left stop the digest process.*/
    if(amoeba.size() > 1) r -= .2;
    
    /*When the radius is over the recreate treshold, recreate.*/
    if (r > radius * 2.1) {
      this.recreate();
    }
    else if (r < 0) this.die(); //Remove Algae from ArrayList when the radius is smaller then 0.
  }

  void die() {
    amoeba.remove(this); //Remove Amoeba from ArrayList.
  }

  void collideEdges() {
    /*On collison with edge, invert the velocity and set position inside the frame to prevent getting stuck in the border.*/
    if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -1;
    } 
    else if (position.x < r) {
      position.x = r;
      velocity.x *= -1;
    } 
    else if (position.y > height-r) {
      position.y = height-r;
      velocity.y *= -1;
    } 
    else if (position.y < r) {
      position.y = r;
      velocity.y *= -1;
    }
  }


  void collideAlgae() {
    for (int j = 0; j < algae.size(); j++) { //Loop trough all Algae.
      Algae objAlgae = algae.get(j); //get a copy of the current Algae from the ArrayList.

      /*Get distances between the Algae and Amoeba*/
      PVector bVect = PVector.sub(objAlgae.position, this.position);
      float bVectMag = bVect.mag(); //Calcuating the magnitude (or line distance) between the two vectors.
      
      float radii = this.r + objAlgae.r;
      
      /*Collision when the distance between the two vectors is smaller then the radii.*/
      if (bVectMag < radii && this.r > objAlgae.r) {
        /*Formula to grow the Amoeba when eating an Algae, the Amoeba grows fast when he is small but much slower when he is larger.*/
        this.r = r + pow(r / (radius * 2.65), -1) - 1;
        objAlgae.die(); //Remove the Algae from the ArrayList.
      }
    }
  } 
  
  void collideObject() {
    for (int j = 0; j < amoeba.size(); j++) { //Loop trough all Amoeba.
      Amoeba objAmoeba = amoeba.get(j); //get a copy of the current Amoeba from the ArrayList
      
      /*Get distances between the Amoeba components.*/
      PVector bVect = PVector.sub(objAmoeba.position, this.position);
      float bVectMag = bVect.mag(); //Calcuating the magnitude (or line distance) between the two vectors.
      
      float radii = this.r + objAmoeba.r;

      /*Collision when the distance between the two vectors is smaller then the radii.*/
      if (bVectMag < radii) {
        float angle = bVect.heading(); //Get the angle from the vector.

        /*Converted the code from BounCyBubbles to vectors.*/
        PVector aVect = new PVector(position.x + cos(angle) * radii, position.y + sin(angle) * radii);
        aVect.sub(objAmoeba.position);
        aVect.mult(0.05);

        this.velocity.sub(aVect);
        objAmoeba.velocity.add(aVect);
      }
    }
  }
}


