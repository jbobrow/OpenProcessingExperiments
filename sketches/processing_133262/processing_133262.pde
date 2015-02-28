
// Written by Ruben Aguirre 81252309
// HW#3
Arrow a;
Ashe ashe;               //INITIALIZING
MinionsArrow purp;
PImage img;    
ArrayList arrows;
int mnum = 3;// number of minions
Minion [] minionsb = new Minion[mnum]; // makes an array  of blue minions.
Minion [] minionsp = new Minion[mnum]; // makes an array of purple minions.
float arrowx= 550;   // starting x position of the arrow object
float arrowy= 650; // starting y position of the arrow object

void setup() {
  size(1000, 700);
  img = loadImage("ashe2.jpg"); // custom image
  arrows = new ArrayList(); // initializing the arrow ArrayList.
  ashe = new Ashe(width/2, height-100, 62); // creating the 'ashe' object
  purp = new MinionsArrow(width-290, height/2+20); // a purple  arrow the minions shoot.
  arrows.add(new Arrow(arrowx, arrowy)); // adding the starting arrow that the 'ashe' character shoots
  for (int i=0; i<minionsp.length;i++) {  // The for loop that creates the blue and purple minions
    minionsb[i]= new Minion(100*i+50, height/2, 300);  // blue minions lined up starting at the left of the window
    minionsp[i]= new Minion(width-(100*i+90), height/2, 300); // purple minions lined up starting at the right of the window
  }
}
void mousePressed() {                       // arrow moves to where the mouse is clicked.
  arrows.add(new Arrow(arrowx, arrowy));
  pct = 0.0;
  beginX = x;                                    // Code(with slight modification) taken from the ''Moving on curves'' example from processsing.org website. Located in the play with examples location.
  beginY = y;                                        
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
  arrows.remove(0);
}
void keyPressed() {                        // increases the "ashe" character attack by 10
  if (keyCode == UP) {
    attackdmg+=10;
  }
  else if (keyCode == DOWN) {  // decreases the "ashe" character's attackby 10
    if (attackdmg<32){ // makes sure the attack never goes below 0
      }
    else{
      attackdmg-=10;
        }
      }
   else if (keyCode== LEFT){
     if(step==.05){
     }
     else{
           step-=.05;
     }
   }
    else if (keyCode== RIGHT){
     if(step==.25){
     }
     else{
           step+=.05;
     }
   }
}
void draw() {
  background(0);
  for (int i =0; i < arrows.size(); i++) { // drawing the arrow 'ashe' shooots.
    Arrow arrow = (Arrow) arrows.get(i);
    arrow.display();
  }
  ashe.run(); // drawing ashe
  purp.runMAp(); // drawing the arrow the purple minion shoots.
  for (int i=0; i<minionsp.length; i++) { // a giant loop that checks the interaction of the other objects with the minions
    minionsb[i].runb();

    minionsp[i].runp();
    if (x < minionsb[i].mx+50  && minionsb[i].mx <x && y<minionsb[i].my+50 && y>minionsb[i].my-10) { // checks if the arrow 'ashe' shoots goes through the minions or not. This case is the blue minions.
      if (arrows.size()== 0) { // does nothing if the arrayList is empty
      }
      else {                                        // makes it so if the arrow hits the minion, the minion is dealt the amount of attack damage 'ashe' has.
        minionsb[i].health-=attackdmg;
        arrows.remove(arrows.size()-1);            // removes the existing arrow
        arrows.add(new Arrow(arrowx, arrowy));         // adds the a new arrow back to the starting point
        if (minionsb[i].health<=0) {             // ashe is rewarded gold if she gets the 'last hit,' which will be explained in the read me file.
          Gold+=23;
          minionsb[i].health= 300;                  // a way of 'respawning' the minion.
        }
      }
    }
    if (x < minionsp[i].mx+50  && minionsp[i].mx <x && y<minionsp[i].my+50 && y>minionsp[i].my-10) { // same as above but with purple minions
      if (arrows.size()== 0) {
      }
      else {
        minionsp[i].health-=attackdmg;
        arrows.remove(arrows.size()-1);
        arrows.add(new Arrow(arrowx, arrowy));
        if (minionsp[i].health<=0) {
          Gold+=23;
          minionsp[i].health= 300;
        }
      }
    }
    if (minAX < minionsp[i].mx+50  && minionsp[i].mx <minAX && minAY<minionsp[i].my+50 && minAY>minionsp[i].my-10) { // checks to see if the minion's arrow hits any of the minions
       minionsp[i].health-=int(random(20,70)); // made it so the minions attack is random to make the game a bit more challenging.
      
        if (minionsp[i].health<=0) { // if the minions get 'the last hit; no gold is rewarded.
          minionsp[i].health= 300;
        }
      }
      if (minAX < minionsb[i].mx+50  && minionsb[i].mx <minAX && minAY<minionsb[i].my+50 && minAY>minionsb[i].my-10) { // same as above but with blue minions.
       minionsb[i].health-=int(random(20,70));
      
        if (minionsb[i].health<=0) {
          minionsb[i].health= 300;
        }
      }
    }
  }



