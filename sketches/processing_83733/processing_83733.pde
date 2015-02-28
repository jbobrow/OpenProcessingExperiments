
/*
 THE SETUP
 This is the setup tab
 Here we import all libraries, declare all variables and load all the necessary images and files 
 in the setup function
 */

// import Ani library for animated transitions
// library by Benedikt Groß available at http://www.looksgood.de/libraries/Ani/
import de.looksgood.ani.*;

//import Unfolding Map library for geolocalization of data
// library by Till Nagel available at http://unfoldingmaps.org/
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.*;
// declaration of Unfolding Map objects
UnfoldingMap map;
SimplePointMarker myMarker;

// import the toxi math library to map the data
// library by Karsten “toxi” Schmidt available at http://toxiclibs.org/downloads/
import toxi.math.*;

// lists of countries and single datas
// we fill these lists in the import while reading the text file
List<Country> countries = new ArrayList<Country>();
List<DataItem> dataItems  = new ArrayList<DataItem>();

//variables used to store data from the selected country and year
// they are used to understan which data to pass to the relative graphic objects
//when the program start, it analize the data of 2010
int selectedYear = 2010;
String selectedCountryId = " "; //empty at beginning
String selectedCountryName = " "; // empty at beginning
int selectedCountryTotal; // will store to total number of incoming or outgoing for the selected country

////////////
// fonts and images for the main
PFont paragraphFont;
//variable for the text
PFont currentYearText;
PImage bg;
// cover image
PImage intro;
// state of the application. starts at 0 and the cover is displayed
int state=0;
////////////////

///////////////
// declaration of the lists for the graphics
// list that will store the bar graph
ArrayList bars = new ArrayList();
// coordinates of the bar graph 
int y =40;
int step= 20;
// lists for the incoming and outgoing circular graph
ArrayList ballsIn = new ArrayList();
ArrayList ballsOut = new ArrayList();
// coordinates for creation of the balls graph for incoming and outgoing
float xIn, xOut;
float yIn, yOut;
// variable that increments the x and the y of the right diagram to move it in the right positon
int h=680;
//boolean value that avoids the circles display at beginning
boolean toggleBallsDisplay=false;
//////////////////

//////////
// declaration of data used for the slider animation
//variable that look for the colour
int targetColorSlider;
//Images for the slider and for the colour detection
PImage slider;
PImage fakeSlider;
//variable for the movement of the slider
int ySlider = 60;
//state = 0 indicate the NO MOVEMENT STATE OF THE SLIDER
int stateSlider= 0;
//variables that determine the opacity of text
int opacity04 = 0;
int opacity05 = 0;
int opacity06 = 0;
int opacity07 = 0;
int opacity08 = 0;
int opacity09 = 0;
int opacity10 = 0;
////////////////////

// BEGIN SETUP
void setup() {
  size(1280, 768 );
  smooth();

  // you have to call always Ani.init() first!
  Ani.init(this);

  // load unfolding map paramethers
  map = new de.fhpotsdam.unfolding.Map(this);
  map.zoomToLevel(4);
  map.panTo(new Location(50.09547, 41.0958));

  fakeSlider = loadImage("fakeSlider.png");
  slider = loadImage("barra_alzata.png");
  intro = loadImage("intro.png");
  bg = loadImage ("back.png");

  //load the font
  currentYearText = loadFont("Gotham-Medium-20.vlw");
  paragraphFont = loadFont("GothamRounded-Book-20.vlw");

  // import datas from the txts
  loadCountries();
  for (int year = 2004; year < 2011; year++) {
    loadData(year);
  }

  // example for loop to interrogate data from txt
  // German students going abroad?
  String fromCountryID = "DE";
  int fromCountryYear = 2010; 
  // go through all countries
  for (Country country : countries) {
    // for each country go through all the dataitems
    for (DataItem dataItem : dataItems) {
      // dataitems have three parameter (year, from country and to country)
      // if the year matches
      if (dataItem.year == fromCountryYear 
        // if the fromCountry matches the country we are looking for
      && dataItem.fromCountry.id.equals(fromCountryID) 
        // and the toCountry equals the country you are now in the loop
      && dataItem.toCountry.id.equals(country.id)) {
        println("From DE to " + country.id + ": " + dataItem.number);
      }
    }
  }
}// END SETUP


