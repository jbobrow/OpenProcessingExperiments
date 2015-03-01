
class LedCube
{
  float rotationX;
  float rotationY;
  float velocityX;
  float velocityY;
  
  int alphaLed;
  int[][][] couleurs;
  
  LedCube()
  {
    float rotationX = 0;
    float rotationY = 0;
    float velocityX = 0;
    float velocityY = 0;
    couleurs = new int[3][3][3];
    alphaLed = 240;
  }
  
  void update()
  {
    background(0);
    translate(width/2, height-200);
    
    rotationX += velocityX;
    rotationY += velocityY;
    velocityX *= 0.95;
    velocityY *= 0.95;
    
    if (mousePressed) {  
      velocityX += (mouseY-pmouseY) * 0.1;
      velocityY -= (mouseX-pmouseX) * 0.1;
    }
    
    translate(0,-200); 
    rotateX( radians(-rotationX));  
    rotateY( radians(270 - rotationY));
    translate(0, 150); 

    
    translate(-100,-60,-100);
    noStroke();
    for(int jjj=0;jjj<3;jjj++)
    {
      for(int jj=0;jj<3;jj++)
      {
        for(int j=0;j<3;j++)
        {
          pushMatrix();
          translate(100*jj, -100*j,100*jjj);
          fill((couleurs[jjj][jj][j]>>16)&255,(couleurs[jjj][jj][j]>>8)&255,couleurs[jjj][jj][j]&255,alphaLed);
          sphere(30);
          popMatrix();
        }
      }
    }
  }

  int rgb2encodage(int r,int g,int b)
  {
    int encodage  = (r<<16|g<<8|b); 
    return encodage;
  }

  void led(int x,int y,int z, int couleur)
  {
    if((x>2 || x<0)||(y>2 || y<0)||(z>2 || z<0))
      return;
      
    couleurs[z][y][x] = couleur;
  }
 
}

int puerto; 
LedCube cube = new LedCube();
Patterns patterns = new Patterns(cube);
int x;
int y;
int z;
int LastSelection = 0;
boolean NeedReset = false;

import themidibus.*;

MidiBus myBus;

void setup()
{
  frameRate(60);
  size(1280, 800, P3D);
  patterns.ResetColors();
  smooth();
  
  MidiBus.list();
  myBus = new MidiBus(this, 0, 0);

}
 
void draw()
{
  cube.update();
}

