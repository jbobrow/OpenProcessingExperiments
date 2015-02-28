
//Jordana Bungard
//Final Project: Talk to Me "Taxi"
//April 17,2014
/*tweak of http://www.openprocessing.org/sketch/143836*/
/*audio code derived from notes from processing forum http://forum.processing.org/two/search?Search=sound*/
/*free sounds from soundbible.com*/
/*all New York City camera feeds found through http://nyctmc.org/ */
/*IMPORTANT to make the cars accekerate/randomize t must be held. This also activates a sound which will loop when t is held. The sound will have to run through entirely at this point or 3 must be pressed repeatedly until it stops.
Q-darker yellow
W-taxis are random color
E-random stroke color
R-black taxis with white stroke
T- faster framerate, randomized taxis, "Car Accelerating.mp3"
Y- bright yellow
1-"Traffic Jam.mp3"
2-stop sounds
3-traffic cam feed Water St @ Wall St -hold 1 to bring image to front and continually refresh
4-traffic cam feed Union Sq @ 14th St-hold 4 to bring image to front and continually refresh
5-traffic cam feed 5 Ave @ 49 St- hold 5 to bring image to front and continually refresh
6-traffic cam feed Houston St @ Lafeyette St- hold 6 to bring image to front and continually refresh
7-traffic cam feed 3 Ave @ 57 St- hold 7 to bring image to front and continually resfresh
8-traffic cam feed Lexington Ave @ 49 St-hold 8 to bring image to front and continually refresh
9-traffic cam feed 6 Ave @ 23 St-hold 9 to bring image to front and continually refresh
0-traffic cam feed 5 Ave @ 57 St-hold 0 to bring image to front and continually refresh
ENTER/RETURN- reset*/
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
PImage z;//variable for image
PImage w;//variable for image
PImage v;//varibale for image
PImage u;//variable for image
PImage t;//variable for image
PImage s;//variable for image
PImage r;//variable for image
PImage p;//variable for image


void setup(){//begin for loop
  size(500,500);//size of window
  background(0);//canvas is black
  frameRate(7);//rate frames are changing
  minim = new Minim(this);//initialize and start sound engine
  frame.setBackground(new java.awt.Color (0,0,0));  //this will add a black background if I go full screen:Flo's code
  }//end for loop
  

void draw(){//begin for loop
    stroke(0);//black outline
    for( x =30; x < width-30; x = x+30)//declare and initialize x, creates movement
    {//begin x for
      for( y = 20; y < height-20; y = y+random(20))//declare and initialize y,creates movement
      {//begin y for
        strokeWeight(random(.5,1.5));//random line thickness
        rectMode(CENTER);//first parameters are center and last two are width and height.
        rect(x,y,random(10,20),random(15));//randomly drawn rectangles-taxi
        ellipse(x,y,random(20),random(20));//randomly drawn ellipses-taxi
        rect(x,y,random(10,20),random(50));//randomly drawn rectangles-taxi
        ellipse(x,y,random(20),random(10));//randomly drawn ellipses-taxi
        if(keyPressed){//begin if
          if(key=='r'||key=='R'){//if r is pressed
            fill(0);//taxis turn black
            stroke(255);}//white stroke
        }else{//otherwise
          fill(255);//taxis are white
          stroke(0);//black stroke
        }//end if
         if(keyPressed){//begin if
            if(key=='q'||key=='Q'){//if q is pressed
              fill(250,170,50);}//taxis are orange yellow
            }else{//otherwise
              fill(255);//taxis are white
            }//end if
              if(keyPressed){//begin keyPressed 'w'
            if(key=='w'||key=='W'){//if w is pressed =new york night life
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
                  stroke(random(255),random(255),random(255));}//taxi outlines have random colors-new york night life 
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
                fill(255,205,0);//colorful crazy cars
                println("GO SPEED RACER");//print line
                rotate(2);//cars go all over screen
                }//end fill,rotate,print
                 }//end keyPressed 't' for randomized cars
                }//end keyPressed't' for speed
              }//end y for
    }//end for x
    if(keyPressed){//begin keyPressed 't'
    if (key=='t'||key=='T'){//if t is pressed(only press once or sound will layer)
    minim=new Minim(this);//initialize and start sound engine
    player=minim.loadFile("Car Accelerating.mp3");// load sound 
    player.play();}//plays for 11 seconds
    if(keyPressed){//begin keyPressed
      if(key=='1'){//if 1 is pressed
    minim=new Minim(this);//initialize and start sound engine
    player1=minim.loadFile("Traffic Jam.mp3");//load sound
    player1.play();}//plays
    if(keyPressed){//begin if keyPressed
      if(key=='2'){//if 2 pressed
       minim.stop();//stop song/sound engine
      }//end keyPressed
      z= loadImage("http://207.251.86.238/cctv212.jpg?math=0.6359625619624576.png");//loads most recent cam image
if (keyPressed){//if keyPressed
  if (key=='3')//if 3 pressed
   image(z,55,55);}//load traffic cam image
   w= loadImage("http://207.251.86.238/cctv474.jpg?math=0.727782959972747.png");//loads most recent cam image
   if(keyPressed){//begin keypressed
     if(key=='4'){//if 4 pressed
       image(w,55,55);}//cam displayed
       v=loadImage("http://207.251.86.238/cctv8.jpg?math=0.3559101747801714.png");//load most recent cam image
       if(keyPressed){//begin keypressed
         if(key=='5'){//if 5 pressed
           image(v,55,55);}//cam displayed
    u=loadImage("http://207.251.86.238/cctv668.jpg?math=0.10021290429604002.png");//loads most recent cam image
    if(keyPressed){//begin keypressed
      if(key=='6'){//if 6 pressed
        image(u,55,55);}//cam displayed
        t=loadImage("http://207.251.86.238/cctv428.jpg?math=0.34679694418442164.png");//loads most recent cam image
        if(keyPressed){//begin keypressed
          if(key=='7'){//if 7 pressed
            image(t,55,55);}//cam displayed
            s=loadImage("http://207.251.86.238/cctv302.jpg?math=0.15389279674395018.png");//loads most recent cam image
            if(keyPressed){//begin keypressed
              if (key=='8'){//if 8 pressed
                image(s,55,55);}//cam displayed
                r=loadImage("http://207.251.86.238/cctv448.jpg?math=0.6728650637920006.png");//loads most recent cam image
                if(keyPressed){//begin keypressed
                  if(key=='9'){//if 9 pressed
                    image(r,55,55);}//cam displayed
                    p=loadImage("http://207.251.86.238/cctv299.jpg?math=0.6351923685786736.png");//loads most recent cam image
                    if(keyPressed){//begin keypressed
                      if(key=='0'){//if 0 pressed
                        image(p,55,55);}//cam displayed
    if(keyPressed){//begin keyPressed
      if(key==ENTER){//if enter pressed
       setup();}//reset--->return to setup loop
        }//end keypressed ENTER
  }//end keyPressed 0
}//end keyPressed 9
}//end keyPressed 8
}//end key pressed 7
}//end keypressed 6
}//end keypressed 5
}//end keypressed 4
}//end keypressed 2
}//end keypressed 1
}//end keypressed t
}//end draw loop

