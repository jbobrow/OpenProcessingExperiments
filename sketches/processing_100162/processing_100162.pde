

int width=1050; // I have created a variable here so I can easily change the size of the drawing without effecting the distribition of the lines 
int height=500;// I have created another variable here for the same reason
int minx= 0;// these next 4 variables enable me to distribute the lines across the entire area of the drawing. No matter what the area assigned above.
int maxx=width;
int miny=0;
int maxy=height;

void setup() {//this function is called once when the program starts.  Used to define initial environment properties and load media such as images or fonts.

  size(1050,500);//set the size of the page to the variables declared above
 
}

void draw() {
  background(190, 190, 90);// background is run here so it redraws each time the draw function runs.  The colour is determined in default (RGB) mode.
  stroke(255);//the lines are white
strokeWeight(2);//the lines are 1 and half pixels thick
for (int i=0;i<4; i++) {// a loop is created here with the 'for' structure' so I can easily set the number of lines I want created. 
// the 'for' structure controls a sequence of repetitions or ITERATIONS. (it has 3 parts (initiate; test; update), each seperated by a semicolon.  It runs through the 3 parts in a loop, until 'test' is determined to be 'false', when the loop is then  exited. 
    line(minx, random(height), maxx, random(height));//a line is draw between 2 point(x1,y1,x2,y2) I use my variables declared above to be able to randomise there position across the entire area.
    line(maxx, random(height), maxx, random(height));
    line(random(width), miny, random(width), maxy);
    line(random(width), maxy, random(width), miny);
    line(minx, random(height), random(width), miny);
    line(minx, random(height), random(width), maxy);
    line(random(width), maxy, maxx, random(height));
    line(random(width), miny, maxx, random(height));//by the time the 'for' strucutre runs 5 times there will be 40 lines in total
  }
  noLoop();// noLoop function here strops the draw function from running continuously.  
  //I could also run noLoop() as the last line in setup() or as the first lie of draw(), to the same effect.
}//signals the end of the draw function


void mousePressed() { //mouse interaction.  When mouse is pressed.....
  redraw();// this function runs the draw() code one time when called by an event such as mousePressed or keyPressed
}




