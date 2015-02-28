

/// stacked area graph

float[][] livestock; // 2d array
int xmargin = 70;
int colspacing = 60;
int ybase = 400;
float yscale = 0.08;

int rollcolumn = 0;
int rollsegment = 0;
boolean rollover = false;


String[] labels; // = new String[9];

color[] colours = new color[3];

float graph_height = 300;


void setup() {
  size(600,500);
  livestock = new float[3][3];
  labels = new String[3];
  loadData();

  colours[0] = color(255,200,100);
  colours[1] = color(255,150,30);
  colours[2] = color(255,240,0);
}



void draw() {

  background(255);
  rollover = false;
  for (int s=0; s<livestock.length; s++) {
    float baseline = 0;
    float[] stack = livestock[s]; // this stack of the data
    for (int t=0; t<stack.length; t++) { 
      fill(colours[t]);
      int rectx = xmargin + s * colspacing;
      float recty = ybase-(stack[t]*yscale)-baseline;
      int rectw = colspacing-20;
      float recth = stack[t]*yscale;
      rect(rectx, recty, rectw, recth);

      if (mouseX > rectx && mouseX < rectx + rectw && mouseY < recty + recth && mouseY > recty) {
        rollover = true;
        rollcolumn = s;
        rollsegment = t;
      } 

      baseline += (stack[t]*yscale); // add the last rect to the stack
    }
    fill(0);
    text(labels[s+1], xmargin + s * colspacing, ybase + 30);
  }

  if (rollover){ // we have a rollover, let's draw it

    String numbike_label = "";
    if (rollsegment == 0) numbike_label = "cattle";
    if (rollsegment == 1) numbike_label = "calves";
    if (rollsegment == 2) numbike_label = "sheep";

    String labelstring = nf(livestock[rollcolumn][rollsegment],1,1) + "  - " + numbike_label;
    float labelwidth = textWidth(labelstring) + 15;
    fill(255,200);
    noStroke();
    rect( mouseX - 5 , mouseY - 25, labelwidth, 20);
    fill(0);
    
    text( labelstring , mouseX,mouseY -10);
    stroke(0);
  }
  
  fill(0);
text("cattle",540, 90);
  fill(255,200,100);
rect(518,91,20,20);
fill(0);
text("calves",520, 70);
  fill(255,150,30);
rect(500,71,20,20);
fill(0);
text("sheep",500, 50);
  fill(255,240,0);
rect(482,51,20,20);
fill(0);
text("Estimated Slaughter",480, 30);
  
  
}

void loadData() {

  String[] data_in = loadStrings("bike_ownership.csv");

  for (int i=1; i<data_in.length; i++) {
    String[] linebits = data_in[i].split(",");
    for (int b=1; b<linebits.length; b++) {
      livestock[b-1][i-1] = float (linebits[b]);
    }
  }

  labels = data_in[0].split(",");
  println(labels);
}

