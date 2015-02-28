
//map - background for our visualisation
PImage euMap;

//Buttons at info pages
PImage homeButton;
PImage phraseButton;
PImage infoButton;
//defining a radius for a button
int r = 50; 

//setting if map is active at the moment
boolean mapActivity = true;

//number of countries on the map
int num = 10;
//creating an array of countries
Country [] countries = new Country[num];

//Array containing English phrases to be contained within dictionary
String [] eng;

void setup() 
{
  background(255);
  size(896, 717);
  //load the background image
  euMap = loadImage("map.jpg");
  //load the image for home button
  homeButton = loadImage("homebutton-uk.png");
  
  //load the image for dictionary button
  phraseButton = loadImage("phrases.png");
  //load the image for info button
  infoButton = loadImage("info.png");
  
  //load english phrases for dictionary from a file
  eng = loadStrings("english.txt");
  
  //Fill in the country array with countries
  //Finlad
  countries[0] = new Country(470, 90, loadImage("finland.png"), false, loadStrings("finland.txt"), loadStrings("finnish.txt"));
  //France
  countries[1] = new Country(170, 425, loadImage("france.png"), false, loadStrings("france.txt"), loadStrings("french.txt"));
  //Germany
  countries[2] = new Country(290, 340, loadImage("germany.png"), false, loadStrings("germany.txt"), loadStrings("german.txt"));
  //Greece
  countries[3] = new Country(550, 600, loadImage("greece-small.png"), true, loadStrings("greece.txt"), loadStrings("greek.txt"));
  //Italy
  countries[4] = new Country(355, 540, loadImage("italy.png"), false, loadStrings("italy.txt"), loadStrings("italian.txt"));
  //Poland
  countries[5] = new Country(425, 305, loadImage("poland.png"), false, loadStrings("poland.txt"), loadStrings("polish.txt"));
  //Portugal
  countries[6] = new Country(20, 550, loadImage("portugal-small.png"), true, loadStrings("portugal.txt"), loadStrings("portugese.txt"));
  //Romania
  countries[7] = new Country(525, 435, loadImage("romania.png"), false, loadStrings("romania.txt"), loadStrings("romanian.txt"));
  //Spain
  countries[8] = new Country(70, 535, loadImage("spain.png"), false, loadStrings("spain.txt"), loadStrings("spanish.txt"));
  //Sweden
  countries[9] = new Country(370, 170, loadImage("sweden.png"), false, loadStrings("sweden.txt"), loadStrings("swedish.txt"));
}

void draw()
{
  //put map on screen
  image(euMap, 0, 0);
  
  
  //Two separate loops for drawing and pressing the buttons sot that the two functions don't interfere with each other 
  
  //a loop to draw buttons around the map
  for (int i=0; i<num; i++)
  {
    countries[i].drawButton();
  }
  // a loop starting mechanism after pressing the button
  for (int i=0; i<num; i++)
  {
    countries[i].pressButton();
  }
  
}


class Country
{
  int x; 
  int y; // ^ coordinates of a country on a map
  PImage flag; // button for the country uses its flag
  boolean small; // determine a size of a button from two available: small/big
  String [] info; // array of information about a country (to be loaded from a file)
  String [] transl; // array of translated phrases for a ditionary (to be loaded from a file)
  
  //booleans to manage what has to be currently visible on screen
  boolean window = false; //determine if window is on
  // determine content of the window
  boolean displayInfo = false;
  boolean displayDict = false;
  
