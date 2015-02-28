
//This version has some attempts at alpha,not really working
//because i can't figure out how to get a different alpha for each one
//
//okay I solved that by passing in different sorts of alphas. What I have to do tomorrow,
//among other things, is figure out how to pass in controls so that I can have clear parameters
//for the limits of how saturated or unsaturated things can become. I think actually I can get rid
//of alpha 1 and 2, it can become a lot more elegent if it just sets a target and increase or decrease
//gradually towards that target... yes that's what it should do. That makes a lot of sense! So for update
//I'll just pass in a target and it can either increase or decrease towards that target... Yes local alphas
//controlled within each object.

int time;
int timeDifference;
int level;
float alphaDelta1;
Hormone serotonin;
Hormone melatonin;
Hormone dopamine;
Hormone cortisol;
Hormone leptin;
Hormone endorphin;


PFont helvetica;

final static int START_ALPHA = 60;

void setup() {
  //time controls
  time = 0;
  level = 0;
  alphaDelta1 = .75;

  //display controls
  background (255);
  size(displayWidth, displayHeight);
  noStroke();
  smooth();
  helvetica = loadFont("HelveticaNeue-48.vlw");
  colorMode(RGB, 255, 255, 255, 100);





  serotonin = new Hormone(0, 255, 255, START_ALPHA, 0.0, 0.0, "Serotonin");
  leptin= new Hormone(19, 232, 113, START_ALPHA, width/3, 0.0, "Leptin" );
  melatonin= new Hormone(161, 5, 250, START_ALPHA, (width/3) *2, 0.0, "Melatonin");
  cortisol = new Hormone (240, 10, 10, START_ALPHA, 0.0, height/2, "Cortisol");
  dopamine = new Hormone (240, 240, 10, START_ALPHA, width/3, height/2, "Dopamine");
  endorphin = new Hormone (255, 0, 215, START_ALPHA, (width/3)*2, height/2, "Endorphin");
}

void draw() {
  background(255);

  serotonin.display();
  melatonin.display();
  dopamine.display();
  cortisol.display();
  leptin.display();
  endorphin.display();

  if (level == 0) {
    serotonin.startMessage("Press and hold the sensor to calibrate your academic schedule for hormonal balance");
  }

  if (level ==1) {
    serotonin.updateAlpha(10);
    melatonin.updateAlpha(20);
    dopamine.updateAlpha(30);
    cortisol.updateAlpha(100);
    leptin.updateAlpha(20);
    endorphin.updateAlpha(20);
    serotonin.updateMessage("Your cortisol (stress) index is two standard deviations above the mean. Maybe think about dropping one of those CS classes. You’ve got plenty of time. You don’t have to do it all at once.");
  }

  if (level ==2) {
    serotonin.updateAlpha(100);
    melatonin.updateAlpha(10);
    dopamine.updateAlpha(10);
    cortisol.updateAlpha(10);
    leptin.updateAlpha(10);
    endorphin.updateAlpha(20);
    serotonin.updateMessage("Your serotonin (happiness) has been on a steady decline all year. Perhaps you might want to consider a semester abroad. The Barcelona program has the highest serotonin rating of any current course offerings.");
  }

  if (level == 3) {
    serotonin.updateAlpha(20);
    melatonin.updateAlpha(20);
    dopamine.updateAlpha(100);
    cortisol.updateAlpha(40);
    leptin.updateAlpha(20);
    endorphin.updateAlpha(20);
    serotonin.updateMessage("Your dopamine (reward) levels are very high with your current schedule. You must be learning a lot! Your cortisol (stress) is a little high, but keep going to tai chi and you should be OK.");
  }

  if (level == 9) {
    serotonin.updateAlpha(20);
    melatonin.updateAlpha(20);
    dopamine.updateAlpha(10);
    cortisol.updateAlpha(10);
    leptin.updateAlpha(100);
    endorphin.updateAlpha(20);
    serotonin.updateMessage("Your leptin (metabolism) has been pretty erratic lately. When’s the last time you ate something that wasn’t made out of sugar?");
  }

  if (level == 5) {
    serotonin.updateAlpha(15);
    melatonin.updateAlpha(10);
    dopamine.updateAlpha(100);
    cortisol.updateAlpha(10);
    leptin.updateAlpha(20);
    endorphin.updateAlpha(100);
    serotonin.updateMessage("Your endorphin (pleasure) levels are high, probably because of the Improvisation class, but your dopamine (reward) levels are pretty low. Maybe you should think about taking some more challenging classes.");
  }

  if (level == 6) {
    serotonin.updateAlpha(20);
    melatonin.updateAlpha(100);
    dopamine.updateAlpha(20);
    cortisol.updateAlpha(20);
    leptin.updateAlpha(30);
    endorphin.updateAlpha(10);
    serotonin.updateMessage("Your melatonin (rest) is dangerously low. Lack of sleep is making it impossible for your hippocampus to process and store new memories. If you don’t get a few more hours of sleep a night you’re not going to remember college.");
  }

  if (level == 8) {
    serotonin.updateAlpha(100);
    melatonin.updateAlpha(100);
    dopamine.updateAlpha(100);
    cortisol.updateAlpha(20);
    leptin.updateAlpha(20);
    endorphin.updateAlpha(20);
    serotonin.updateMessage("Your melatonin (rest) has stabilized since you dropped ECON 206B. This is a much healthier schedule. Look how much better your dopamine (reward) and serotonin (happiness) levels are now.");
  }

  if (level == 7) {
    serotonin.updateAlpha(100);
    melatonin.updateAlpha(15);
    dopamine.updateAlpha(20);
    cortisol.updateAlpha(20);
    leptin.updateAlpha(20);
    endorphin.updateAlpha(100);
    serotonin.updateMessage("Your endorphin (pleasure) index was much higher last quarter than this quarter and it seems to be inhibiting your release of serotonin (happiness). Consider adding an Athletics class to your schedule. You’ll be a lot happier.");
  }

  if (level == 4) {
    serotonin.updateAlpha(100);
    melatonin.updateAlpha(40);
    dopamine.updateAlpha(40);
    cortisol.updateAlpha(100);
    leptin.updateAlpha(40);
    endorphin.updateAlpha(40);
    serotonin.updateMessage("Your serotonin (happiness) levels are extremely high for a grad-student. This is great for your health but your very low cortisol (stress) levels indicate that you are not really applying yourself. Statistics 397X might be just the thing.");
  }


  /*time functions*/

  //  timeDifference deterines how long until the system resets.
  //  the number of millis indicates how long it will take
  timeDifference= millis()-time;
  if (timeDifference > 80000) {
    level = 0;
    timeDifference = 0;
  }
  println(time);
  println(level);
  //  println(alpha);

  /* construct rectangles*/
}

