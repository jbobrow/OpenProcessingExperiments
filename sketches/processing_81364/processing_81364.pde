
/*
IAT 800 Project 1: Display the progress of time in a non-traditional way.
 Comments: Different things will happen in this room depending on the hour of the day. (There is also a plant in a bowl that becomes fully grown after 4 minutes have elapsed.)
 Please see "schedule of events.docx" if you want a condensed list of what happens in this room and when!
 FREEZING: Changing the time on your computer while the program runs may cause animations to freeze. This usually happens while jumping backwards in time. Reset program if it happens!
 Amber Choo
 achoo@sfu.ca
 */

import gifAnimation.*; //import gifAnimation from library
PImage img; //calls PImage - needed to import background jpg

//declare a ton of animated gifs:
Gif ridleyVisit; 
Gif slenderMan; 
Gif loopinggif2; 
Gif loopinggif5; 
Gif loopinggif6;  
Gif pikmin; 
Gif loopinggif7pm; 
Gif loopinggif7pmTV; 
Gif loopinggif8; 
Gif loopinggif8p; 
Gif creepergif; 
Gif loopinggif10pm; 
Gif loopinggif11am; 
Gif loopinggifsleep; 
Gif plantmaster; 


void setup() {
  size(400, 239); //change the size of the canvas to the size of the background image (400x239 pixels)
  img = loadImage("data/BG3.jpg"); //assign img to BG3.jpg

  ridleyVisit = new Gif(this, "ridley.gif"); //assign Gif ridleyVisit to ridley.gif
  ridleyVisit.play(); //and make sure it plays when called

  plantmaster = new Gif(this, "plantmaster.gif"); //assign Gif plantmaster to plantmaster.gif
  plantmaster.play(); //and make sure it plays when called

  loopinggifsleep = new Gif(this, "sleep.gif"); //assign Gif loopinggifsleep to sleep.gif
  loopinggifsleep.loop(); //and make sure to loop it

  slenderMan = new Gif(this, "3am.gif"); //assign Gif slenderMan to 3am.gif
  slenderMan.play(); //and make sure it plays when called

  pikmin = new Gif(this, "6am.gif"); //assign Gif pikmin to 6am.gif
  pikmin.play(); //and make sure it plays when called

  loopinggif2 = new Gif(this, "2pm.gif"); //assign Gif loopinggif2 to 2pm.gif
  loopinggif2.loop(); //and make sure it loops!

  loopinggif5 = new Gif(this, "5pm.gif"); //assign Gif loopinggif5 to 5pm.gif
  loopinggif5.loop(); //and make sure it loops!

  loopinggif6 = new Gif(this, "6pm.gif"); //assign Gif loopinggif6 to 6pm.gif
  loopinggif6.loop(); //and make sure it loops!

  loopinggif7pm = new Gif(this, "7pm.gif"); //assign Gif loopinggif7pm to 7pm.gif
  loopinggif7pm.loop(); //and make sure it loops!

  loopinggif7pmTV = new Gif(this, "7pmTV.gif"); //assign Gif loopinggif7pmTV to 7pmTV.gif
  loopinggif7pmTV.loop(); //and make sure it loops!

  loopinggif8 = new Gif(this, "8pm.gif"); //assign Gif loopinggif8 to 8pm.gif
  loopinggif8.loop(); //and make sure it loops!

  loopinggif8p = new Gif(this, "8pmpeople.gif"); //assign Gif loopinggif8p to 8pmpeople.gif
  loopinggif8p.loop(); //and make sure it loops!

  creepergif = new Gif(this, "9pm.gif"); //assign Gif creepergif to 9pm.gif
  creepergif.play(); //and make sure it plays when called

  loopinggif10pm = new Gif(this, "10pm.gif"); //assign Gif loopinggif10pm to 10pm.gif
  loopinggif10pm.loop(); //and make sure it loops!

  loopinggif11am = new Gif(this, "11am.gif"); //assign Gif loopinggif11am to 11am.gif
  loopinggif11am.loop(); //and make sure it loops!


}


