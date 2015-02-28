
//use load Strings to grab the web page we are interested in
String[] s = loadStrings("http://www.wunderground.com/cgi-bin/findweather/getForecast?query=56.461428,-2.968111");

// initilise a new string variable to put the page into
String p = "";

//for every line 
for(int i=0;i<s.length;i++){
  //append the line on to the the variable p to give us one big string of page contents
  p += s[i];
}

//print out how long this big single page string is
println(p.length());

//define out marker hook or beacon that is infornt of and at the end to the element we want to scrape
String startMarker = " metric=\"&deg;C\" value=\"54\">  <span class=\"nobr\"><span class=\"b\">";
String endMarker = "</span>&nbsp;&deg;C</span>";

//find the index of the start marker (this will be the index of the first elemtn in your string)
int start = p.indexOf(startMarker);

// chop of all of the page that goes before the position of the end of the start marker
p = p.substring(start+startMarker.length(),p.length());

// now look for the end marker
int end = p.indexOf(endMarker);

//now we want to chop the page beond the end marker
String ss = p.substring(0,end);

//this leaves us with the thing we want in this case the temperature of dundee now
println(ss);

//if we want to do anything other than print this we need to convert it to a number
Float t = new Float(ss);

// the vis is a simple bulb thermomoter with no scale or anything fancy

//step one map the value from:
//    source range (for simplicity 0 - 50 degrees c)
//    destination range 0- 300 the size of my thermomoter tube
t = map(t,0,50,0,300);

//define the size of the screen
size(200,400);

////set the background colour
background(50);

//draw a white rectangle to indicate the outline of the thermometer
fill(255);
stroke(255);
rect(90,50,20,300);

//change to red
fill(255,0,0);
stroke(255,0,0);

//render a rectangle wich is the height of the mapped temperature value
rect(90, 50+300-t,20,t);


//draw an ellipse to look like the bulb
ellipse(100,350,40,40);

//this all only happens once, you could extend using the draw function to update the value

