
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Template for iOS devices (javascript mode) and the accelerometer
//Here we'll be using Accelerometer.js for the accelerometers
//For iOS devices 
Maxim maxim;
AudioPlayer player;

float pos_x = 10;
float pos_y = 10;
float pos_z = 10;
int mode = 0;
boolean working = false;
void setup ()
{
  size(800, 600);
  
  maxim = new Maxim(this);
  player = maxim.loadFile("mykbeat.wav");
  
  

}
void draw ()
{
  
    if(mode == 1){
        background(255,0,0);
    }
    if(mode == 2){
        background(0,255,0);
    }if(mode == 3){
        background(0,0,255);
    }
    if(working){
      fill((pos_z/360)*255);
      strokeWeight(2);
      ellipse(400+(pos_y*10), 300+(pos_x*10), 50, 50);
    }
}

void setBallPos ( float posX, float posY, float posZ, int modechoice)
{
    pos_x = posX;
    pos_y = posY;
    pos_z = posZ;
    mode = modechoice;
    working = true;
}

void mousePressed(){
    player.stop();
    player.play();  
}




