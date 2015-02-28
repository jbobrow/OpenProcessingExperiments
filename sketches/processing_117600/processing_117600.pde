
/* @pjs preload="blinkwithwind001.png", "blinkwithwind002.png", "blinkwithwind003.png", "blinkwithwind004.png", "blinkwithwind005.png",
"blinkwithwind006.png", "blinkwithwind007.png", "blinkwithwind008.png", "blinkwithwind009.png", "blinkwithwind010.png", 
"blinkwithwind011.png", "blinkwithwind012.png", "blinkwithwind013.png", "blinkwithwind014.png";*/


/*import ddf.minim.*;

Minim minim;
AudioInput in;*/

PImage i001, i002, i003, i004, i005, i006, i007, i008, i009, i010, i011, i012, i013, i014;
float prevMillis;
int myState = 0, myCounter = 1;

void setup()
{
  size(600, 357);

 /* minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  
  // uncomment this line to *hear* what is being monitored, in addition to seeing it
  in.enableMonitoring();*/
  
  //images
  i001 = loadImage("blinkwithwind001.png");
  i002 = loadImage("blinkwithwind002.png");
  i003 = loadImage("blinkwithwind003.png");
  i004 = loadImage("blinkwithwind004.png");
  i005 = loadImage("blinkwithwind005.png");
  i006 = loadImage("blinkwithwind006.png");
  i007 = loadImage("blinkwithwind007.png");
  i008 = loadImage("blinkwithwind008.png");
  i009 = loadImage("blinkwithwind009.png");
  i010 = loadImage("blinkwithwind010.png");
  i011 = loadImage("blinkwithwind011.png");
  i012 = loadImage("blinkwithwind012.png");
  i013 = loadImage("blinkwithwind013.png");
  i014 = loadImage("blinkwithwind014.png");
  
}

void draw()
{
  background(255);
  noStroke();
  smooth();
  
  
 /* // draw the waveforms so we can see what we are monitoring
  for (int i = 0; i < in.bufferSize() - 1; i++)
 
  {
   // println(in.left.get(i)*50) ;
    if ((( in.left.get(i)*50) > 10) && (millis() - prevMillis > 40)) {

      //this is where we would advance our state.
      //println("HELLO!");
      myState = myState +1;
      
      if(myState>13){
        myState = 0;
       
    }
     prevMillis = millis();
    }      
    }*/
 
      
      switch(myState) { //KICK!!!!
      
      case 0:
      image(i001, 0, 0);
      break;
      
      case 1:
      image(i002, 0, 0);
      break;
      
      case 2:
      image(i003, 0, 0);
      break;
      
      case 3:
      image(i004, 0, 0);
      break;
      
      case 4:
      image(i005, 0, 0);
      break;
      
      case 5:
      image(i006, 0, 0);
      break;
      
      case 6:
      image(i007, 0, 0);
      break;
      
      case 7:
      image(i008, 0, 0);
      break;
      
      case 8:
      image(i009, 0, 0);
      break;
      
      case 9:
      image(i010, 0, 0);
      break;
      
      case 10:
      image(i011, 0, 0);
      break;
      
      case 11:
      image(i012, 0, 0);
      break;
      
      case 12:
      image(i013, 0, 0);
      break;
      
      case 13:
      image(i014, 0, 0);
      break;
      }
  }
  
  void mousePressed(){
   myState = myState +1;
      if(myState>13){
        myState = 0;
    }
 }