void draw() {
  image(img, 0, 0); //loads the background image. Must be in draw instead of setup so when the clock changes time, it doesn't leave a trace behind
  image(plantmaster, 202, 152);  //a plant that is fully grown in 4 minutes

  //amber's sleeping hours
  if (hour() == 0 || hour() == 1 || hour() == 2 || hour() == 3 || hour() == 4 || hour() == 5 || hour() == 6 || hour() == 7 || hour() == 8 || hour() == 9 || hour() == 10) { //if the current hour equals 12am-10am...
    image(loopinggifsleep, 198, 9);  //make some ZZZ's appear infront of Amber's door
  }

  //jordan's sleeping hours
  if (hour() == 1 || hour() == 2 || hour() == 3 || hour() == 4 || hour() == 5 || hour() == 6 || hour() == 7 || hour() == 8 || hour() == 9 || hour() == 10) { //if the current hour equals 1am-10am...
    image(loopinggifsleep, 315, 9);  //make some ZZZ's appear infront of Jordan's door
  }

  //ridley's sleeping hours
  if (hour() == 7 || hour() == 8 || hour() == 9 || hour() == 13 || hour() == 14 || hour() == 15 ||hour() == 16) { //if the current hour equals 7am-9am, or 1-4pm...
    image(ridleyVisit, 0, 0); //make Ridley the dog wander in for a visit
    if (millis() > 13000) { //if 13 seconds have passed...
      image(loopinggifsleep, 92, 150);  //make some ZZZ's appear as she sleeps
    }
  }

  if (hour() == 3) { //if the current hour equals 3am...
    image(slenderMan, 0, 0); //make slenderMan appear!!!
  }

  if (hour() == 6) { //if the current hour equals 6am...
    image(pikmin, 0, 118); //make the pikmin steal xbox controllers
  }

  if (hour() == 11) { //if the current hour equals 11am...
    image(loopinggif11am, 150, 80); //make Amber study
  }

  if (hour() == 12 || hour() == 13 || hour() == 14 || hour() == 15 || hour() == 16) { //if the current hour equals 12-4pm
    image(loopinggif2, 308, 44); //make Amber sit at the table with a laptop
  }

  if (hour() == 17) { //if the current hour equals 5pm...
    image(loopinggif5, 110, 132); //make Amber nap on the futon
  }

  if (hour() == 16 || hour() == 17 || hour() == 18 || hour() == 23 || hour() == 0) { //if the current hour equals 4-6pm, 11pm or 12am
    image(loopinggif6, 282, 80); //make Jordan work at the computer.
  }

  if (hour() == 19) { //if if the current hour equals 7pm
    //dexterMusic.play(); //play AudioPlayer dexterMusic. This is because void setup() can't play the music if user opened the application before 7pm & waited until 7pm
    image(loopinggif7pm, 70, 150); //make Amber and Jordan eat pizza
    image(loopinggif7pmTV, 87, 18); //make loopinggif7pmTV appear which is the TV animation (dexter)
  }

  if (hour() == 20) { //if the current hour equals 8pm
    //gameOfThrones.play(); //play AudioPlayer gameOfThrones. This is because void setup() can't play the music if user opened the application before 8pm & waited until 8pm
    image(loopinggif8, 87, 18);   //make the game of thrones animation play on the television screen
    image(loopinggif8p, 79, 150);  //make Amber and Jordan watch game of thrones
  }
  if (hour() == 21) { //if the current hour equals 9pm
    image(loopinggif6, 282, 80); //make Jordan sit at the computer.
  }
  if (hour() == 22) { //if the current hour equals 10pm
    image(loopinggif10pm, 130, 69); //make Jordan/Amber play monopoly
  }
  if (hour() == 0) { //if the current hour is midnight
    image(creepergif, 0, 0); //make the creeper appear!
  }

  //Time in the top right corner:
  textSize(10); //change the size of the text to 10pt
  if (hour() <= 12 && hour() != 0) { //if the current hour is less or equal to 12pm, and it's NOT 12am,
    text(hour() + ":" + nf(minute(), 2), 355, 22); //show the hour and minutes of the day. "nf" sets minute() output to 2 places here, so the time is 3:07, not 3:7
  }
  if (hour() == 0) { // if the current hour is 12am,
    text(hour()+12 + ":" + nf(minute(), 2), 355, 22); //add 12 to the value of hour() so it's not 0:30 - it prints 12:30.
  }
  if (hour() >= 13) { //if the hour is equal to or greater than 1pm,
    text(hour()-12 + ":" + nf(minute(), 2), 355, 22);  //show time, but -12 from the hour() value, so we can have a 12 hour clock, because I dislike military time
  }

  if (hour() > 11) { //if the hour is greater than 11am,
    text("PM", 384, 22); //write PM by the time!
  }
  else { //otherwise,
    text("AM", 384, 22); //write AM by the time!
  }
}


/*CREDITS
 Everything by me, except audio:
 Game of Thrones 8bit music by Digitapp (http://www.youtube.com/watch?v=hxc0EQiwngE). 
 Dexter 8bit intro by HamieNET.com
 Creeper's blowing up sound belongs to Mojang 
 */

