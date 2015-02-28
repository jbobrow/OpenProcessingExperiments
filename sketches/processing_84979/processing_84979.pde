
// Initialising & Defining Global Variables:

// Imports files neccessary for Processing to use videos within the project. 
import processing.video.*;

// Eurovision (object) contains all the Regions (array) within the class EUMap.
EUMap Eurovision;

// Font variable of type PFont which allows changing the default, basic (sans-serif) font of the text.
PFont font;

// Integer variable that is used to change the mouse cursor displayed within the project.
// It is initialised at the beginning of the draw() method with the value ARROW
// and during the draw() method its value could be changed 
// (e.g. if the mouse is over a hyperlink then cursorMode is set as HAND)
// Only at the end of the method draw() , the cursor will be changed in the mode saved in cursorMode.
int cursorMode;

// If statusMode = true; then the 'Map with Live Countries Status' is displayed.
// If statusMode = false; then 'Default Map with Regions' remains/is displayed.
// This is operated via. the Top-left 'button' situated only on the main-screen page.
boolean statusMode = false;
// If backgroundMode = false; then the Default image of the European Map is used as the background (Default.png).
// If backgroundMode = true; then the background used is 'AllRegions.png'.
// This is operated via. the Top-right 'button' sitatued only on the main-screen page.
boolean backgroundMode = false; 

// Image variables used as the background for the application.
PImage defaultMainScreen;
PImage allRegions;

// ###########################################################################################
// All processes to be done initially (once) within the project.
void setup() {  
  // Load background images.
  allRegions = loadImage("images/AllRegions.png");
  defaultMainScreen = loadImage("images/Default.png");
  
  // Defining & using default font-type for text.
  font = loadFont("GillSansMT-Bold-60.vlw");
  textFont(font);
    
  // Size of sketch window:
  // 800px x 100px = header area. 
  // 800px x 600px = main menu area (directly below).
  // P2D = 'Processing 2D' which is the Renderer needed for my project to operate the video processes required.
  size(800,700,P2D);      
        
  // Creates the object Eurovision.
  Eurovision = new EUMap();
  // Prints messages on the screen (to be set as true only during development & debugging/testing).
  Eurovision.OK2Print = false;
  // Sets the boolean attribute to skip movie files = true (needed if crashes occur).
  Eurovision.skipVideos = true;
  // Setting the default image (Main Menu) for the sketch window.
  Eurovision.mainScreen = defaultMainScreen;
  // Adds all the regions to the Eurovision object.
  Eurovision.addAllEurovisionRegions(this);
  }