void calculateTotals(int year) {
  for (Country country : countries) {

    int totalIncoming = 0;
    int totalOutgoing = 0;

    for (DataItem dataItem : dataItems) {

      if (dataItem.year == year) {

        // GR == Gr
        if (dataItem.fromCountry == country) {
          totalOutgoing += dataItem.number;
        }
        if (dataItem.toCountry == country) {
          totalIncoming += dataItem.number;
        }
      }
    }

    country.totalIncoming = totalIncoming;
    country.totalOutgoing = totalOutgoing;
  }
}





void draw() {

  int yText = 742 + ySlider;

  //println("selectedCountryId: " + selectedCountryId);


  // Location location = map.getLocation(width/2,height/2);
  // println(location.getLat()+ " , " +location.getLon());
  //
  background(255);
  map.updateMap();

  image(bg, 0, 0);

  //schermata iniziale
  if (state==0) {
    image(intro, 0, 0);
    textFont(paragraphFont, 10);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    text( "Press 1", 0, height/2+ 100, width, 100);
    textSize(12);
    //text( "Ornella Giau, Luca Migliore, Ricardo Tamagno", 0, height/2 + 50, width, 100);
  }
  else {

    background(255);
    textSize(10);


    textFont(paragraphFont, 10);

    // With an array, we say tweet.length. With an ArrayList, 
    // we say tweets.size(). The length of an ArrayList is dynamic. 
    // Notice how we are looping through the ArrayList backwards.
    // This is because we are deleting elements from the list.
    for (int i = bars.size()-1; i >= 0; i--) { 
      // An ArrayList doesn't know what it is storing,
      // so we have to cast the object coming out.
      Bar myBar = (Bar) bars.get(i);
      myBar.display();
      myBar.update();

      if ( i==0) {

        drawLegend();
      }
    }

    for (Country country : countries) { // host country

      if ( selectedCountryId.equals(country.id)) {
        Location countryLocation= new Location(country.lat, country.lon);
        myMarker = new SimplePointMarker(countryLocation);
        ScreenPosition myPos = myMarker.getScreenPosition(map);
        xIn= myPos.x;
        yIn = myPos.y;
        xOut= myPos.x+h;
        yOut = myPos.y;
        // println(selectedCountryId);
        fill(0);
        stroke(255, 100);
        ellipse( xIn, yIn, 10, 10);
        ellipse( xOut, yOut, 10, 10);
        fill(0, 200);
        //text(country.name, xIn,yIn+20);
      }
    }
    if (toggleBallsDisplay==true) {
      for (int i = ballsIn.size()-1; i >= 0; i--) { 
        // An ArrayList doesn't know what it is storing,
        // so we have to cast the object coming out.
        Ball myBall = (Ball) ballsIn.get(i);
        noFill();
        stroke(0, 20);
        //drawConnection(0, 200);
        bezier(xIn, yIn, xIn, yIn-60, myBall.myX, myBall.myY-60, myBall.myX, myBall.myY);
        //line(xIn,yIn,myBall.myX,myBall.myY);
        myBall.display();
        // myBar.update();
      }


      for (int i = ballsOut.size()-1; i >= 0; i--) { 
        // An ArrayList doesn't know what it is storing,
        // so we have to cast the object coming out.
        Ball myBall = (Ball) ballsOut.get(i);
        noFill();
        stroke(0, 20);
        //drawConnection(0, 200);
        bezier(xOut, yOut, xOut, yOut-60, myBall.myX, myBall.myY-60, myBall.myX, myBall.myY);
        //line(xIn,yIn,myBall.myX,myBall.myY);
        myBall.display();
        // myBar.update();
      }
    }

    // image(fakeSlider, 0, ySlider);
    //image(slider, 0, ySlider);
    drawInterface();
  }
}



// tracking of mouse for hover effect
void mouseMoved() {

  for (int i = bars.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing,
    // so we have to cast the object coming out.
    Bar myBar = (Bar) bars.get(i);
    myBar.checkMouseOver(mouseX, mouseY);
  }
}

