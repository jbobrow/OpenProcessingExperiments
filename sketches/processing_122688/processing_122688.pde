
/*********************************************************
*  Name: Lioyc Chiu                                       *
*  Course: ICS 3U 02  Pd. 5                              *
*  Assignment #2                                        *
*  Purpose: To become accustomed to using graphics
            and random co-ordinates by drawing a house,
            trees, etc* (also, try dragging the house)
*  Due Date: October 17, 2013                            *
*********************************************************/

 /*** Variable Dictionary ***************************
  backgroundc-
  Variable used to change the transparency of the sky to reveal 
  the night sky and stars.
  
  moonX,moonY Coordinates of the moon
  sunX,sunY coordinates of the sun
  mVel,sVel coordinates of the moon and sun, respectively
  dayTime = Boolean to say if it's night or day
  
  starX, starY- Arrays of floats to track star locations
  man- gif image of a man to upload into the render
  
  quake- The intensity of the ground shaking when the house lands from being thrown
  quakeCount- the number to track how many individual quakes there were up to the....
  quakeMax - the number of times/ duration of the quake
  shake - Boolean to determine if the ground is currently shaking or not
  hasShake - boolean to determine if it's hit the ground and shaken, so it doesn't shake endlessly
  
  houseX,houseY - coordinates of the house
  houseXvel,houseYvel Velocities of the house if it's in motion
  onGround- boolean to determine if the house is on the ground
      ***************************************************/
      
int backgroundc = 0; //Declares variables
float moonX=825, moonY=575;
float sunX=-60, sunY=575;
float mVel = 1;
float sVel = 1;
boolean dayTime = false;

float [] starX = new float [20];
float [] starY = new float [20];
//PImage man;
int quake = 5;
int quakeCount = 0;
final int quakeMax = 10;
boolean hasShake = true;
boolean shake = false;
float houseX =77;
float houseY =484;
float houseXvel=0;
float houseYvel=0;
boolean onGround = true;


void setup() {
//man = loadImage("");
  for (int i = 1; i < 20 ; i++) { //Assigns random values to the 20 stars
    starX [i] = random(1000); 
    starY [i] = random (500);
  }
  size (1000, 600, P2D); 
}

