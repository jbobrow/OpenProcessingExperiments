
PFont font;
PImage background1;
 //PImage bg2;
 //PImage bg3;
 int []avg;
 int []tsp;
 float plotX1, plotY1;
 float plotX2, plotY2;

 void setup() {
 //when using a background image it is important the screen size is the same as the image
 size(700, 600);
 String[] stuff=loadStrings("speed.txt");
 String[] stuff2=loadStrings("top.txt");
 avg=int(split(stuff[0], ','));
 tsp=int(split(stuff2[0], ','));
 // load the font wich is located in the data folder
 font = loadFont("Calibri-Bold-48.vlw");

 // set the font we are using and the size
 textFont(font, 24);

 // we want this to refreash slowly so we use a decimal
 frameRate(0.5);

 colorMode(RGB, width);
 background(86, 155, 250);
 smooth();
 plotX1=50;
 plotY1=250;
 plotX2=500;
 plotY2=500;
 }

 void draw() {

 background(86, 155, 250);

 //BBC Weather Mobile Page
 String[] page = loadStrings("http://news.bbc.co.uk/weather/mobile/forecast/2236/next24hours/");

 //print to console the number of lines
 println(page.length);

 // chop up line 118 when we see the > bracket 
 String[] bits = page[118].split(">");

 //splits the string
 bits = bits[1].split("<");
 println(bits[0]);

 //set string to a proper variable namd
 String weather = bits[0];

 weather= weather.replaceAll("&#039;", "'");


 fill(50);
 text("weather summary in Dundee: " + weather, 100, 150);
 text("(updates every 3 hours)", 100, 170);
 rectMode(CORNERS);
 fill(#ffffff); 
 noStroke();
 rect(plotX1, plotY1, plotX2, plotY2);
 // if( page[118] == "Light Rain Shower")
 // {
 // background(12,146,245);
 //}

 // if(page[118]=="Heavy rain")
 // {

 // image
 //}
 strokeWeight(20);
 stroke(#5679C1);


 /*Basically this bit of code is supposed to generate the graph. But although it's in the draw function I can't get passed the first points being generated. HELP???*/
 for (int i=0; i<avg.length; i++)
 {
 float value=avg[i];
 float y=map(value, 8, 15, plotY2, plotY1);
 point(i, y);
 }



 stroke(#d50404);
 for (int i=0; i<tsp.length; i++)
 { float value=avg[i];
 float y=map(value, 11, 17, plotY2, plotY1);
 point(i, y);

 }
 }