void mousePressed() {
  time = millis();
  level +=1;
//  level = int(random(1,9));

  /*starts over at zero*/
  if (level == 10) level = 0;

  /*this is for random returns*/
  //level = int(random(1,10));
}


class Hormone {

  color c;
  float red;
  float green;
  float blue;
  float alpha;
  float xPos;
  float yPos;
  String label;


  //constructor
  Hormone (float redT, float greenT, float blueT, float alphaT, float xPosT, float yPosT, String labelT) {
    red = redT;
    green =greenT;
    blue = blueT;
    alpha = alphaT;
    xPos= xPosT;
    yPos = yPosT;
    label = labelT;
  }

  void display() {
    //rectangle

    noStroke();
    fill(red, green, blue, alpha);
    rect(xPos, yPos, width/3, height/2);

    //label
    fill(255);
    textFont(helvetica);
    text(label, xPos + width/6 - textWidth(label)/2, yPos + (height/10)*4);
  }

  //update the opacity
  void updateAlpha(float target) {
    if (timeDifference>2300) {
      if (alpha<target)
        alpha += alphaDelta1;

      if (alpha >target)
        alpha -= alphaDelta1;
    }
  }


  void startMessage(String start) {
    //  String startMessage = "start";
    //      fill(10);
    //      textFont(helvetica);
    //      textSize(30);
    //      text(start, width/2 - textWidth(start)/2, height/10);

    fill(77, 75, 75, 40);
    rect(width/6, height/10, (width/3)*2, height/8, 7);

    String currentMessage = start;
    fill(255);
    textFont(helvetica);
    textSize(38);
    text(currentMessage, width/6+50, height/10+15, (width/3)*2, height/2);
  }

  void updateMessage(String message) {
    
    //this is an attempt to make it able to keep track of time without having to be random
//    if(timeDifference== 0 || timeDifference>20000){
//    fill(77, 75, 75, 40);
//    rect(width/6, height/10, (width/3)*2, height/8, 7);
//
//    String currentMessage = "Press and hold the sensor to calibrate your academic schedule for hormonal balance";
//    fill(255);
//    textFont(helvetica);
//    textSize(38);
//    text(currentMessage, width/6+50, height/10+15, (width/3)*2, height/2);
//    }

    if (timeDifference<2200) {

      fill(77, 75, 75, 40);
      rect(width/3-width/20+20, height/10, width/3+width/10-40, height/10, 7);

      String calibrating = "Accessing your schedule";
      fill(255);
      textFont(helvetica);
      textSize(40);
      text(calibrating, width/2 - textWidth(calibrating)/2, (height/10)*1.6);
    }


    //measuring hormone message
    if (timeDifference>2300 && timeDifference<5300) {

      fill(77, 75, 75, 40);
      rect(width/3-width/20+20, height/10, width/3+width/10-40, height/10, 7);

      String calibrating = "Measuring hormonal activity";
      fill(255);
      textFont(helvetica);
      textSize(40);
      text(calibrating, width/2 - textWidth(calibrating)/2, (height/10)*1.6);
    }
    
    if (timeDifference>5400 && timeDifference<7400) {

      fill(77, 75, 75, 40);
      rect(width/3-width/20+20, height/10, width/3+width/10-40, height/10, 7);

      String calibrating = "Please release the sensor";
      fill(255, 255, 70, 100);
      textFont(helvetica);
      textSize(40);
      text(calibrating, width/2 - textWidth(calibrating)/2, (height/10)*1.6);
    }

    //suggestion message
    if (timeDifference> 7500 && timeDifference<60000) {

      fill(77, 75, 75, 40);
      rect(width/8, height/10, (width/4)*3, height/6, 7);

      String currentMessage = message;
      fill(255);
      textFont(helvetica);
      textSize(30);
      text(currentMessage, width/8+30, height/10+30, (width/4)*3-30, height/2);
      //      text(currentMessage, width/2 - textWidth(currentMessage)/2, height/10);
    }
    
    //message that comes at the end sort of like a return to start screen
    if( timeDifference>60000 && timeDifference < 80000){
    fill(77, 75, 75, 40);
    rect(width/6, height/10, (width/3)*2, height/8, 7);

    String waitingMessage = "Press and hold the sensor to calibrate your academic schedule for hormonal balance";
    fill(255);
    textFont(helvetica);
    textSize(38);
    text(waitingMessage, width/6+50, height/10+15, (width/3)*2, height/2);
    }
    
  }
}

boolean sketchFullScreen() {
  return true;
}