// ###########################################################################################  
// Processes to be done continuously (dynamically) during the applet's running.
void draw() {  
  // Sets cursor mode as ARROW.
  cursorMode = ARROW;
  
  //Draws the rectangle at the top of the project window for Header Info & main buttons display
  noStroke();
  fill(255);
  rect(0,0,800,100);
  
  // Border of project & header rectangle
  smooth();      
  stroke(150);  
  strokeWeight(5);
  noFill();    
  // Smooth, Medium-thick, Grey rectangle border around project header
  rect(0,0,800,100);

  // Store selected region and country as variables.
  int r = Eurovision.selectedRegion;
  int c = Eurovision.selectedCountry;
  
  // Displays the current region & country.
  if (Eurovision.OK2Print) {
    String message = "";
    if (r!=-1) {
      //message += "Current region: " + Eurovision.regions[r].name;
    }
    if (r!=-1 && c!=-1) {
      //message += ", Current country: " + Eurovision.regions[r].countries[c].name;
    }
    if (!message.isEmpty()) {
      println(message);
    }
  }
  
  // If no region is selected then displays the main-screen.
  if (r==-1) {      
      // Draw Live Data Country Status switch button:
      fill(150);
      noStroke();
      rectMode(CORNERS);
      rect(15,10,145,90);
      
      textAlign(CENTER,TOP);
      textSize(26);
      fill(255);
      text("Status",15,17.5,145,90);
      
      textSize(26);
      text("Mode:",15,40,145,90);
      
      // Displays title
      displayTitle("Eurovision 2013: Progress");
      
     // Background switch button:
      fill(150);
      noStroke();
      rect(655,10,785,90);
        
      textAlign(CENTER,TOP);
      textSize(20);
      fill(255);
      text("Background",652.5,22.5,785,90);

      textSize(18);
      text(" Map Change:",647.5,44,785,90);
      
      // The Background switch button is OFF or ON.  
      if(backgroundMode == false) {
        textSize(26);
        textAlign(LEFT,BOTTOM);
        fill(225,0,0);
        text("OFF",665,17.5,785,90);
        Eurovision.mainScreen = defaultMainScreen;
      } else {
        textSize(26);        
        textAlign(RIGHT,BOTTOM);
        fill(0,225,0);
        text("ON",670,17.5,775,90);
        image(allRegions,0,100);
        Eurovision.mainScreen = allRegions;
      }
      
      // The Live Status Countries switch button is OFF or ON.
      if (statusMode == false) {
        // If it's off then displays the regions map.
        textSize(26);
        textAlign(LEFT,BOTTOM);
        fill(225,0,0);
        text("OFF",25,17.5,145,90);
        
        // Calls the method 'display' of the Eurovision object
        Eurovision.display();
      
        // If mouseX and mouseY are over a region (ellipse button) then it will activate that region.
        // activate = highlight the map of the rollover-ed region.
        Eurovision.checkActivate();  
      } else {
        // The Live Status Countries switch is ON.
        textSize(26);
        textAlign(RIGHT,BOTTOM);
        fill(0,225,0);
        text("ON",25,17.5,135,90);
        
        // Displays the countries' statuses.
        Eurovision.displayStatus();
      }
  } else
  // If a region was clicked, then play the movie. 
  if (Eurovision.regions[r].videoPlay) {
    //Displays selected Region's title
    displayTitle(Eurovision.regions[r].name);
      
    // Displays frame.
    if (Eurovision.OK2Print) { println("Drawing image part of the movie " + (r + 1)); }
    image(Eurovision.regions[r].movie,0,100);
    
    // Displays 'click-to-skip' message.
    textSize(14);
    fill(0);
    textAlign(RIGHT,BOTTOM);
    text("Click anywhere to skip the movie.",795,95);
     
    // Specifies that when each region's movie has played its duration that the movie would stop & that the attributes videoPlay & videoEnd are updated 
    if (Eurovision.regions[r].videoPlay && Eurovision.regions[r].movie.time() == Eurovision.regions[r].movie.duration()) {
      Eurovision.regions[r].movie.stop();
      if (Eurovision.OK2Print) { println("Stop playing the movie " + (r + 1)); }
      Eurovision.regions[r].videoPlay = false;
      Eurovision.regions[r].videoEnd = true;
    } 
  } else
  // After the movie of the region finishes display the region.
  if (Eurovision.regions[r].videoEnd) {
    // Draws the Back button.
    noStroke();
    fill(150);
    rectMode(CORNERS);
    rect(15,10,145,90);
    fill(255);
    triangle(45,50,75,25,75,75);
    triangle(75,50,105,25,105,75);
    
    // Draws the Home button.
    fill(150);
    rect(655,10,785,90);
    fill(255);
    triangle(720,25,690,52.5,750,52.5);
    rect(700,50,740,75);
    
    // If no country is selected, then displays the current (r-th) region
    if (c == -1) {
      //Displays selected Region's title
      displayTitle(Eurovision.regions[r].name);
      
      // Displays all the countries of the selected region onto the region's map.
      Eurovision.regions[r].displayAllCountries();
    } else {
      // If a country is selected, then displays that country's page with its data.
      // Background image.
      image(Eurovision.regions[r].listImage,0,100); 
      // Larger version of selected country's heart images alongside header text.
      image(Eurovision.regions[r].countries[c].flagIconLarge,170,10);
      image(Eurovision.regions[r].countries[c].flagIconLarge,550,10);
      
      // Clouds previous region Image.
      fill(255,175);
      rect(0,100,800,700);
      
      // Clouds top display panel (rectangle) apart from the Back & Home buttons
      rect(160,10,640,90);

      // Displays the country's name as title.
      displayTitle(Eurovision.regions[r].countries[c].name);
      
      // Displays all the information regarding that country.
      Eurovision.regions[r].countries[c].display(); 
    }    
  }
  
 // The value for cursorMode might of been changed several times
 // during the same call of the function draw,
 // but the update of the cursor it only at the end of this method.  
 cursor(cursorMode); 
}           

