
//Final Visualization for OpenProcessing
/*********************************
 Assignment 07
 Name: Hannah Organick
 Email: horganick@brynmawr.edu
 Course:  CS 110 - Section 02
 Submitted: 4/27/12
 
 Part II
 
 This program visualizes the 2009 HIV statistics of 147 
 countries. Each country is drawn with a small center circle at 
 it's geographical location and an overlapping bubble around
 it that is transparent.  The size of each country's bubble is
 dependent on the number of people living with HIV in that 
 country.  The color of the center and bubble is dependent 
 on the percentage of people in that country living with HIV. 
 
 Higher percentages (1-25+%) are drawn on a yellow to red scale
 with red being for the highest percentages.  Lower percentages 
 (below 1%) are drawn on a green to yellow scale with yellow being
 for the percentages closer to 1.  This coloring scheme is drawn 
 in a legend on the top right of the sketch window.
 
 Interactions for the countries depend on hovering/clicking on
 the center of the circle (which is only a few pixels in diameter).
 This was done because the bubbles for each country overlap.  If 
 the interactions were based off of the bubble diameters, then 
 the statistics for more than one country would be printed in the same
 spot, making both statistics illegible. 
 
 Interactions- mouseOver, mousePressed
 When the mouse is over the center of a circle, the country's 
 statistics are printed at the bottom right of the sketch window
 and the country's bubble is brightened.  
 
 When the mouse is over the bubble of a legend circle, its legend
 text is brightened. 
 
 When the mouse is pressed over the center of a country circle,
 the country's statistics are printed in a readable sentence in 
 the processing console.  This allows for easy comparison of 
 countries. 
 
 
 Data from gapminder.org, 2009 data based on UNAIDS.  
 "Adults with HIV (%, age 15-49)"
 "People living with HIV (number, all ages)"
 **********************************/
String[] data;
Item[] items;
void setup() {
  size(1100, 600);
  background(0);
  //Load data from file as an array of strings.

  //Each string consists of: a country, the percent of
  //the population living with HIV in that country, the 
  //number of people that make up this percent, an X and
  //Y geographical location, and the number of people 
  //with apostraphes in the place of comma marks.  
  data = loadStrings("MasterDataFinal7.csv");
  //Create an array of items the same length as the data.  
  items = new Item[data.length];

  //Fill array with new items, inputting information from 
  //data array.  
  for (int i=0; i<data.length; i++) {
    items[i] = new Item(data[i]);
  }

  //Prints Data in sentences to the processing console
  //for (int i=0; i<147; i++) {
  // println(items[i].pr()); 
  //}
}


