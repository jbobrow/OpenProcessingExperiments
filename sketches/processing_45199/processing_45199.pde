
//Causes of death based on data from 2010. CBS.nl
//Made by Stefan Hesselman. Special thanks to Ben Fry's sample code to acquiring external data and drawing pie charts.
//The data that is visualized originates from cbs.nl. Based on the causes of death in 2010.

// Declarations.
Table locationTable;
int rowCount;
float infection,newdevelop,mental,cardio,muscle,airway,genetic,external;
int clr = 5; 
int row = 0;
PFont f;

//Setup document.
void setup() {
  size(640, 480);
  background(255);
  smooth(); //Ensure the pie chart becomes smooth and less pixelated.
  noStroke();
  
  f = createFont("Myriad Pro",12,true); //Insert a new font to explain the segments.
  
  locationTable = new Table("temp.tsv"); //Location for the external data.
  rowCount = locationTable.getRowCount(); //Gathering data for each row in numbers.

    infection = locationTable.getFloat( row, 1);
    newdevelop = locationTable.getFloat( row, 2);
    mental = locationTable.getFloat( row, 3);
    cardio  = locationTable.getFloat( row, 4);
    muscle = locationTable.getFloat( row, 5);
    airway = locationTable.getFloat( row, 6);
    genetic = locationTable.getFloat( row, 7);
    external = locationTable.getFloat( row, 8);
    
   //Declare a void where the pie chart will be visualized.
  drawChart();
}
void draw() {
  textFont(f); //Load the font we specified in setup.
  fill(RGB,125,195); //Apply font color.
  
  //Visualize the text for each segment with fixed positions.
  text("Infectieziekten. (2104 cases).",10,175);
  text("nieuwvorming. (43516 cases).", 130, 430);
  text("Ziekte a/d luchtwegen. (13016 cases).", 445,380);
  text("Hart- en vaatziekten. (39009 cases).", 30,90);
  text("Uitwendige oorzaken. (5748 cases).", 10, 300);
  text("Genetische afwijkingen. (452 cases).", 10, 250);
  text("Psychische stoornis. (7617 cases).", 445, 250);
  text("Spierziekten. (877 cases).", 500, 170);
  text("Andere ziekten.", 400, 100);
}

void drawChart() {
  float diameter = min(width, height) * 0.75; //Specifies the diameter of the pie chart minus 25%.
  float[] value = {infection,newdevelop,mental,cardio,muscle,airway,genetic,external}; //Array acquires all the data from what we loaded.
  float total = (infection+newdevelop+mental+cardio+muscle+airway+genetic+external); //Summarizes everything to what's been loaded and needed to draw the pie chart.
  float lastAng = 0; //The last segment is the closer. After making a 360 it returns to zero.                          
 
  for (int i = 0; i < value.length; i++){ //Starts counting. For each seperate piece of data, a proportional segment is created.      
    fill(clr,255);                         
    float angle = (value[i]/total*360);        
    arc(width/2, height/2, diameter, diameter, lastAng, lastAng+radians(angle)*2); 
    lastAng += lastAng+radians(angle); //The Last segment of the chart are all miscallineous diseases.
    clr += 30; //Counts up the color based on the RGB index. This influences the appearance of the pie chart based on the color it was preset to.  
  }
}


