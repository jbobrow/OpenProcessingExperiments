
int ballsize = 20;       // Balldurchmesser
float xpos, ypos;    // Position des Balles
float xspeed = random(5, 6);  // Geschw. des Balls in x-Richtung
float yspeed = random(0, 4);  // Geschw. des Balls in y-Richtung
int fehler=0;
int fehlerr = 0;
float playerpos;
float player2pos;
PFont pixel;
float wip;
int timer;
int time;
int starttime;

//-------------------------------------------------------------------------------------------------------------------------
import com.leapmotion.leap.CircleGesture;
import com.leapmotion.leap.Gesture.State;
import com.leapmotion.leap.Gesture.Type;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.KeyTapGesture;
import com.leapmotion.leap.ScreenTapGesture;
import com.leapmotion.leap.SwipeGesture;
import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;
LeapMotionP5 leap;
String lastGesture =
"enabling gestures: \n'c' for CircleGesture\n's' for SwipeGesture\n'k' for KeyTapGesture\n't' for ScreenTapGesture";

//-------------------------------------------------------------------------------------------------------------------------


public void setup()
{
  size(1024 , 768);
  noStroke();
  playerpos =height/2;
  player2pos= height/2;
  xpos = 45;
  ypos = playerpos;
  pixel = loadFont("pixel.vlw");

  //-------------------------------------------------------------------------------------------------------------------------

  leap = new LeapMotionP5(this);

  //-------------------------------------------------------------------------------------------------------------------------
}

public void draw()
{
  background(0);
  timer = millis();

  if (fehler <= 0 || fehlerr <=0)
  {



    //Setup
    noFill();
  stroke(255);
  strokeWeight(15);


    for (int i = 0; i<35; i++)
  {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(width/2, 22*i, 15, 15);
  }
  
    //Bar left
    
     fill(255);

    rect (10, playerpos-50, 20, 100);
  
    
    //Bar right
    
      rect (width-30, player2pos-50, 20, 100);

    //Ball
    rect(xpos, ypos, ballsize, ballsize);

    
    // Bewegung des Balles
    xspeed *= 1.001;
    xpos += xspeed;
    ypos += yspeed;
    
    
    //Score
    textFont(pixel);
    textSize(48);
    fill(255, 255, 166);
    textAlign(CENTER);
    //Score left
    text(fehler, width/2+50, 50);
    //Score right
    text(fehlerr,width/2-50,50);
    textSize(15);
    textAlign(CENTER);
    text((timer-starttime)/1000, width/2, 70);
    time=(timer-starttime)/1000;
    
    
    
    
    
    

    //LEAP
    for (Hand hand : leap.getHandList()) {

      PVector handPos = leap.getPosition(hand);
      playerpos = handPos.y;
      player2pos = handPos.y;
    }


   


    //damit der Ball zurückprallt ( oben, unten)

    if (ypos > height-ballsize/2 || ypos < 0+ballsize/2) {
      yspeed *= -1;
    }

    // Begrenzung links und Fehler
    if ( xpos <= 30+ballsize/2) {
      if (ypos > playerpos-50 && ypos < playerpos+50) {
        xspeed *= -1;
        yspeed += (ypos-playerpos)/5;
      }
    }
    //Fehler
    if (xpos <= 0) {
      fehler=fehler+1;
      if (fehler <= 5) {
        xpos = 50;
        ypos = playerpos;
        xspeed *= -1;
        yspeed = 0;
      }
    }



    // Begrenzung rechts und Fehler
    if ( xpos >= width-30-ballsize/2) {
      if (ypos > player2pos-50 && ypos < player2pos+50) {
        xspeed *= -1;
        yspeed += (ypos-player2pos)/5;
      }
    }
    //Fehler
    if (xpos >= width) {
      fehlerr=fehlerr+1;
      if (fehlerr <= 5) {
        xpos = 50;
        ypos = player2pos;
        //xspeed *= -1;
        yspeed = 0;
      }
    }








    //Ausgabe Fehlerzahl
    println("fehler: "+ fehler );

    // Bewegung Rechteck
    if (keyPressed) {
      if (key == 'w') {
        playerpos = playerpos - 8;
      }
      if (key == 'y') {
        playerpos = playerpos + 8;
      }
    }




    //move_stop
    if (playerpos >= height-50) {
      playerpos = height-50;
    }

    if (playerpos <= 50) {
      playerpos = 50;
    }



  
  
  }








  else {

    for (Hand hand : leap.getHandList()) {

      PVector handPos = leap.getPosition(hand);
      // ellipse(handPos.x, handPos.y, 20, 20);
      wip = handPos.x;




      if (wip< 170)
      {
        wip= 170;
      }
      if (wip >= 460)
      {
        fehler = 0;
        fehlerr = 0;
        timer = 0;
        starttime = millis();
      }
      println(wip);
      fill(255, 72, 0);
      textSize(48);
      textAlign(CENTER, CENTER);
      if (fehler <=5)
      {
        text("PLAYER 2 WINS", width/2, height*0.25);
      }
      else
      {
        text("PLAYER 1 WINS", width/2, height*0.25);
      }
      textSize(30);
      text("Time: " + time, width/2, height*0.4);
      textAlign(CENTER, CORNER);
      textSize(20);
      text("slide to retry >", wip, height-50);
      leap.enableGesture(Type.TYPE_SWIPE);
      lastGesture = "Swipe Gesture enabled.";
    }
  }
}



public void swipeGestureRecognized(SwipeGesture gesture) {
  if (gesture.state() == State.STATE_STOP) {
    System.out.println("//////////////////////////////////////");
    System.out.println("Gesture type: " + gesture.type());
    System.out.println("ID: " + gesture.id());
    System.out.println("Position: " + leap.vectorToPVector(gesture.position()));
    System.out.println("Direction: " + gesture.direction());
    System.out.println("Duration: " + gesture.durationSeconds() + "s");
    System.out.println("Speed: " + gesture.speed());
    System.out.println("//////////////////////////////////////");
    lastGesture = "Gesture type: " + gesture.type().toString() + "\n";
    lastGesture += "ID: " + gesture.id() + "\n";
    lastGesture += "Position: " + leap.vectorToPVector(gesture.position()) + "\n";
    lastGesture += "Direction: " + gesture.direction() + "\n";
    lastGesture += "Speed: " + gesture.speed() + "\n";
    lastGesture += "Duration: " + gesture.durationSeconds() + "s" + "\n";
    wip = gesture.duration();
    println(wip);
  } 
  else if (gesture.state() == State.STATE_START) {
  } 
  else if (gesture.state() == State.STATE_UPDATE) {
  }
}




public void stop() {
  leap.stop();
}