void draw () {
  background (#030F29); //Draws background

  fill (255, 255, 255);  //Sets colours of the stars
  stroke (255, 255, 255);
  for (int i = 1 ; i < 20 ; i++) {  //Increases x coordinate of each star and draws them
    starX[i] += 0.1;

    ellipse (starX[i], starY[i], 3, 3);
    if (starX[i] > 1000) {  //Sends stars back to the start before they go offscreen
      starX[i] = 0; 
      starY[i] = random(550); 
    }
  }

  fill (90, 193, 229, backgroundc); //Draws the daytime sky as a rectangle 
  stroke (90, 193, 229, backgroundc); //which has its transparency determined by the time
  rect (0, 0, 1000, 600);


  if (dayTime == false) { //If it's night time then
    if (backgroundc == 0) { 
      mVel = mVel + 0.01;  //Move the moon along a curved line
      moonX = moonX -mVel;
      moonY = moonY -1.75;
      fill (200); 
      stroke (200);
      ellipse (moonX, moonY, 150, 150); //Draw the moon
    }
    if (moonX < -100) { // If the moon goes offscreen, make the daytime sky fade in
      if (backgroundc < 255) {
        backgroundc = backgroundc + 1;
        sunX=1080-backgroundc; //Sun rise
        sunY=1021.25-backgroundc*1.75;
      }
      if (backgroundc == 255) { //If the daytime sky is opaque, make it daytime
        if (dayTime == false) {
          dayTime=true;
          sVel = 1; //resets sun velocity
        }
      }
    }
  } 

  else if (dayTime == true) { //Repetition of above, except for the sun
    if (backgroundc == 255) {
      sVel = sVel + 0.01;
      sunX = sunX -sVel;
      sunY = sunY - 1.75;
      fill (255);
      stroke (255);
      ellipse (sunX, sunY, 150, 150);
    } 
    if (sunX <-100) { //If the sun is offscreen, make the daytime sky fade out.
      if (backgroundc > 0) {
        backgroundc = backgroundc - 1;
        moonX=1080-(255-backgroundc);
        moonY=1021.25-((255-backgroundc)*1.75);
      }
      if (backgroundc == 0) { 
        if (dayTime == true) {
          dayTime=false;
          mVel = 1;
        }
      }
    }
  }

//DRAWING-DRAWING-DRAWING-DRAWING-DRAWING-DRAWING-DRAWING-DRAWING-DRAWING-DRAWING-DRAWING-
//With added coordinates to create a small shake

  //farground
  fill (50);
  stroke (50);
  beginShape();
  vertex (1010+quake, 600);  
  vertex (1010+quake, 490);   
  vertex (900+quake, 525);  
  vertex (800+quake, 535);  
  vertex (635+quake, 530);  
  vertex (485+quake, 525);  
  vertex (435+quake, 514);
  vertex (370+quake, 510);
  vertex (220+quake, 465);
  vertex (290+quake, 485);
  vertex (219+quake, 467);
  vertex (-10+quake, 446);
  vertex (-10+quake, 600);
  endShape();

  //Bushes
  fill (220);
  stroke (220);
  ellipse (965+quake, 510, 20, 20);
  ellipse (938+quake, 507, 40, 25);
  ellipse (920+quake, 521, 20, 20);
  
  ellipse (216+quake, 465, 30, 20);
  ellipse (189+quake, 455, 35, 25);
  ellipse (230+quake, 477, 25, 20);

  for (int i = 0 ; i < 2 ; i++) { //Draws two trees
    fill(200); //Tree leaves
    stroke (200);
    ellipse (932-(i*750)+quake, 438-(i*50), 20, 20);
    ellipse (904-(i*750)+quake, 432-(i*50), 20, 20);
    fill(220);
    stroke (220);
    ellipse (963-(i*750)+quake, 426-(i*50), 30, 30);
    ellipse (977-(i*750)+quake, 435-(i*50), 20, 20);
    ellipse (949-(i*750)+quake, 431-(i*50), 15, 15);
    ellipse (963-(i*750)+quake, 410-(i*50), 20, 20);
    fill(240);
    stroke (240);
    ellipse (922-(i*750)+quake, 420-(i*50), 30, 30);
    ellipse (943-(i*750)+quake, 410-(i*50), 40, 40);

    fill (20); //Tree trunk
    stroke (20);
    beginShape ();
    vertex (935-(i*750)+quake, 522-(i*50));
    vertex (938-(i*750)+quake, 485-(i*50));
    vertex (937-(i*750)+quake, 440-(i*50));
    vertex (917-(i*750)+quake, 430-(i*50));
    vertex (902-(i*750)+quake, 431-(i*50));
    vertex (938-(i*750)+quake, 431-(i*50));
    vertex (926-(i*750)+quake, 419-(i*50));
    vertex (941-(i*750)+quake, 428-(i*50));
    vertex (949-(i*750)+quake, 431-(i*50));
    vertex (964-(i*750)+quake, 429-(i*50));
    vertex (977-(i*750)+quake, 433-(i*50));
    vertex (957-(i*750)+quake, 434-(i*50));
    
    vertex (950-(i*750)+quake, 440-(i*50));
    vertex (948-(i*750)+quake, 485-(i*50)); 
    vertex (948-(i*750)+quake, 520-(i*50));
    vertex (955-(i*750)+quake, 530-(i*50));
    vertex (945-(i*750)+quake, 528-(i*50));
    vertex (937-(i*750)+quake, 535-(i*50));
    vertex (939-(i*750)+quake, 528-(i*50));
    vertex (926-(i*750)+quake, 529-(i*50));
    endShape (CLOSE);
  }

  fill (240); // Bushes infront of trees
  stroke (240);
  ellipse (962+quake, 530, 30, 20);
  ellipse (975+quake, 517, 20, 20);


  fill(30);
   stroke (30);
  beginShape (); //Where the house used to be
  vertex (77+quake, 485); 
  vertex (26+quake, 468); 
  vertex (99+quake, 463); 
  vertex (178+quake, 472);  
  endShape();


  beginShape (); // path
  vertex (131+quake, 478); 
  vertex (156+quake, 476);  
  vertex (264+quake, 518);
  vertex (238+quake, 536); 
  endShape (CLOSE);
  
  //image(man, 77+quake, 415);


  fill (220); //House 
  noStroke();
  beginShape ();
  vertex (houseX+quake, houseY); 
  vertex(houseX+100+quake, houseY-10); 
  vertex (houseX+100+quake, houseY-70); 
  vertex (houseX+50+quake, houseY-120); 
  vertex (houseX+quake, houseY-70); 
  endShape(CLOSE);  

  fill(190);
  beginShape ();
  vertex (houseX+quake, houseY); 
  vertex (houseX-50+quake, houseY-15); 
  vertex (houseX-50+quake, houseY-70-15); 
  vertex (houseX+quake, houseY-70); 
  endShape(CLOSE);

  fill (160);
  beginShape ();
  vertex (houseX+50-50+quake, houseY-120-15); 
  vertex (houseX+50+quake, houseY-120);
  vertex (houseX+quake, houseY-70); 
  vertex (houseX-50+quake, houseY-70-15); 
  endShape (CLOSE);

  fill (50);
  beginShape();
  vertex (houseX+80+quake, houseY-8); 
  vertex (houseX+80+quake, houseY-48);
  vertex (houseX+55+quake, houseY-44);
  vertex (houseX+55+quake, houseY-4); 
  endShape (CLOSE);

  fill (60);
  beginShape ();
  vertex (houseX-42+quake, houseY-60);
  vertex (houseX-42+quake, houseY-35);
  vertex (houseX-18+quake, houseY-35+8);
  vertex (houseX-18+quake, houseY-60+8);
  endShape (CLOSE);


  houseX =houseX+ houseXvel; //Adds the velocity to the house coordinates
  houseY =houseY+ houseYvel;


  if (((houseY > 555) ||  (houseY < 454))) { //Checks if the house is on the ground
    onGround = false;
  }
  if (((houseY > 555) ||  (houseY < 545)) &&( houseYvel < 9) && onGround== false) { //If the house is off the ground
    houseYvel = houseYvel + 0.5; // invrease Y velocity, simulating gravity
  }
  if ((houseY < 555) && (houseY > 545)) {
    houseYvel = 0;  //If the hosue is on the ground, stop the Y velocity from making it move any lower
    onGround = true;
  }


  if ((onGround == true) && (shake == false) && (hasShake == false)) {  //Checks if the house is on the ground,
 // it's not shaking, and if it has already shaken
    quakeCount=0;
    quake = 5;
    shake = true; //If it passes, it causes a brief quake
    hasShake = true;
  }
  if ((onGround == false) && (shake == false) && (hasShake == true)) {   
    hasShake = false; //Unable to cause any quakes until it moves off the ground again
  }

  if (houseXvel > 0) {  //Simulates loss of horizontal velocity over time
    if (0+houseXvel < 0.25) { //Checks what direction the house is moving and which way to add friction/resistance.
      houseXvel = 0; //If the velocity is small enough, set velocity to 0 to prevent problems
    }
    else { 
      houseXvel = houseXvel - 0.25; 
    }
  } 
  else if (houseXvel < 0)    
    if (0-houseXvel < 0.25) { 
      houseXvel = 0;
    }
    else { 
      houseXvel = houseXvel + 0.25;
    }

  if ((houseX > 1005) || (houseX < -5) || (houseY > 650)|| (houseY < -110)) {  
    // If the house goes offscreen, move back on screen
    houseX =77; 
    houseY = -100; 
    houseXvel = 0;
    houseYvel = 0;
    onGround=false;
  }



  if (shake == true) { //If the ground is currently shaking, shake.
    if (quakeCount < quakeMax) { //If the quake duration hasn't gotten to the max, quake another time
      quakeCount++;  

      if ((quakeCount / 2.0)- (quakeCount/2) == 0 ) { //Every even number of quakeCount, quake once.
        quake = quake * -1; //Shifts the quake
      }
    } 

    else if (quakeCount == quakeMax) {
      shake= false; //After the quakeCount has reached its max, stop the quake, reset the variables
      quakeCount=0;
      quake = 0;
    }
  }
}

void mousePressed () {  //Records mouse coordinates
  println(mouseX+" "+mouseY);
}

void mouseDragged () { 
  if ((mouseX < houseX+100) && (mouseX > houseX-50) &&(mouseY < houseY) && (mouseY > houseY -150)  ) {
    houseX=mouseX; //If you're dragging the mouse within the house's hitbox, follow the mouse
    houseY=mouseY+50;
    houseXvel = 0; //Remove the velocity so it doesn't fly away when you have a hold of it
    houseYvel = 0;
  }
}

void mouseReleased () {  
  if ((mouseX < houseX+100) && (mouseX > houseX-50) &&(mouseY < houseY) && (mouseY > houseY -150)  ) {

    houseXvel =mouseX- pmouseX; //When the mouse is released, the difference between current mouse coords 
    houseYvel = mouseY-pmouseY; //and previous mouse coords becomes the velocity of the house.
  }
}

