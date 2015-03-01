
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/182493*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// Based on Daniel Shiffman's Example 5-6: Bouncing Ball Example 
// Devin Spear 2/16/2015

import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import processing.serial.*;
import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;
import cc.arduino.*;

Arduino arduino;
Twitter twitter;

int x = 0;
int speed = 1;

void setup() {
  println (Arduino.list());
  arduino = new Arduino (this, Arduino.list () [5], 57600);
  arduino.pinMode (9, Arduino.SERVO);
  arduino.pinMode (8, Arduino.SERVO);
  size(500,100);
  smooth();
  
  ConfigurationBuilder cb = new ConfigurationBuilder();
   cb.setOAuthConsumerKey("OtgxvVhfe7nm4qzRwNgqYoiSu");
   cb.setOAuthConsumerSecret("li4hK02rjzgm5FqO87GrK8MmNJPlDtqa19jAIiMMWf00CfUnIl");
   cb.setOAuthAccessToken("3041822085-JojTsMyltLNyBzUPEaiVApzbQ1QYcQFtTlZsPbI");
   cb.setOAuthAccessTokenSecret("jqRMTpM9BYmdOBFVoCoBfT0BZkL8FGT9pHKOReqej4jBa");

   TwitterFactory tf = new TwitterFactory(cb.build());

    twitter = tf.getInstance();
}

void draw() {
  background (0);
  x = x + speed;
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
  noStroke ();
  ellipse (x, 50, 50, 50);
  
  if (keyPressed == true) {
    tweet();
    //servo moves
    arduino.servoWrite (9, 204);
    arduino.servoWrite (8, 204);
    //ellipse changes to green when pressed
    fill (57,181,74);
  }
  else {
    //servo moves
    arduino.servoWrite (9,102);
    arduino.servoWrite (8,102);
    //ellipse changes to red when released
    fill (255,0,0);
  }
}   

void tweet()
{
    try
    {
     Status status = twitter.updateStatus("Act 1 | Scene 1: And as the ship cruised into the angy sea, a giant squid was spotted off the starboard deck.");
        System.out.println("Status updated to [" + status.getText() + "].");
    }
    catch (TwitterException te)
    {
        System.out.println("Error: "+ te.getMessage()); 
    }
} 


