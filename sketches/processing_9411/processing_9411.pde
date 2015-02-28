
///////////libraries///////
import themidibus.*; //Import the library 
MidiBus myBus; // The MidiBus  
import ddf.minim.*;
import ddf.minim.signals.*;
////////////map////////////
PImage a; 
int[] aPixels; 
int direction = 1; 
boolean onetime = true; 
float signal;
/////////////cars////////////
ArrayList cars;
int speed = 1;
/////////////sound///////////
Minim minim;
AudioPlayer player;
int temptone = 0;
int channel = 7; 

  
class Car 
{ 
    float xpos;
    float ypos;
    float xspeed;
    PImage taxi;

    // The Constructor is defined with arguments.
    Car(float tempXpos, float tempYpos, float tempXspeed, PImage x) 
    { 
      xpos = tempXpos;
      ypos = tempYpos;
      xspeed = tempXspeed;
      taxi = x;
    }

    void display() 
    {
      image(taxi, xpos, ypos, 20, 10);
    }

    void move() 
    {
      //stop at intersection
      if(xpos == 528 || xpos == 395 || xpos == 265 || xpos == 135)
      {
          delay(1000);
          xpos = xpos - xspeed;
      }
      else
      {  
         xpos = xpos - xspeed;
      }   
      //wraparound
      if (xpos < -2) xpos = width+2; 
      if (xpos > width+2)  xpos = -2;

    }
}

void setup()  
{ 
  size(640, 310); 
  cars = new ArrayList();
  cars.add(new Car(640,47,speed,loadImage("taxiplan.jpg"))); //inital taxicab
  ////sound/////
    MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

	// or for testing you could ...
	//                 Parent  In        Out
	//                   |     |          |
	myBus = new MidiBus(this, "", "Java Sound Synthesizer"); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
  minim = new Minim(this);
  player = minim.loadFile("background.wav", 2048);
  player.play();
  player.loop();
  ////images////
  aPixels = new int[width*height]; 
  noFill(); 
  stroke(255); 
  frameRate(30); 
  a = loadImage("map_1.jpg"); 
  for(int i=0; i<width*height; i++) 
  { 
    aPixels[i] = a.pixels[i]; 
  }  
 
} 

void mousePressed() //layer in taxicabs
{
  
  //cars.add(new Car(mouseX, mouseY,1));
  int x = mouseX;
  int y = mouseY;

  if((47+5) > y && y > (47-5))
  {
       y = 47;
  }     
  if((56+5) > y && y > (56-5))
  {
      y = 56;
  }
  if((112+5) > y && y > (112-5))
  {
      y = 112;
  }    
  if((122+5) > y && y > (122-5))
  {
      y = 122;
  } 
  if((178+5) > y && y > (178-5))
  {
      y = 178;
  } 
  if((188+5) > y && y > (188-5))
  {
      y = 188;
 } 
 if((244+5) > y && y > (244-5))
  {
      y = 244;
  }   
 if((254+5) > y && y > (254-5))
  {
      y = 254;
  }
 
  if(y == 47 || y == 56 || y == 112  || y == 122 || y == 178 || y == 188 || y == 244 || y == 254) //make cars in lane
  {
    cars.add(new Car(x, y,speed,loadImage("taxiplan.jpg")));
    for(int i=0; x<cars.size(); i++)
    {
        Car loc = (Car) cars.get(i);
        float x1 = loc.xpos;
        float y1 = loc.ypos;
         
        if(  (x1 + 20) < x && (x1 - 20 ) > x && (y1 - 10) > y && (y1 + 10) < y)  //no overlaping cars
        {
            cars.add(new Car(mouseX, mouseY,1,loadImage("taxiplan.jpg")));
        } 
    }  
  }
}


void draw()  
{ 
   loadPixels(); 
   for (int i=0; i<width*height; i++) 
   {  
     pixels[i] = aPixels[i];   
   } 
  updatePixels(); 
  for(int x=0; x<cars.size(); x++)
  {
    Car cab = (Car) cars.get(x);
    float x2 = cab.xpos;
    float y2 = cab.ypos;
    signal = y2*width+x2;
    float pitchf = hue(aPixels[int(signal)]);
    convert(pitchf); 
    int pitchi = temptone;  //note
    int velocity = 100;     //volume

   	myBus.sendNoteOn(channel, pitchi, velocity); // Send a Midi noteOn 
	delay(150); 
	myBus.sendNoteOff(channel, pitchi, velocity); // Send a Midi nodeOff 
	 
	int number = 0; 
	int value = 90; 

    cab.display();
    cab.move();
   
  }
}

 void convert(float hue1)
 {
    if (hue1 >= 323) 
    {
      temptone = 25;
    }
    if (hue1 >= 244 && hue1 < 292) 
    {
      temptone = 32;
    }
    if (hue1 >= 200 && hue1 < 244) 
    {
      temptone = 39;
    }
    if (hue1 >= 143 && hue1 < 200) 
    {
      temptone = 46;
    }
    if (hue1 >= 107 && hue1 < 143) 
    {
      temptone = 54;
    }
    if (hue1 >= 48 && hue1 < 75) 
    {
      temptone = 61;
    }
    if (hue1 >= 33 && hue1 < 48) 
    {
      temptone = 68;
    }
    if (hue1 <= 33) 
    { 
      temptone = 75;
    }
    if (hue1 == 0) 
    { 
      temptone = 0;
    }
}

void keyPressed()
{
    if(key == CODED)
    {  
      if (keyCode == UP)
      {
         channel++;
         println("channel" + channel);
      }
      if (keyCode == DOWN)
      {
          channel--;
          println("channel" + channel);
      }
      if (keyCode == RIGHT)
      {
         if(speed < 10)
        { 
         speed++;
         println("speed" + speed);
        } 
      }
      if (keyCode == LEFT)
      {
        if(speed > -10)
        { 
         speed--;
         println("speed" + speed);
        } 
      }
    }
} 
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
 