// Displays the textLink at positions textX1, textY1, textX2, textY2
// and sets as the link-active-area for positions rectX1,rectY1,rectX2,rectY2.
void displayLink(String textLink,float textX1,float textY1, float textX2, float textY2, float rectX1,float rectY1, float rectX2, float rectY2) {
  // User can click when the mouse is in the active-area.
  if (mouseX < rectX2 && mouseX > rectX1 && mouseY < rectY2 && mouseY > rectY1) {
    // Draws 'active-area' rectangle.
    fill(230);
    rect(rectX1,rectY1,rectX2,rectY2);
    // 'Notifies' that the cursor should be in HAND-mode
    cursorMode = HAND;
  }
  
  // Displays text as a link.
  fill(0,0,200);
  text(textLink,textX1,textY1,textX2,textY2);
}

// Needed for Processing (internally) to run movies (i.e. .mov)
void movieEvent(Movie m) {
  if (Eurovision.OK2Print) { println("Reading part of the movie."); }
  m.read();
}

// Displays the title.
void displayTitle(String title) {
  fill(0);
  textSize(40);
  textAlign(CENTER,CENTER);
  text(title,400,50);
      
  // For future text (numbers on region buttons, country icon text etc.) to remain properly justified  
  textAlign(LEFT);
}

// Manages mouse-pressed events.
void mousePressed() {
  // Message to be displayed when a click is made.
  if (Eurovision.OK2Print) { println("Click on ("+ mouseX + "," + mouseY + ")"); }
  
  // Store selected region & country as variables.
  int r = Eurovision.selectedRegion;
  int c = Eurovision.selectedCountry;
  
  // Changes Countries Status Mode. 
  if(mouseX < 145 && mouseX > 15 && mouseY < 90 && mouseY > 10 && r == -1) {
    statusMode = !statusMode;
  }
  
  // Change Background Mode.
  if(mouseX < 785 && mouseX > 655 && mouseY < 90 && mouseY > 10 && r == -1) {
    backgroundMode = !backgroundMode;
  }
    
  // If no region is selected on the main-screen then try to select one.
  if ( r == -1 && statusMode == false) {
    for (int i = 0; i <= Eurovision.n-1; i++) {
      // If the mouseX & mouseY co-ordinates are located within a region's boundaries
      // then its video will commence (jump from the beginning). 
      if(mouseX > Eurovision.regions[i].activateMouseXStart
      && mouseX < Eurovision.regions[i].activateMouseXEnd
      && mouseY > Eurovision.regions[i].activateMouseYStart
      && mouseY< Eurovision.regions[i].activateMouseYEnd) {
        // Set the selected region.
        Eurovision.selectedRegion = i;
        if (!Eurovision.skipVideos) {
          // If skipVideos = false then:
          if (Eurovision.OK2Print) { println("Movie play " + (i + 1)); }
          // Set videoPlay on true so the draw() method will know to play the video.
          Eurovision.regions[i].videoPlay = true;
          // and videoEnd on false.
          Eurovision.regions[i].videoEnd = false;
          // Begin to play the movie from the start position.
          Eurovision.regions[i].movie.jump(0.0);
          Eurovision.regions[i].movie.play();
        } else {
          // Videos are skipped.
          if (Eurovision.OK2Print) { println("Movies are disabled."); }
          Eurovision.regions[i].videoPlay = false;
          Eurovision.regions[i].videoEnd = true;
        }
      }  
    }
  }
  
  // Home button clicked .  
  if (r != -1 && Eurovision.regions[r].videoPlay == false
      && mouseX < 785 && mouseX > 655 && mouseY < 90 && mouseY > 10 ) {
    Eurovision.selectedRegion = -1;
    Eurovision.selectedCountry = -1;
  }
  
  // Back button clicked.   
  if (r != -1 && Eurovision.regions[r].videoPlay == false
    && mouseX < 145 && mouseX > 15 && mouseY < 90 && mouseY > 10) {
    if (c != -1) { 
      // If the user is viewing a country then go back to the region.  
      Eurovision.selectedCountry = -1;  
    } else {
      // If the user is viewing a region then go back to the main-screen.
        Eurovision.selectedRegion = -1;  
    }
  }
  
  // If the user clicks during the movie play when a region is selected, then skip the movie.
  if ( r != -1 && Eurovision.regions[r].videoPlay) {
    if (Eurovision.OK2Print) { println("Skip playing the movie " + ( r + 1)); }
    Eurovision.regions[r].movie.stop();
    Eurovision.regions[r].videoPlay = false;
    Eurovision.regions[r].videoEnd = true; 
   }
  
  // Clicking a country when the user is viewing the region page.
   if(r != -1 && c == -1) {
     // Goi
     for(int i = 0; i < Eurovision.regions[r].n; i++) {
        if(mouseX > Eurovision.regions[r].countries[i].flagIconSmallX + 10
        && mouseX < Eurovision.regions[r].countries[i].flagIconSmallX + 40 
        && mouseY > Eurovision.regions[r].countries[i].flagIconSmallY + 10
        && mouseY < Eurovision.regions[r].countries[i].flagIconSmallY + 40) {
          Eurovision.selectedCountry = i;
        }
     }
   }
   
  // Clicking the "their last entry" link
 if (r != -1 && c != -1 && Eurovision.regions[r].countries[c].lastEntryVidLink != null
     && mouseX > 11.5 && mouseX < 388.5 && mouseY > 665 && mouseY < 685) {
     link(Eurovision.regions[r].countries[c].lastEntryVidLink, "_new");
     // When clicking on a 'hyperlink' a new tab in the default browser will be launched.
     // Therefore the project (applet) window becomes inactive.
     // There is an issue:  the mouseX & mouseY co-ordinates freeze when the applet window is inactive
     // and the next click on the project (applet) window will be considered made in the coordinates of the mouse
     // before the window became inactive, not the new coordinates of the mouse click.
     // So by setting mouseX to 0, it no longer is between 7.5 and 392.5 and the next click will be
     // considered out of the hyperlink area.
     mouseX = 0;
  }

 // Clicking the wikilink
 if (r != -1 && c != -1 && Eurovision.regions[r].countries[c].wikilink != null
     && mouseX > 411.5 && mouseX < 788.5 && mouseY > 605 && mouseY < 623) {
     link(Eurovision.regions[r].countries[c].wikilink, "_new");
     mouseX = 0;
  }

 // Clicking the videolink
 if (r != -1 && c != -1 && Eurovision.regions[r].countries[c].videolink != null
     && mouseX > 411.5 && mouseX < 788.5 && mouseY > 665 && mouseY < 685) {
        println("*"+Eurovision.regions[r].countries[c].videolink+"*");

     link(Eurovision.regions[r].countries[c].videolink, "_new");
     mouseX = 0;
  }
  
 // Clicking a country's status ellipse to bring you onto the asdociated country's info page.  
 if(statusMode == true) {
   for(int i = 0; i < Eurovision.n; i++) {
     for(int j = 0; j < Eurovision.regions[i].n; j++) {
       if (mouseX > Eurovision.regions[i].countries[j].statEllipseX-5
           && mouseX < Eurovision.regions[i].countries[j].statEllipseX+5
           && mouseY > Eurovision.regions[i].countries[j].statEllipseY-5
           && mouseY < Eurovision.regions[i].countries[j].statEllipseY+5) {
       Eurovision.regions[i].videoPlay = false;
       Eurovision.regions[i].videoEnd = true;
       Eurovision.selectedRegion = i;
       Eurovision.selectedCountry = j;    
       }
     }
   }
   
 }
}

