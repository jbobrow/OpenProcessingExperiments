
// https://www.processing.org/tutorials/objects/

// Window width and height
int w = 300;
int h = 100;

// Defining 3 colours using hex colour codes
color yellowish =   #CCD300;
color blueish =     #002DD8;
color redish =      #C90000;
// alternatively could be written as:
// color redish = color(201,0,0);

color[] colorList = new color[3];
void setup() {
  size(w,h);
  strokeWeight(5);

//putting the colours into a list/array  
  colorList[0] = yellowish;
  colorList[1] = blueish;
  colorList[2] = redish;
}

void draw() {
  
     fill(colorList[0]); 
     rect(0,0,100,100);
     
     fill(colorList[1]); 
     rect(100,0,100,100);
     
     fill(colorList[2]); 
     rect(200,0,100,100);
     
     
    

     int counter = 0;
     while (counter < 300) {
       fill(colorList[counter%3]);
       rect(30*counter, 0, w/30 , h);
counter++;
   }

}
