
Person [] p= new Person [1200];

Virus v1;// virus


void setup() { // starting parameters for sketch
  size(800, 800);// canvas
  background(#09080E);// background 
  // frameRate(20);
  for (int i=0; i<p.length; i++) { // initialize objects
    p[i] = new Person(random(20)); 
    v1 = new Virus(2);
  }
}

void draw() { // cycling through animation
  frameRate(8);
  fill(#09080E, 100);
  rect(0, 0, width, height); // fade background
  for (int i=0; i< p.length; i++) { // construct objects
    p[i].display();
    p[i].move();


    v1.display();
    v1.move();

    if ( v1.infect (p[i]) ) { //virus infects objects by proximity to x locations
      p[i].inter();
    } 
    else {
      p[i].safe();
    }
  }
   
   
   if (keyPressed)         
   if (key == 'r' || key == 'R') { //resets sketch
   setup();
   } 
   }



class Person {

  float x, y, m;
  float randomInfect; 
  float s, r, r2;
  int probInfect;// not using right now (probVirusMove, random;)
  color cv, cv1, cv2, cp, cp1, cp2;
  float noiseScale;

  Person (float _s) {

/* steps for noise generation (values between .005-.03 work best-> openprocessing reference). Using to create a faint amount of vibration to make the ellipses look like they are in a 3d field*/
    noiseScale=0.02; 
    
    
    /*try to generate random spacing around the center of the canvas. If I just use random (100,500)
    the circles end up forming a square. I wanted the circles to like they were radiating out from 
    a central location. I varied the amount of randomization by forcing positive and negative values that 
    were still generated randomly*/
    
    r=random (100); 
    r2=random (200);
    x = random(100, 500)+ r - random(r2); // attempting 
    y = random(100, 500) +r + r2/2;
    
    m = .1; // 
    s= _s;
    // not using right now probVirusMove=random(3);
    
    probInfect=94;// using value to vary the percentage of infection rate 
    cp1=color (#EEAA3A, 5 );
    cp2=color (#DD8932, 200);
    cv1= color(#506477, 1);
    cv2= color(#576691, 10);
    
    /*set the fill to a variable so that in can be modified when the shape is passed through the function infect*/
    cp=cp1;
  }

  void display( ) {
  /* this for loop cycles through and creates a slight amount of noise in the x direction*/
    for (int x1=0; x1 < random(4); x1++) {
    float noiseVal = noise((mouseX+x)*noiseScale, mouseY*noiseScale);
    
    /*instead of creating 2 classes, I added a second set up ellipses at a slight distance away from the first by (50, 10)*/
      strokeWeight(.01);
      stroke(#EEAA3A, 10);
      fill(cp1);
      ellipse(x+x1, y, s, s);
      fill(cp2);
      ellipse(x+x1+50, y +10, s-2, s-2); 
    }
  }

  void move() {
  /* int (random) used to control/limit the values returned. Since the values are limited from 0-3, the values will happen very regularly, so actions can be assigned when one of the values occur.*/
    int option =  int(random (4)); 
    if (cp1==cv1 || cp1==cv2 || cp2 ==cv1 || cp2==cv2) { 

      if (option == 0) {      

        x = x + (m*100);
      } 
      else if (option == 1) {

        x = x - (m*100);
      } 
      else if (option == 2) {

        y = y + (m*100);
      } 
      else if (option==3) {

        y = y - (m*100);
      }
    }
    
    
    /*this isn't completely necessary. There was a move proability attached to this but I took it out 
    because it was limiting to the movement too heavily in one direction. The probability move was 
    float probability = probVirusMove/2, where prob= random (3)/5. Set so that if probability 
    was greater than occurance, the movement would be limited, and the orange circles would have a slightly
    higher chance of surviving longer. I took it out because I didn't have time to find a value that allowed 
    each option to have a random 50% chance of happening, but will come back to this at some point. For now,
     I left it in because it adds a tiny bit more vibration to the animation.*/
    if (cp1==cp1 || cp2==cp2) {      
      if (option == 0) {
        x = x + m;
      } 
      else if (option == 1) {
        x = x - m;
      } 
      else if (option == 2) {
        y = y + m;
      } 
      else {
        y = y - m;
      } 

      x = constrain(x, 0, width);// keeps x and y within the screen
      y = constrain(y, 0, height);
    }
  }

  void inter() { 

/*Void inter is the function that produces results from the boolean 'infect' listed below. Boolean fuctions need a true and false parameter > something to occur when the boolean is found to be true and when the boolean is found to be false. If the boolean (infect) returns true, the function inter is run. If the boolean (infect) is false, then second function (safe, shown below) will be run instead. 

 Set up so that the probbaility of infection reflects the percentage of men and women in the US. There are about 5% more women than men in the US. To mimick this, generate a random value between 1-100; if the value is greater than (94/2 || 47, then infect with color cv2. */

    randomInfect= int(random(100));
    float probability= probInfect/2; 
    if (randomInfect> probability) { 
      noStroke();
      cp1 = cv1;
      cp2=cv1;
      s=random (30); 
    } 
    else { 
      noStroke();
      cp1=cv2;
      cp2=cv2;
      s=random (.5); 
    }
  }

  void safe () {
    cp1=cp1;
    cp2=cp2;
  }


/*boolean is the function type (from processing), infect is the a variable name, (Person P0) assigns to what object/class the function should effect. The p0 is used as a space holder to represent any instance of p. There could be 1 or 100 instances of p, and the boolean will still check each one as if it is looking at Person p1, p2, p3 ... therefore, p0 represents and instance. */

/*foat d= is a distance equation from processing evaluating the x and y values from two separate locations and
determining the distance from the two. I can then add a conditional statement so that if the distance is less than a value, trigger a response, otherwise, no effect. */
  boolean infect (Person p0) {   
 
    float d = dist(x, y, p0.x, p0.y);  
    if (d < (10 + p0.s)) {         
      return true; // run void inter();
    } 
    else {
      return false; // run void safe();
    }
  }
}

class Virus {
  float x, y, m;
  float randomInfect;
  float s;
  int probVirusMove, probInfect, random;
  color cv, cv1, cv2, cp, cp1;

  Virus (float _s) {
    x = random(800);
    y = random(600);
    m=.1;
    s=_s;
    probInfect=94;
    cp1=color(#DD8830);
    cv1= color(#506477);
    cv2= color(#576691);//(#F0D53F);
    cv=color(#09080E);
  }

  void display( ) {
    noStroke();
    fill(cv, 10);
    ellipse(x, y, s, s);
  }

  void move() {
    int option =  int(random (4));

    if (option == 0) {      

      x = x + (m*(random(100)));
    } 
    else if (option == 1) {

      x = x - (m*(random(100)));
    } 
    else if (option == 2) {

      y = y + (m*(random(100)));
    } 
    else if (option==3) {

      y = y - (m*(random(100)));
    }    


    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  } 



  boolean infect (Person p0) {   

    float dV = dist(v1.x, v1.y, p0.x, p0.y);  


    if (dV < 10 + p0.s*3) {        
      return true;
    } 
    else {
      return false;
    }
  }
}
