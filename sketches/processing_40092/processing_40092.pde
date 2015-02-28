
//Irina Shumskaya
//6.2 Re-Visualization
//This sketch recreates an image of Marilyn Monroe by using the RGB data from pixels

int num = 4;
 
PImage marilynMonroe;
 
void setup(){
  size(300,300);
  marilynMonroe = loadImage("marilynMonroe.jpg");
  background(0);
  smooth();
  frameRate(5000);
}
   

void draw(){                                       //this creates a system that reads the RGB value from the image
    int x = int (random(marilynMonroe.width));
    int y = int (random(marilynMonroe.height));   
    int Pixels = x + y*marilynMonroe.width;
    loadPixels();
    float r= red(marilynMonroe. pixels[Pixels]);    //this reads the red in the image
    float g= green(marilynMonroe. pixels[Pixels]);  //this reads the green in the image
    float b= blue(marilynMonroe .pixels[Pixels]);   //this reads the blue in the image
     
    noStroke();
    fill(r,g,b);
    ellipse (x,y,num,num);
  }
 


