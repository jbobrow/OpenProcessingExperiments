
/**
Natalia Monroy-Lopez 3056493
Data Visualisation & Design

Data source http://www.inegi.org.mx
**/

//Global Variables

float[][] bcontrol;  // 2d Array that contains info from dataset
String[] years;      // string of years from dataset
int xmargin = 20; //value of xmargin
int colspacing = 150;  //size of columns in graph
int ybase = 500; //value that sets base for graph
float yscale = 3; //value for a scale on the y axis

int rollcolumn = 0;  //value for mouse rollover
int rollsegment = 0;
boolean rollover = false;//true or false value for mouse rollover


color[] colours = new color[2]; //colour array

PFont f1, f2;  //stating 2 fonts
PImage icon; //stating an image


//Setup for sketch, runs once at the beginning

void setup() {
  size(900,900);
  smooth();
  icon= loadImage("w.png");  //loading image
  bcontrol= new float[5][2];  //initiating 2d array
  years = new String[5];//initiating years string

  f1= createFont("URWBookmanL-DemiBold-20.vlw", 20); //creating fonts
  f2=createFont("URWBookmanL-DemiBold-50.vlw", 50);

  loadData();  //loadsthe given data below

  colours[0] = color(5,44, 255);  //sets value for colour array
  colours[1] = color(255,255,200, 50);
}



void draw () {
  background(0);
  
  
     textFont(f2);  //loads font f2
    fill(152,134,134,50);
    String title= "Birth Control Knowledge & Use in Mexican Women";  //string with title
    text(title,xmargin, 20, 900, 300); //text with string title above

  for (int s=0; s<bcontrol.length; s++) {   //for loop that will draw the bars in graph
    float baseline = 0;
    float[] stack = bcontrol[s]; 
    for (int t=0; t<stack.length; t++) { 
      fill(colours[t]);
      int rectx = xmargin + s * colspacing;
      float recty = ybase-(stack[t]*yscale)-baseline;
      int rectw = colspacing-10;
      float recth = stack[t]*yscale;
      noStroke();
      rect(rectx, recty, rectw, recth);


      if (mouseX > rectx && mouseX < rectx + rectw && mouseY < recty + recth && mouseY > recty) { //boolean for mouse rollover
        rollover = true;
        rollcolumn = s;
        rollsegment = t;
      }
    }

    baseline = -20;   
    fill(152,134,134,50);
    text(years[s+1], xmargin + s * colspacing, ybase +45);//years text in graph
  }

  if(rollover) {

    String perc_label= ""; //string for percentage labels

    if (rollsegment == 0) perc_label = "Know of";
    if (rollsegment == 1) perc_label = "Use";

    String labelstring = nf(bcontrol[rollcolumn][rollsegment],1,1) + "% " + perc_label;//labels string with formated numbers
    float labelwidth = textWidth(labelstring) + 15;

    image(icon, mouseX -75, mouseY - 35); //image 
    fill(255, 150);
    textFont(f1);                            //loads font f1
    text(labelstring, mouseX-50,mouseY-10); //labels text that follows mouse
    stroke(0);
    noFill();
  }
}

void loadData() {   
  String [] data_in = loadStrings ("con.csv");  //loading data from a csv file

  for (int i=1; i<data_in.length; i++) {  
    String[] linebits = data_in[i].split(",");  //separating the data at each comma
    for (int b=1; b<linebits.length; b++) {
      bcontrol[b-1][i-1] = float(linebits[b]);
    }
  }
  years = data_in[0].split(",");
  //println(years);
}


