



                
                
float y;
float x;
float prevx;
float prevy;
float currentx;
float currenty;
float area;
float shadefrom;
float square;
float sep;
float verticaltrans;
float horizontaltrans;
float maxdraw;
float shadeto;
float resolution;
float multiplier=.1;
///////////////rootbeer floats///////////////
int mousepx;
int xmax;
int xmin;
int ymin;
int ymax;
int ymean;
int xmean;
int flipped;
///////////////intergral ints///////////////
boolean end=false;
boolean first=true;
boolean samewindow;
PFont fontA;

void settings () {
  ////////////////////////draw length///////////////////////////
  maxdraw = width+height;  //when to stop plotting
  ////////////////////////transformations///////////////////////
  verticaltrans =.0;
  horizontaltrans=.0;
  square = 2;  //the degree of x
  flipped = -1;  // same as -f(x)
  // resolution=.001;
  ////////////////////////[x1 to x2]////////////////////////////
  shadefrom = 1;  //constraints of where to calculate the area
  shadeto = 4;
  ymean = (ymax - ymin);
  xmean = (xmax - xmin);
  /////////////////////////don't mind these/////////////////////
  area=0;
  x=0;
  y=0;
  currentx=0;
  currenty=0;
  prevx=0;
  prevy=0;
  end=false;
  first=true;
}



void setup() {
  size(650, 650,JAVA2D); //the program can adapt to diffent resolutions
  //size(screenWidth,screenHeight,JAVA2D); //used for fullscreen mode
  noSmooth();   //more accurate rendering, AA makes the plot look odd
  fontA = loadFont("ArialMT-35.vlw");
  textFont(fontA, 35);
  background(230);
  xmax = 10;  //the plotting area. these are acivley changed by the user so are not in settings()
  xmin= -10;
  ymin= -10;
  ymax = 10;
  settings();
  drawgrid();
}

void draw() {
  if (end) {  //done rendering
    if (mouseX!=mousepx || !samewindow)
    {
      resolution= map(mouseX, 0, width, multiplier, .00000);
      background(230);
      drawgrid();
      settings();
      currentx+=horizontaltrans;
      mousepx = mouseX;
      samewindow=true;
      end = false; 
    }
    mousepx = mouseX;  //may change to pmousex
  }
  else {
    calculate(); //i set this up so you can see the line render rather than putting it in a while loop. it renders a bit slower but looks nicer.
  }
}

void calculate() {
  currentx+=resolution;
  currenty=(-((pow(currentx, square))+verticaltrans));
  
  if ((prevx>=shadefrom)&&(prevx<=shadeto) ) { //if over shade area
    area -= (((prevy)*(currentx-prevx))+(((prevy-currenty)*(prevx-currentx))/2)); //calculate the area under the current and last point then add it to the running total
    line(x, y, x, height/2);
  }
  x = (((currentx - xmin) * width)/ xmean); //simplied map()
  y = (((currenty - ymin) * height)/ ymean);
  line(x, y, (((prevx - xmin) * width)/ xmean), (((prevy - ymin) * height)/ ymean));
  prevx= currentx;
  prevy= currenty;
  fill(235);
  stroke(235);
  rect(4, height-80, width-4, 30); //over the text so it doesn't look ugly
  fill(0);
  text("Area:"+" "+area, 5, height-50);
  stroke(0);
  if (x>=maxdraw || y>=maxdraw || y<=-maxdraw || x<=-maxdraw || mouseX!=mousepx) {  //break condition
    end=true;
    drawgrid();
    fill(235);
    stroke(235);
    rect(4, height-80, width-4, 30);
    fill(0);
    text("Area:"+" "+area, 5, height-50);
    fill(235);
    stroke(235);
  }
}

void keyPressed () {
  if (key == '-') { //zoom out
    xmax += 1;
    xmin -= 1;
    ymin -= 1;
    ymax += 1;
    samewindow=false; //interrupt any rendering that might be happening
  }
  else if (key=='=' || key=='+') //zoom in without need shift for +
  {
    xmax -= 1;
    xmin += 1;
    ymin += 1;
    ymax -= 1;
    samewindow=false;
  }
  else if (key-48 >= 0 || key-48<=9) {
    multiplier=((pow(.1, key-48))*100);
    samewindow=false;
  }
}




void drawgrid() {
  stroke(255, 30, 10);
  sep=xmin;
  for (int i=0; i<=xmax*2; i++) {
    sep++;
    line((width/2)+2, map(sep, xmin, xmax, 0, width), (width/2)-2, map(sep, xmin, xmax, 0, width)); //TODO: replace the maps with simplified equations.
    line(map(sep, xmin, xmax, 0, width), (height/2)+2, map(sep, xmin, xmax, 0, width), (height/2)-2);
  }
  fill(0);
  text("use numeric keys\nto change resolution\n+ and - zooms in\nand out",width*.025,height*.05);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2); 
  stroke(0);
  fill(235);
  stroke(235);
  rect(0, height-80, width, 80);
  fill(0);
  stroke(0);
  strokeWeight(4);
  line(0, height-84, width, height-84);
  strokeWeight(1);
  text("Resolution:", 5, height-5);
  text(str(resolution), 180, height-5);
  text("Area:", 5, height-50);
}