public void GetPatterns(int selection){
     
      if (NeedReset){
        ResetColors();
        NeedReset = false;
      }
}

 private void ResetColors(){
      for(z=0;z<3;z++){
        for(x=0;x<3;x++){
          for(y=0;y<3;y++){
           cube.led(z,x,y, 0x333333);
          }
        }
      }
 }

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note ON:---------");
  println("Channel:"+channel+"  Pitch:"+pitch+"  Velocity:"+velocity);
  int vel = velocity;
  int pit = pitch;
  
  if(pit == 36)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#6A0101);
  }
  
   if(pit == 36)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#9B0808);
  }
  
   if(pit == 37)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#D10F0F);
  }
  
   if(pit == 38)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#EA1F1F);
  }
  
   if(pit == 39)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#FF4343);
  }
  
   if(pit == 40)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#FF6F6F);
  }
  
   if(pit == 41)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#FF9595);
  }
  
   if(pit == 42)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#4A0193);
  }
   if(pit == 43)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#6713BC);
  }
  
   if(pit == 44)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#8930E3);
  }
  
   if(pit == 45)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#9E44FA);
  }
  
   if(pit == 46)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#B166FC);
  }
   if(pit == 47)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#C58BFF);
  }
  
   if(pit == 48)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#C9A2F0);
  }
  
   if(pit == 49)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#C0B3CE);
  }
   if(pit == 50)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#B6DFEA);
  }
  
   if(pit == 51)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#95E3FA);
  }
  
   if(pit == 52)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#67CFED);
  }
  
   if(pit == 53)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#40D4FF);
  }
  
   if(pit == 54)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#11BDF0);
  }
   if(pit == 55)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#0492BC);
  }
  
   if(pit == 56)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#1B9B42);
  }
   if(pit == 57)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#11BF46);
  }
   if(pit == 58)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#02DE45);
  }
   if(pit == 59)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#17FA5C);
  }
  
   if(pit == 60)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#4DFF84);
  }
  
   if(pit == 61)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#83F5A6);
  }

   if(pit == 62)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#90F273);
  }
  
   if(pit == 63)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#6CFF40);
  }
  
   if(pit == 64)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#53F024);
  }
  
   if(pit == 65)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#3DEA09);
  }
  
   if(pit == 66)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#21C60C);
  }
  
   if(pit == 67)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#169D05);
  }
  
   if(pit == 68)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#0C5D02);
  }
  
   if(pit == 69)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#A7F000);
  }
  
   if(pit == 70)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#B4F719);
  }
  
   if(pit == 71)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#BFF73E);
  }
  
   if(pit == 72)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#CDF76B);
  }
  
   if(pit == 73)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#A6CB50);
  }
  
   if(pit == 74)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#8DB72C);
  }
   if(pit == 75)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#78A512);
  }
  
   if(pit == 76)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#5D8304);
  }
   if(pit == 77)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#5B6206);
  }
   if(pit == 78)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#879004);
  }
   if(pit == 79)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#ABB707);
  }
   if(pit == 80)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#C8D60B);
  }
   if(pit == 81)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#E0F013);
  }
   if(pit == 82)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#F0FF29);
  }
  
   if(pit == 83)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#FAF026);
  }
   if(pit == 84)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#EAE00E);
  }
  
   if(pit == 85)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#D1C706);
  }
  
   if(pit == 86)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#A0990D);
  }
  
   if(pit == 87)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#F01D91);
  }
  
   if(pit == 88)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#F746A8);
  }
  
   if(pit == 89)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#E56DAF);
  }
  
   if(pit == 90)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#B75C8E);
  }
  
   if(pit == 91)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#2703FF);
  }
  
   if(pit == 92)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#270ACE);
  }
   if(pit == 93)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#3D27B9);
  }
  
   if(pit == 94)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#473A93);
  }
  
   if(pit == 95)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#695EAA);
  }
   if(pit == 96)
  {
     for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#9992C4);
  }
              
              if(LastSelection != pit){
          NeedReset = true;
        }
        LastSelection=pit;
   
  }





 public class Patterns{
   boolean NeedReset = false;
   int LastSelection = 0;
   LedCube cube;
   
   private int x,y,z;
   
   Patterns()
   {
     cube = null;
   }
   Patterns(LedCube _cube)
   {
     cube = _cube;
   }
   public void GetPatterns(int selection){
     
      if (NeedReset){
        ResetColors();
        NeedReset = false;
      }
      
      switch(selection)
        {
        case 'q':
         for(z=0;z<3;z++)
          for(x=0;x<813;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#FA1212);
        break;
        case 'w':
         for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#9AF737);
        break;
        case 'e':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#2DFAE0);
        break; 
        case 'r':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#C72BE0);
        break;
        case 't':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#B8E310);
        break;
        case 'y':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#F5851B);
        break;
        case 'u':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#1B9FF5);
        break;
        case 'i':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#40FFFD);
        break; 
        case 'o':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#6F0732);
        break; 
        case 'p':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#07466F);
        break; 
        case 'a':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#F1FF39);
        break; 
        case 's':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#1B7C13);
        break; 
        case 'd':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#CE6AB0);
        break; 
        case 'f':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#B907F0);
        break; 
        case 'g':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#A3FC52);
        break; 
        case 'h':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#43007E);
        break; 
        case 'j':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#093636);
        break; 
        case 'k':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#B2705D);
        break; 
        case 'l':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#081A62);
        break; 
        case 'ñ':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#818EBF);
        break; 
        case 'z':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#A5D331);
        break; 
        case 'x':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#93602A);
        break; 
        case 'c':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#F6FA9A);
        break; 
        case 'v':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#CB29CB);
        break; 
        case 'b':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#F70202);
        break;
        case 'n':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#B37AED);
        break; 
        case 'm':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#FFBA0A);
        break;
        case '1':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#3C5F58);
        break; 
        case '2':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#023E32);
        break; 
        case '3':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#02624F);
        break; 
        case '4':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#00896E);
        break; 
        case '5':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#02B996);
        break; 
        case '6':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#07E3B8);
        break;   
        case '7':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#17FFD2);
        break; 
        case '8':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#50FFDD);
        break; 
        case '9':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#86FFE2);
        break; 
        case '0':
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,#DEFFF4);
        break; 
        default:
        ResetColors();  
        break;
        }
        
        if(LastSelection != selection){
          NeedReset = true;
        }
        LastSelection=selection;
   }
   
    private void ResetColors(){
      for(z=0;z<3;z++){
        for(x=0;x<3;x++){
          for(y=0;y<3;y++){
           cube.led(z,x,y, 0x333333);
          }
        }
      }
    }
  }


