
// Declare Header Font
PFont h1;

//Declare Label Font
PFont l1;

void setup() {
   size(800, 600);
   smooth();
   //Use system font 'Arial' as the header font with 12 point type
   h1 = createFont("Arial", 12, false);
   //Use system font 'Arial' as the label font with 9 point type
   l1 = createFont("Arial", 9, false);
}

void draw() {
   //Set Background to white.
   background(255);
   //Call barchart function. Variables are: Filename(1 Row CSV Format), Y Position of chart, X Position of chart, Chart Height, Chart Width, Column Red Amount, Column Green Amount, Column Blue Amount, Column Alpha Amount, Label Placement (1 for below columns, 0 for above columns) 
   barchart("numbers1.csv", 150, 50, 125, 300, 10, 110, 75, 255, 0);
   barchart("numbers2.csv", 150, 400, 125, 300, 145, 32, 175, 255, 0);
   barchart("numbers3.csv", 500, 50, 300, 700, 45, 76, 220, 255, 1);
}

void barchart(String filename,float yf1, float xf1, float yscale, float xscale, int r1, int g1, int b1, int a1, int labelplacement) {
   //Declare a float variabe for the max y axis value.
   float ymax;
   
   //Declare a float variable for the minimum y axis value.
   float ymin = 0;
   
   //Set the stroke color to a medium gray for the axis lines.
   stroke(175);
   
   //draw the axis lines.
   line(xf1-3,yf1+2,xf1+xscale,yf1+2);
   line(xf1-3,yf1+2,xf1-3,yf1-yscale);
   
   //turn off strokes for the bar charts.
   noStroke();
   
   //loop the chart drawing once.
   for (int c1 = 0; c1 < 1; c1++){
   
   //Set the start x point value.
   float xfstart = xf1;  
   
   //Load the file.
   String[] lines = loadStrings(filename);
   
   //Count the number of rows in the file.
   for (int i = 0; i < lines.length; i++) {
     
     //For each line split values separated by columns into pieces.
     String[] pieces = split(lines[i], ',');
     
     //Set the max Y axis value to be 10 greater than the max value in the pieces array.
     ymax = max(int(pieces)) + 10;
     
     //Count the number of pieces in the array.
     float xcount = pieces.length;
     
     //Draw the minimum and maximum Y Axis labels. 
     textFont(h1);
     fill (100);
     textAlign(RIGHT, CENTER);
     text(int(ymax), xf1-8, yf1-yscale);
     text(int(ymin), xf1-8, yf1);
     
     //Draw each column in the data series.
     for (int i2 = 0; i2 < xcount; i2++) {
       
       //Get the column value and set it has the height.
       float yheight = int(pieces[i2]);
       
       //Declare the variables to hold column height as scaled to the y axis.     
       float ypct;
       float ysclhght;
       
       //calculate the scale of given the height of the chart.
       ypct = yheight / ymax;
       
       //Calculate the scale height of the column given the height of the chart.
       ysclhght = yscale * ypct;
       
       //If the column height exceeds the chart height than truncate it to the max value possible.
       if(ysclhght > yscale){
         ysclhght = yscale;
       }
       
       //Determine the width of the column placeholders on the X axis.
       float xcolumns = xscale / xcount;
       
       //Set the width of the columns to 5 pixels less than the column placeholders.
       float xwidth = xcolumns - 5;
       
       //Set the fill color of the columns.
       fill (r1,g1,b1,a1);
       
       //Draw the columns to scale.
       quad(xf1, yf1, xf1, yf1-ysclhght, xf1 + xwidth, yf1-ysclhght, xf1 + xwidth, yf1);
       
       //Draw the labels.
       textFont(l1);
       textAlign(CENTER, CENTER);
       fill (100);
       
       //Decide where the labels will be placed.
       if (labelplacement < 1) {
       //Above the columns.
       text(pieces[i2], xf1 + (xwidth / 2), yf1 - (ysclhght + 8));
       } else {
         //Below the columns.
         text(pieces[i2], xf1 + (xwidth / 2), yf1 + 8);
       }
       //increment the x point at which to draw a column.
       xf1 = xf1 + xcolumns;
       }
    }
  //Reset the draw point the original X value to prevent infinite redrawing to the right of the chart.  
  xf1 = xfstart;
  }
}

