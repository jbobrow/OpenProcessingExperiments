
/*
HendersonSix July2010

This sketch extracts the RGB values from recognisable logos such as Coca Cola, 
Shell, Facebook etc and generates a composition based on the colour data.

For more information about the project visit http://hendersonsix.com
*/

PImage img;

int files = 10; //number of files in the data folder
int thresh = 1; //change this to filter out certain colors
int x, y = 0;
int h = 10; //height increment
int w = 6; //width increment

void setup(){
  size(800, 600);
  noFill();
  background(0);
  strokeWeight(1);
  img = loadImage(int(random(1, files))+".jpg"); //begin by loading random logo from folder
}

void draw(){
  translate(0, -200);

  for(int i=0; i<img.width/2; i+=w){
    for(int j=0; j<img.height/2; j+=w){
      color currColor = img.get(i, j);
      int r = (currColor >> 24) & 0xFF; //get red values
      int g = (currColor >> 16) & 0xFF; //get green values
      int b = (currColor >> 8) & 0xFF; //get blue values

      if (x>width){
        x=0;
        y+=1;
      }
      else{
        x+=(w/3);
      }

      if(y>height){
        x = 0;
        y = 0;
        img = loadImage(int(random(1, files))+".jpg"); //load new logo when end of page is reached
        h = (int)random(5, 40); //change lineheight for variation
      }
      else if(random(0, 100)>99.99){
        img = loadImage(int(random(1, files))+".jpg");
      }
      
      //group colours based on appearance in the selected logo image
      if(g-thresh>r || g-thresh>b){
        stroke(currColor);
        float y2 = map(g, 0, 255, 51, 100);
        line(x, y2+y, x, y2+y+h);
      }
      
      if(r-thresh>g || r-thresh>b){
        stroke(currColor);
        float y1 = map(r, 0, 255, 101, 150);
        line(x, y1+y, x, y1+y+h);
      }
      
      if(b-thresh>r || b-thresh>g){
        stroke(currColor);
        float y3 = map(b, 0, 255, 151, 200);
        line(x, y3+y, x, y3+y+h);
      }
      if(b==r && r==g){
        stroke(currColor);
        float y4 = map(currColor, 0, 255, 0, 50);
        line(x, y4+y, x, y4+y+h);
      }
    }
  }
}