  Country(int xTmp, int yTmp, PImage flagTmp, boolean smallTmp, String [] infoTmp, String [] translTmp)
  {
    //the constructor takes variables passed in setup
    x = xTmp;
    y = yTmp;
    flag = flagTmp;
    small = smallTmp;
    info = infoTmp;
    transl = translTmp;
  }

//method to put flags/buttons in appropriate place  
  void drawButton()
  {
    image(flag, x, y);  
  }
 
//method to manage mechanism  after pressing the flag button
  void pressButton()
  {
    //set the size of clickable area based on taken 'small' value
    int radius;
    if(small)
    {
      radius = 25;
    }
    else
    {
      radius = 50;
    }
    
    
    if(mapActivity)
    {
      //if map is active check for country buttons
      if (mousePressed && dist(mouseX, mouseY, x+radius, y+radius) < radius)
      {
        //if button clicked
        window = true; // display window
        displayInfo = true; //put info in the window
        mapActivity = false; //deactivate map
      }
    }
 
 //if window was set to be true, show pop-up window
    if(window)
    {
      drawWindow();
    }
  }

//method to draw pop-up window  
  void drawWindow()
  {
      //make the window white, slightly transparent
      fill(255, 240);
      //draw the rectangle - background for the window
      rect(20, 20, 850, 675, 10);
      //setting coordinates for home button
      int xHome = 750;
      int yHome = 50;
      //draw the home button
      image(homeButton, xHome, yHome);
      
      //if you click the home button make the window invisible and activate map
      if (mousePressed && dist(mouseX, mouseY, xHome+r, yHome+r) < r)
      {
       //rect(30, 20, 55, 55, 7);
        window = false;
        mapActivity = true;
        displayDict = false;
      }
      
      //variables to workout coordinates for info and phrases buttons
      int level = 80;
      int space = 25;
      int xDict = 2*level+space;
      int xInf = level;
      int yBut = yHome+(2*space);
      
      //put info and phrases buttons in the window
      image(phraseButton, xDict-r, yBut/2);
      image(infoButton, xInf-r, yBut/2);
      
      //Manage the window's content  
      if (displayInfo)
      {
        //if info is currently to be diplayed - put it as a content of the window
        putInfo();
        //show tha the Info is inactive...
        noStroke();
        //... by putting a semi transparent circle around the button
        fill(255, 200);   
        ellipse(xInf, yBut, 100, 100);
        if (mousePressed && dist(mouseX, mouseY, xDict, yBut) < 50)
        {
          //if you press dictionary button change content from info to dictionary
          displayInfo = false;
          displayDict = true;
        }
      }
      if (displayDict)
      {
        //if dictionary is currently to be diplayed - put it as a content of the window
        putDictionary();
        //show that the Dictionary button is inactive...
        noStroke();
        //... by putting a semi transparent circle around the button
        fill(255, 200);
        ellipse(xDict, yBut, 100, 100);
        if (mousePressed && dist(mouseX, mouseY, xInf, yBut) < 50)
        {
          //if you press info button change content from dictionary to info
          displayInfo = true;
          displayDict = false;
        }
      }
  }
  
  void putInfo(){    
    
    //coordinates for title
      int xTitle = 560;
      int yTitle = 150;
      fill(0);
      //settings for title
      textSize(70);
      textAlign(RIGHT);
      //the first line in file is the title - put it on screen
      text(info[0], xTitle, yTitle);
      
      //starting coordinates for the rest of the text
      int xText = 440;
      int yText = 250;
      //size of the textline
      int lineSize = 60;
      //setting size for the rest of the text
      textSize(40);
      
      //the template - put headings aligned to the right
      textAlign(RIGHT);
      text("Population: ", xText, yText);
      text("Currency: ", xText, yText+lineSize);
      text("Currency rate: ", xText, yText+(2*lineSize));
      text("Language: ", xText, yText+(3*lineSize));
      
      //put info from textfile next to headings
      textAlign(LEFT);
      for(int i = 1; i < (info.length-2); i++){
        text(info[i], xText, yText+((i-1)*lineSize));
      }
      
      //The info about popular languages is centered and separated from the rest
      textAlign(CENTER);
      text("Popular foreign languages: ", xText, yText+(4*lineSize));
      text(info[(info.length)-2], xText, yText+(5*lineSize));
      text(info[(info.length)-1], xText, yText+(6*lineSize));
      
      
  }
      
void putDictionary()
  {
     fill(0); 
     //Sets textsize for the title
     textSize(40);
     text(transl[transl.length-1], 300, 105);
     
     //variables used in spacing of the text
     int gap =  25;
     int vertical1 = 60;
     int vertical2 = 445;
     int row = 160;
     
     //how many short phrases are there n a file - separates dictionary into two sections
     int shortPhraseLines = 8; 
    
     //Textsize for the text in the main body
     textSize(22);
     //Aligns te text to the right
     textAlign(RIGHT);
     
     //Goes through the loop and adds each english short phrases to the screen
     for (int i=0; i<shortPhraseLines; i++)
     {
        text(eng[i], vertical2, row+(i*gap));
     }
     
     //Aligns the text to the left
     textAlign(LEFT);
     //Goes through the loop and adds the translation for short phrases
     for (int i=0; i<shortPhraseLines; i++)
     {
       text(transl[i], vertical2, row+(i*gap));
     }
 
 
     //Puts english long phrases on screen
      for (int i=shortPhraseLines; i<eng.length; i++)
      {
        text(eng[i], vertical1, row+(i*gap));
      }
      //Puts translated long phrases on screen
      for (int i=shortPhraseLines; i<(transl.length - 1); i++)
      {
        text(transl[i], vertical2, row+(i*gap));
      }
   }
  
}