void mouseClicked() {
  background(255);
  image(bg, 0, 0);
  drawBars();
  println("sdfghj");
  // pass variable to bars
  for (int i = bars.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing,
    // so we have to cast the object coming out.
    Bar myBar = (Bar) bars.get(i);
    if (myBar.checkMouseClicked(mouseX, mouseY) == true) {
      toggleBallsDisplay=true;
      selectedCountryId = myBar.getId();
      //println( "selectedCountryId " + selectedCountryId);
      selectedCountryName = myBar.myName;
      selectedCountryTotal = myBar. myValIn;
    }
  }

  //println("clicked " + selectedCountryId);


  // pass values to ballsOut
  for (int j = ballsOut.size()-1; j >= 0; j--) {

    Ball myBall = (Ball) ballsOut.get(j);

    myBall.myIdTo= selectedCountryId;
    //println( myBall.myIdTo);
    myBall.myNameTo= selectedCountryName;
    myBall.expectedMaxValue = selectedCountryTotal;

    // selected country students coming in?
    // String fromCountryID = selectedCountryId;
    //int fromCountryYear = selectedYear; 

    // the loop
    for (DataItem dataItem : dataItems) {
      if (dataItem.year == selectedYear && dataItem.fromCountry.id.equals(selectedCountryId)
        && dataItem.toCountry.id.equals(myBall.myIdFrom)) {

        if (!dataItem.toCountry.id.equals(selectedCountryId)) {

          myBall.targetSize=dataItem.number;
          myBall.selected = false;

          myBall.expectedMaxValue = dataItem.fromCountry.totalOutgoing;
          println(myBall.expectedMaxValue + " to " + myBall.myIdTo );
        }

        else {
          myBall.targetSize=0;
          myBall.selected = true;
        }
      }
    }
  }



  for (int j = ballsIn.size()-1; j >= 0; j--) {

    Ball myBall = (Ball) ballsIn.get(j);

    myBall.myIdTo= selectedCountryId;
    //println( myBall.myIdTo);
    myBall.myNameTo= selectedCountryName;
    myBall.expectedMaxValue = selectedCountryTotal;



    // selected country students coming in?
    // String fromCountryID = selectedCountryId;
    //int fromCountryYear = selectedYear; 


    for (DataItem dataItem : dataItems) {
      if (dataItem.year == selectedYear && dataItem.toCountry.id.equals(selectedCountryId)
        && dataItem.fromCountry.id.equals(myBall.myIdFrom)) {

        if (!dataItem.fromCountry.id.equals(selectedCountryId)) {

          myBall.targetSize=dataItem.number;
          myBall.selected = false;

          myBall.expectedMaxValue = dataItem.toCountry.totalIncoming;
          //println(myBall.expectedMaxValue + " to " + myBall.myIdTo );
        }

        else {
          myBall.targetSize=0;
          myBall.selected = true;
        }
      }
    }
  }
}

void setBallList(int year) {
  // German students going abroad?
  //String fromCountryID = selectedCountryId;
  //String fromCountryName = selectedCountryName; 
  int theYear= year;
  for (Country country : countries) {

    //for (DataItem dataItem : dataItems) {
    Location location = new Location (country.lat, country.lon);
    myMarker = new SimplePointMarker(location);
    ScreenPosition myPos = myMarker.getScreenPosition(map);
    float x= myPos.x;
    float y = myPos.y;

    // if (dataItem.year == year && dataItem.fromCountry.id.equals(fromCountryID) && dataItem.toCountry.id.equals(country.id)) {
    //selectedCountryTotal = country.totalIncoming; 
    Ball ballIn = new Ball (x, y, selectedCountryId, selectedCountryName, country.id, country.name, 0, 0, color(0, 170, 255));
    // y+= step;
    ballsIn.add(ballIn);

    ballIn = new Ball (x+h, y, selectedCountryId, selectedCountryName, country.id, country.name, 0, 0, color(255, 29, 29));
    // y+= step;
    ballsOut.add(ballIn);

    //println("From " + country.id  + " to " + selectedCountryId + ": " + dataItem.number);
    //println(selectedCountryId + " total incoming "+ selectedCountryTotal);
    //}
    // }
  }
}


