
import org.gicentre.utils.stat.*;        // For chart classes.
import org.gicentre.utils.colour.*;    // For colour tables.
import java.util.Random;

// Sketch to demonstrate the use of the BarChart class to draw simple bar charts.
// Version 1.2, 14th January, 2011.
// Author Jo Wood, giCentre.

// --------------------- Sketch-wide variables ----------------------

BarChart barChart;
PFont titleFont,smallFont;
private ColourPicker colourPicker;
private ColourListener colourListener;
private int Colour;

// ------------------------ Initialisation --------------------------

// Initialises the data and bar chart.
void setup(){
  size(800,600);
  smooth();
  frame.setResizable(false);
  strokeWeight(2);
  
  // The colour picker needs to know the sketch (this) in which to draw.
  // The last two parameters define the width and height of the border around 
  // the colour picker relative to the size of this sketch.
  colourPicker = new ColourPicker(this,50,80);
  
  // The optional listener can be used to make changes as soon as a new colour is selected.
  colourListener = new ColourListener();
  colourPicker.addPickerListener(colourListener);

  
  titleFont = loadFont("Helvetica-22.vlw");
  smallFont = loadFont("Helvetica-12.vlw");
  textFont(smallFont);
  textFont(titleFont);
 

  barChart = new BarChart(this);
  barChart.setData(new float[] {4,5,5.5,6.5,7,7.75,8,8.5,8.5,9,10,10});
  barChart.setBarLabels(new String[] {"shopping","reading","cooking","scrapbooking", "tv",
                                      "animals", "art", "playing tennis", "nature","exploring", "hiking", "eating"});
  fill(Colour);
  barChart.setMinValue(0);
  barChart.setMaxValue(10); 
  
  barChart.setValueFormat("##");
  barChart.showValueAxis(true);
  barChart.showCategoryAxis(true);
  barChart.setBarGap(10);
  
  colourPicker.draw();
}

// ------------------ Processing draw --------------------

// Draws the graph in the sketch.
void draw(){
  background(255);
  
  fill(Colour);
  barChart.draw(10,10,width-20,height-20);
  
textFont(titleFont);
 text("My Personal Interests", 70,30);
  float textHeight = textAscent();
  textFont(smallFont);
  fill(0);
  text("Nicole Del Senno", 70,30+textHeight);
  barChart.setBarColour(Colour);
   colourPicker.draw();
}

// Turns the colour picker on or off with the 'c' key.
void keyPressed()
{
  if ((key == 'c') || (key == 'C'))
  {
    colourPicker.setIsActive(!colourPicker.getIsActive());
  }
}


private class ColourListener implements PickerListener{
  
  // Responds to a colour being chosen by the colour picker.
  public void colourChosen()
  {
    int pickedColour = colourPicker.getLastColour();
    if (pickedColour != Integer.MAX_VALUE)
    {
      Colour = pickedColour;
    }
  }
}

