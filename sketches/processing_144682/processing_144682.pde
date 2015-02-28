
//Jordana Bungard
//Final Project: Talk to Me
//April 17,2014
/*tweak of http://www.openprocessing.org/sketch/143836*/
/*audio code derived from notes from processing forum http://forum.processing.org/two/search?Search=sound*/
/*music converted from youtube using http://www.youtube-mp3.org/--> "New York" by Frank Sinatra, "Empire State of Mind" by Alicia Keys and Jay-Z*/
/* Q-blue
W-taxis are random color
E-random stroke color
R-red
T- faster framerate, randomized taxis
Y-yellow
1-"New York" by Frank Sinatra
2-"Empire State of Mind" by Alicia Keys and Jay-Z
3- stop songs*/

//import minim library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;//declaring variable
AudioPlayer player;//declaring variable
AudioPlayer player1;//variable
float x;//declaring variable
float y;//declaring variable

void setup(){//begin for loop
  size(500,500);//size of window
  background(0);//canvas is black
  frameRate(7);//rate frames are changing3
  minim = new Minim(this);//initialize and start sound engine
  }//end for loop
  
void draw(){//begin for loop
    stroke(0);//black outline
    for( x =30; x < width-30; x = x+30)//declare and initialize x, creates movement
    {//begin x for
      for( y = 20; y < height-20; y = y+random(20))//declare and initialize y,creates movementtttt
      {//begin y for
        strokeWeight(random(.5,1.5));//random line thickness
        rectMode(CENTER);//first parameters are center and last two are width and height.
        rect(x,y,random(10,20),random(15));//randomly drawn rectangles-taxi
        ellipse(x,y,random(20),random(20));//randomly drawn ellipses-taxi
        rect(x,y,random(10,20),random(50));//randomly drawn rectangles-taxi
        ellipse(x,y,random(20),random(10));//randomly drawn ellipses-taxi
        if(keyPressed){//begin if
          if(key=='r'||key=='R'){//if r is pressed
            fill(random(255),50,0);}//taxis turn red
        }else{//otherwise
          fill(255);//taxis are white
        }//end if
         if(keyPressed){//begin if
            if(key=='q'||key=='Q'){//if q is pressed
              fill(50,50,random(255));}//taxis are blue
            }else{//otherwise
              fill(255);//taxis are white
            }//end if
              if(keyPressed){//begin keyPressed 'w'
            if(key=='w'||key=='W'){//if w is pressed
              fill(random(255),random(255),random(255));}//taxis are rainbow(wild)
            }//end keyPressed 'w'
            else{//otherwise, begin else 'w'
              fill(255);//taxis are white
            }//end else 'w'
               if(keyPressed){//begin keyPressed 'y'
            if(key=='y'||key=='Y'){//if y is pressed
              fill(255,255,0);}//taxis are yellow
            }//end keyPressed 'y'
            else{//otherwise,being else 'y'
              fill(255);//taxis are white
            }//end else 'y'
              if (keyPressed){//begin keyPressed 'e'
                if(key=='e'||key=='E'){//when e is pressed
                  stroke(random(255),random(255),random(255));}//taxi outlines have random colors
              }//end keyPressed 'e'
              else{//otherwise, begin else 'e'
                stroke(0);//stroke is black
              }//end else 'e'
                if (keyPressed){//begin keyPressed
                  println("VROOOOOOOOOMMMMM");//when any key is pressed VROOOOOOOOOMMMMM is printed
                }//end keyPressed
                if(keyPressed){//begin keyPressed 't' for speed
                if(key=='t'||key=='T'){//when t is pressed,begin keyPressed framerate faster
                frameRate(20);//taxis go faster
                }//end keyPressed framerate faster
                else{//otherwise---->>press any button
                frameRate(7);//frame rate stays the same
                }//end else 't' for speed
                 if(keyPressed){//begin keyPressed 't' for randomized cars
                if(key=='t'||key=='T'){//when t is pressed
                fill(random(255),random(255),50);//colorful crazy cars
                println("GO SPEED RACER");//print line
                rotate(2);//cars go all over screen
                }//end fill,rotate,print
                 }//end keyPressed 't' for randomized cars
                }//end keyPressed't' for speed
              }//end y for
    }//end for x
      
    if(keyPressed){//begin keyPressed '1'
    if (key=='1'){//if 1 is pressed(only press once or song will layer)
    minim=new Minim(this);//initialize and start sound engine
    player=minim.loadFile("NewYorkNewYork.mp3");// load song 
    player.play();}//plays
    if(keyPressed){//begin keyPressed
    if(key=='2'){//if 2 is pressed
    minim=new Minim(this);//initialize and start sound engine
    player1=minim.loadFile("Empire State of Mind.mp3");//load song
    player1.play();}//plays
    if(keyPressed){//begin if keyPressed
    if(key=='3'){//if 3 pressed
    minim.stop();//stop song/sound engine
      }//end keyPressed
    if(keyPressed){//begin keyPressed
    if(key==ENTER){//if enter pressed
    setup();}//reset--->return to setup loop
        }//end draw loop
  }//end keyPressed '3'
}//end keyPressed '2'
}//end keyPressed '1'
}//end draw loop




