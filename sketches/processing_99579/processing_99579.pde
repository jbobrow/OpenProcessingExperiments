
import peasy.*;
import javax.media.opengl.*;
import processing.opengl.*;
PeasyCam cam;


//http://planetpixelemporium.com/sun.html

float R;//need this to equal the radius stated

int numPlanets = 11;

int xDetail = 20;
int yDetail = 20;
float[][] xGrid = new float[xDetail+1][numPlanets];
float[][] yGrid = new float[yDetail+1][numPlanets];
float[][][][] allPoints = new float[xDetail+1][yDetail+1][3][numPlanets];

int n;
int helpCount = 0;
boolean help = false;

PImage observe;
PImage online;
int rect1X, rect1Y;      // Position of ON square button
int rect2X, rect2Y;     // Position of OFF square button
int rect3X, rect3Y;      // Position of off animation button
int rect4X, rect4Y;     //Position of Sun button
int rect5X, rect5Y;    //Position of orbit distance on
int rect6X, rect6Y;    //Position of orbit distance off
int rect7X, rect7Y;   //Position of Textures On
int rect8X, rect8Y;  //Position of Textures off
int rect9X, rect9Y;   //Position of the HELP box
int rect10X, rect10Y; //position of observatory button
int rect11X, rect11Y;  //position of animate back on button
int rect1Size = 50;     // Cam On
int rect2Size = 50;    // Cam Off
int rect3Size = 50;    // Sun size on
int rect4Size = 50;   //sun size off#
int rect5Size = 50;  //orb size on
int rect6Size = 50;   //orb size off
int rect7Size = 50;   //textures size on
int rect8Size = 50;  //textures size off
int rect9Size = 60;  //HELP BOX
color rectColor;
boolean rectOverOn = true;
boolean rectOverOff = false;
boolean rectOverSunOff = false; 
boolean rectOverSunOn = false;
boolean rectOverOrbOn = false;
boolean rectOverOrbOff = false;
boolean rectOverTextOn = false;
boolean rectOverTextOff = false;
boolean rectOverHelp = false;
boolean rectOverObserve = false;
boolean rectOverPlanetsAnimate =  false;
boolean observatory = false;
boolean camOn = false;
boolean camOff = false;

PImage observMap;



PGraphicsOpenGL pgl;
GL gl;

int numOfStars = 500;

Star theStar; // single instance
Star[] arrayOfStars = new Star[numOfStars]; // array of stars
 

Planet[] planets = new Planet[11];
PFont pf;

void setup() {

   frame.setTitle("Virtual Solar System");
   frameRate(100);
   pf= loadFont("SansSerif-16.vlw");
   String url = "http://www.marshallscholarship.org/_inline-images/keelelogo.gif";
   online = loadImage(url, "png");
  //String observ = ("http://www.astro.keele.ac.uk/Observatory/images/KeeleObservatory.jpg");
   observe = loadImage("KeeleObservatory.png");
   
   observMap = loadImage("Mapob2.PNG");
   rectColor = color(263); 
  rect1X = 10;
  rect1Y = 630;
  rect2X = 70;
  rect2Y = 630;
  rect3X = 130;
  rect3Y = 630;
  rect4X = 190;
  rect4Y = 630;
  rect5X = 250;
  rect5Y = 630;
  rect6X = 310;
  rect6Y = 630;
  rect7X = 370;
  rect7Y = 630;
  rect8X = 430;
  rect8Y = 630;
  rect9X = 1315;
  rect9Y = 630;
  rect10X = 1150;
  rect10Y = 630;
  rect11X = 1050;
  rect11Y = 630;
  
  hint(ENABLE_OPENGL_4X_SMOOTH);
  size(1400, 700, OPENGL);
  textFont(pf);

                     //name   , px,py,orbit,speed,radius, colour, info
  planets[1] = new Planet(loadImage("sun.jpg"), "Sun", 700, 350, 10, 1, 30, #FFCC00, "Sun: \n Age: 4.6 Billion Years \n Equatorial Radius: 695,508 Km \n Equatorial Circumference: 4,370,006 Km \n Volume: 1,409,272,569,059,860,000 km3 \n Mass: 1,989,100,000,000,000,000,000,000,000,000 kg \n Density: 1.409 g/cm3 \n Surface Area: 6,078,747,774,547 km2 \n Surface Gravity: 274.0 m/s2 \n Rotational Period: 25.382 Earth Days (609.12 Hours) \n Maximum Surface Temperature:  5,500˚C \n Synodic Period: 27.275 Days \n Composition: 92.1% Hydrogen, 7.8% Helium",1); 
  planets[2] = new Planet(loadImage("mercury.jpg"),"Mercury", 750, 400, 70, 100, 15, #975F34, "Mercury: \n Average Distance From Sun: 57,909,175 Km \n Equatorial Radius: 2439.7 Km \n Equatorial Circumference: 15,329.1 Km \n Volume: 60,827,208,742 km3 \n Mass: 330,1040,000,000,000,000,000,000 kg \n Density: 5.427 g/cm3 \n Surface Area 74,797,000 km2 \n Surface Gravity: 3.7 m/s2 \n Rotational Period: 58.646 Earth Days (1407.5 hours) \n Orbit Period: 87.97 Earth Days \n Mean Orbit Velocity: 105,946 mph \n Minimum Surface Temperature: -173˚C \n	 Maximum Surface Temperature: 427˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen",2);
  planets[3] = new Planet(loadImage("venus.jpg"),"Venus", 800, 450, 95, 120, 5, #A88468, "Venus: \n Average Distance From Sun: 108,208,930 Km \n Equatorial Radius: 3,760.4 Km \n Equatorial Circumference: 38,025 Km \n Volume: 928,400,000,000 km3 \n Mass: 4,868,500,000,000,000,000,000,000 kg \n Density: 5.24 g/cm3 \n Surface Area: 460,200,000 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: 243 Earth Days (5832.4 hours) \n Orbit Period: 224.7 Earth Days \n Mean Orbit Velocity: 78.34 mph \n Minimum surface Temperature: 462 ºC \n Maximum Surface Temperature: Unknown \n Atmospheric Constituents: Carbon Dioxide, Nitrogen  ",3);
  planets[4] = new Planet(loadImage("earth1.jpg"),"Earth", 850, 500, 125, 110, 10, #193BE2,"Earth: \n Average Distance from Sun: 149,597,890 Km \n Equatorial radius : 6378.14 Km \n Equatorial circumf: 40,075 Km \n Volume: 1,083,200,000,000 km3 \n Mass: 5,973,700,000,000,000,000,000,000 kg \n Density: 5.515 g/cm \n Surface Area: 510,065,700 km2 \n Surface Gravity: 9.766 m/s2 \n Rotational Period: 23.934 hours \n Orbit Period: 365.24 \n Mean Orbit Velocity: 66.629 mph \n Minimum Surface Temperature: -88˚C \n Maximum Surface Temperature: 55˚C \n Atmospheric Constituents: Nitrogen,Oxygen.",4);
  planets[5] = new Planet(loadImage("mars.jpg"),"Mars", 925, 575, 165, 110, 5.3, #AF3030, "Mars: \n Average Distance From Sun: 227,936,640 Km \n Equatorial Radius: 3389.5 Km \n Equatorial Circumference: 21,344 Km \n Volume: 163,115,609,799 km3 \n Mass: 641,693,000,000,000,000,000,000 kg \n Density: 3.94 g/cm3 \n Surface Area 144,371,391 km2 \n Surface Gravity: 3.71 m/s2 \n Rotational Period: 1.026 Earth Days (24.62 hours) \n Orbit Period: 686.98 Earth Days \n Mean Orbit Velocity: 53,858 mph \n Minimum Surface Temperature:  -87˚C \n	 Maximum Surface Temperature: -5˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen, Argon.",5);
  planets[6] = new Planet(loadImage("jupiter.jpg"),"Jupiter", 1000, 650, 195, 112, 12, #C05B5B, "Jupiter: \n Average Distance From Sun: 778,412,020 Km \n Equatorial Radius: 69,9112 Km \n Equatorial Circumference: 439,264 Km \n Volume: 1,431,281,810,739,360 km3 \n Mass: 1,898,130,000,000,000,000,000,000,000 kg \n Density: 1.33 g/cm3 \n Surface Area 61,418,738,571 km2 \n Surface Gravity: 24.79 m/s2 \n Rotational Period: 0.4135 Earth Days (9.92496 hours) \n Orbit Period: 4,332.82 Earth Days \n Mean Orbit Velocity: 29,205mph \n Surface Temperature:  -148˚C \n Atmospheric Constituents: Hydrogen, Helium",6);
  planets[7] = new Planet(loadImage("saturn.jpg"),"Saturn", 1100, 750, 235, 98, 8, #DB872D, "Saturn: \n Average Distance From Sun: 778,412,020 Km \n Equatorial Radius: 58,232 Km \n Equatorial Circumference: 365,882 Km \n Volume: 827,129,915,150,897 km3 \n Mass: 568,319,000,000,000,000,000,000,000 kg \n Density: 0.687 g/cm3 \n Surface Area: 42,612,133,285 km2 \n Surface Gravity: 10.4 m/s2 \n Rotational Period: 0.4444 Earth Days (10.66 hours) \n Orbit Period: 10,755.70 Earth Days \n Mean Orbit Velocity: 21,562 mph \n Surface Temperature:  -178˚C \n Atmospheric Constituents: Hydrogen, Helium",7);
  planets[8] = new Planet(loadImage("uranus.jpg"),"Uranus", 1200, 850, 275, 117, 4, #616CB4, "Uranus: \n Average Distance From Sun: 2,870,972,200 Km \n Equatorial Radius: 25,362 Km \n Equatorial Circumference: 159,354.1 Km \n Volume: 68,334,355,695,584 km3 \n Mass: 86,810,300,000,000,000,000,000,000,000 kg \n Density: 1.270 g/cm3 \n Surface Area: 8,083,079,690 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: -0.718 Earth Days (-17.239 hours) (Retrograde) \n Orbit Period: 30,687.2 Earth Days \n Mean Orbit Velocity: 15,209 mph \n Surface Temperature:  -216˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",8);
  planets[9] = new Planet(loadImage("neptune.jpg"),"Neptune", 1300, 950, 305, 101, 12, #2D46E9, "Neptune: \n Average Distance From Sun: 4,498,252,900 Km \n Equatorial Radius: 24,764 Km \n Equatorial Circumference: 154,704.63 Km \n Volume: 62,525,703,987,421 km3 \n Mass: 102,410,000,000,000,000,000,000,000,000 kg \n Density: 1.638 g/cm3 \n Surface Area: 7,618,272,763 km2 \n Surface Gravity: 11.15 m/s2 \n Rotational Period: 0.671 Earth Days (16.11 Hours) \n Orbit Period: 60190.03 Earth Days \n Mean Orbit Velocity: 12,158 mph \n Surface Temperature:  -214˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",9);
  planets[10] = new Planet(loadImage("pluto.jpg"),"Pluto", 1400, 1100, 350, 123, 2, #2D46E9, "Pluto: \n Average Distance From Sun: 5,906,380,000 Km \n Equatorial Radius: 1,151 Km \n Equatorial Circumference: 7,231.9 Km \n Volume: 6,387,259,783 km3  Mass: 13,090,000,000,000,000,000,000 kg \n Density: 2.050 g/cm3 \n Surface Area: 16,647,940 km2 \n Surface Gravity: 0.66 m/s2 \n Rotational Period: -6.387 Earth Days (-153.293 hours) (Retrograde) \n Orbit Period: 90553.02 Earth Days \n Mean Orbit Velocity: 10,444 mph \n Minimum Temperature:  -233˚C \n Maximum Temperature: -223˚C ",10);  



  for(int i = 1; i<numPlanets; i++) 
     setupSphere(planets[i].radius, xDetail, yDetail,i);
  
  
  //PeasyCam(PApplet parent, double lookAtX, double lookAtY, double lookAtZ, double distance);

  cam = new PeasyCam(this, 700, 350, 0, 650);  // default settings on double click
  cam.setMinimumDistance(7);
  cam.setMaximumDistance(1900000);
  cam.setRotations( -0.7301672, -0.274728, 0.30156484);
  cam.setActive(true);
  
  for(int arrayPos=0; arrayPos<numOfStars; arrayPos++){
    arrayOfStars[arrayPos] = new Star();
    arrayOfStars[arrayPos].setPos(random(width), random(height));  // give it a position
 }
}

void draw() {
  update (mouseX, mouseY);
  noStroke();
  background(0);  
  lights();
  fill(255);
  fill(255);
  cam.beginHUD();
  image(online, 1275,0);
  textSize(15);
  text("Key: ",10,18);
  
  text("Date: " + day() + ":" + month() + ":" + year(), 1273, 120);
  text("Time: " + hour() + ":" + minute() + ":" + second(), 1273, 145);
   
  text("User Controls", 10,620); 
   if(rectOverOn) {
    fill(#4BDE46);
  } else {
    fill(255);
  }

  rect(rect1X, rect1Y, rect1Size, rect1Size);
  
    if(rectOverOff) {
    fill(#F14242);
  } else {
    fill(255);
  }

  rect(rect2X, rect2Y, rect2Size, rect2Size);
  
  if(rectOverSunOff) {
    fill(#7493D0);
  } else {
    fill(255);
  }
  rect(rect3X, rect3Y, rect3Size, rect3Size);
   
    if(rectOverSunOn) {
    fill(#7493D0);
  } else {
    fill(255);
  }
  rect(rect4X, rect4Y, rect4Size, rect4Size);
  
  if(rectOverOrbOn) {
    fill(#936A9F);
  } else {
    fill(255);
  }
  rect(rect5X, rect5Y, rect5Size, rect5Size);
  
  if(rectOverOrbOff) {
    fill(#936A9F);
  } else {
    fill(255);
  }
  rect(rect6X, rect6Y, rect6Size, rect6Size);
  
  if(rectOverTextOn) {
    fill(#4F96B9);
  } else {
    fill(255);
  }
  rect(rect7X, rect7Y, rect7Size, rect7Size);
  
  if(rectOverTextOff) {
    fill(#4F96B9);
  } else {
    fill(255);
  }
  rect(rect8X, rect8Y, rect8Size, rect8Size);
  
  if(rectOverHelp) {
   fill(250);
  }else {
   fill(126); 
  }
  stroke(#FFCC00);
  rect(rect9X, rect9Y, rect9Size, rect9Size);

  if(rectOverObserve) {
    fill(#4F96B9);
  } else {
    fill(255);
  }
  rect(rect10X, rect10Y, 90, 60);  
  
  if(rectOverObserve) {
    fill(#4F96B9);
  } else {
    fill(255);
  }
  rect(rect10X, rect10Y, 90, 60);  
  
    if(rectOverPlanetsAnimate) {
    fill(#C37632);
  } else {
    fill(255);
  }
  rect(rect11X, rect11Y, 90, 60);  
  
  fill(#2F3132);
  textSize(12);
  text("Camera \n   On",13,650);
  text("Camera \n   Off",73,650);
  text(" Sun \n Size",139,650);
  text("Sun Size \n  Scaled",191,650);
  text(" Scaled \n  Orbit",251,650);
  text("   Real \n  Orbit",311,650);
  text("Texture \n    On",371,650);
  text("Texture \n    Off",431,650);
  fill(#FFCC00);
  textSize(14);
  text("Help", 1329,666);
  fill(0);
  text("View \nObservatory", 1154,654);
  text("View \nSolar System", 1052,654);

  cam.endHUD(); 
  
  
  for(int arrayPos=0; arrayPos<numOfStars; arrayPos++){
    arrayOfStars[arrayPos].display();
  }
 
 translate(width/2, height/2);
 
 for(int i = 1; i < numPlanets; i++) {
  planets[i].newpos();
}
 
 if(help){
   cam.beginHUD();
   textSize(16);
   fill(#FFCC00);
   text("Help:  ", 15,40);
   text("\nClick A Planet To View its Attributes \nClick and Drag to move around the canvas \nZoom by either: Scrolling with with your mouse Scroll Wheel \n                          Right Click and Move your Mouse Up/Down \nDouble Click to reset the position \nTo control the application, use the Control pad below \nThe Camera can be turned On/Off using the supplied buttons \nYou can view the 'Real Scaled' size of the sun in comparisson to the other planets \nOr See the 'Real Scaled Orbital values by also using the buttons provided. \nTextures can be turned On/Off (Note:Textures do take time to load)", 15, 40);
    helpCount++;
    cam.endHUD();
    
    if (helpCount>150){
         help=false;
         helpCount=0;
      } 
   }
   
   
   if(camOn){
       cam.beginHUD();
       fill(255);
       text("Camera On", 15,50);
       helpCount++;
       cam.endHUD();
       
        if (helpCount>50){
         camOn = false;
         helpCount=0;
      } 
     
   }
   
   if(camOff){
     
       cam.beginHUD();
       fill(255);
       text("Camera Off", 15,50);
       helpCount++;
       cam.endHUD();
       
        if (helpCount>50){
         camOff = false;
         helpCount=0;
      } 
     
     
   }
   
   if(observatory){
   cam.setActive(false); 
   for(int i=1; i<numPlanets; i++){
   planets[i].animate = false;
   }
   cam.beginHUD();
   fill(#FFE2E2);
   textSize(28);
   text("Keele Observatory", 560, 35);
   textSize(16);
   
   text("Keele Observatory is a unique collaboration between local amateur astronomers and the \nUniversity's Astrophysics Group \nThe main instruments are a computer-controlled 24-inch (0.6 metre) reflector equipped with electronic imaging,\nand a historic 12-inch refractor.\nThe Observatory is used: for research (some recent papers), \nby undergraduates (principal astrophysics, electives) and by Keele AstroSoc.\nThe thriving PhD group also uses the Observatory (if interested in studying for a PhD, contact one of the research group)", 360, 75);
   text("We Are Open: Tuesday 20:00-22:30 and Saturday 14:00-16:30",360,255);
   text("Where Are We?:",360,285);
   //observMap.resize(325,325);
   image(observMap,520,300);
   text("Contact Us: Email: obsvisits@phys.keele.ac.uk",1020,380);
   text("Visit Us: http://www.astro.keele.ac.uk",1020,405);
   image(observe, 20,60);
  
   cam.endHUD();
   }
 checkKeys();
 
} //end draw


 


Planet findPlanet(int x, int y) {
  for(int i = 1; i < numPlanets; i++) {
    if (planets[i].contains(x,y))
      return(planets[i]);
    }
    return(null);
}  


void checkKeys(){
  if(mousePressed) {

    Planet p = findPlanet(mouseX,mouseY);
    if (p!=null)p.report();

  }  
}

void update(int x, int y)

{
  
 if ( overRect(rect1X, rect1Y, rect1Size, rect1Size) ) {
    rectOverOn = true;
    cursor(HAND);
  } else {
    rectOverOn = false;
    cursor(ARROW);
  }

  if ( overRect(rect2X, rect2Y, rect2Size, rect2Size) ) {
    rectOverOff = true;
    cursor(HAND);
  } else {
    rectOverOff = false;
  }
  
  if ( overRect(rect3X, rect3Y, rect3Size, rect3Size) ) {
    rectOverSunOff = true;
    cursor(HAND);
  } else {
    rectOverSunOff = false;
  }
  
    if ( overRect(rect4X, rect4Y, rect4Size, rect4Size) ) {
    rectOverSunOn = true;
    cursor(HAND);
  } else {
    rectOverSunOn = false;
  }
  
   if ( overRect(rect5X, rect5Y, rect5Size, rect5Size) ) {
    rectOverOrbOn = true;
    cursor(HAND);
  } else {
    rectOverOrbOn = false;
  }
   if ( overRect(rect6X, rect6Y, rect6Size, rect6Size) ) {
    rectOverOrbOff = true;
    cursor(HAND);
  } else {
    rectOverOrbOff = false;
  }
  
  if ( overRect(rect7X, rect7Y, rect7Size, rect7Size) ) {
    rectOverTextOn = true;
    cursor(HAND);
  } else {
    rectOverTextOn = false;
  }
  if ( overRect(rect8X, rect8Y, rect8Size, rect8Size) ) {
    rectOverTextOff = true;
    cursor(HAND);
  } else {
    rectOverTextOff = false;
  }
  
  if ( overRect(rect9X, rect9Y, rect9Size, rect9Size) ) {
    rectOverHelp = true;
    cursor(HAND);
  } else {
    rectOverHelp = false;
  }
  
  if ( overRect(rect10X, rect10Y, 90, 60) ) {
    rectOverObserve = true;
    cursor(HAND);
  } else {
    rectOverObserve = false;
  }
    if ( overRect(rect11X, rect11Y, 90, 60) ) {
    rectOverPlanetsAnimate = true;
    cursor(HAND);
  } else {
    rectOverPlanetsAnimate = false;
  }
  
}

void mousePressed()
{
  if(rectOverOff) {
      fill(#F14242);
      cam.reset();
      cam.setActive(false);
      camOff = true;
  }
  
  else if(rectOverOn){

   cam.setActive(true); 
   camOn = true;
  }
  
   else if(rectOverSunOff){ //sun increase 
  planets[1] = new Planet(loadImage("sun.jpg"),"Sun", 700, 350, 10, 1, 114, #FFCC00, "Sun: \n Age: 4.6 Billion Years \n Equatorial Radius: 695,508 Km \n Equatorial Circumference: 4,370,006 Km \n Volume: 1,409,272,569,059,860,000 km3 \n Mass: 1,989,100,000,000,000,000,000,000,000,000 kg \n Density: 1.409 g/cm3 \n Surface Area: 6,078,747,774,547 km2 \n Surface Gravity: 274.0 m/s2 \n Rotational Period: 25.382 Earth Days (609.12 Hours) \n Maximum Surface Temperature:  5,500˚C \n Synodic Period: 27.275 Days \n Composition: 92.1% Hydrogen, 7.8% Helium",1); 

  planets[2] = new Planet(loadImage("mercury.jpg"),"Mercury", 750, 400, 155, 100, 15, #975F34, "Mercury: \n Average Distance From Sun: 57,909,175 Km \n Equatorial Radius: 2439.7 Km \n Equatorial Circumference: 15,329.1 Km \n Volume: 60,827,208,742 km3 \n Mass: 330,1040,000,000,000,000,000,000 kg \n Density: 5.427 g/cm3 \n Surface Area 74,797,000 km2 \n Surface Gravity: 3.7 m/s2 \n Rotational Period: 58.646 Earth Days (1407.5 hours) \n Orbit Period: 87.97 Earth Days \n Mean Orbit Velocity: 105,946 mph \n Minimum Surface Temperature: -173˚C \n	 Maximum Surface Temperature: 427˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen",2);
  planets[3] = new Planet(loadImage("venus.jpg"),"Venus", 800, 450, 195, 120, 5, #A88468, "Venus: \n Average Distance From Sun: 108,208,930 Km \n Equatorial Radius: 3,760.4 Km \n Equatorial Circumference: 38,025 Km \n Volume: 928,400,000,000 km3 \n Mass: 4,868,500,000,000,000,000,000,000 kg \n Density: 5.24 g/cm3 \n Surface Area: 460,200,000 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: 243 Earth Days (5832.4 hours) \n Orbit Period: 224.7 Earth Days \n Mean Orbit Velocity: 78.34 mph \n Minimum surface Temperature: 462 ºC \n Maximum Surface Temperature: Unknown \n Atmospheric Constituents: Carbon Dioxide, Nitrogen  ",3);
  planets[4] = new Planet(loadImage("earth.jpg"),"Earth", 850, 500, 225, 110, 10, #193BE2,"Earth: \n Average Distance from Sun: 149,597,890 Km \n Equatorial radius : 6378.14 Km \n Equatorial circumf: 40,075 Km \n Volume: 1,083,200,000,000 km3 \n Mass: 5,973,700,000,000,000,000,000,000 kg \n Density: 5.515 g/cm \n Surface Area: 510,065,700 km2 \n Surface Gravity: 9.766 m/s2 \n Rotational Period: 23.934 hours \n Orbit Period: 365.24 \n Mean Orbit Velocity: 66.629 mph \n Minimum Surface Temperature: -88˚C \n Maximum Surface Temperature: 55˚C \n Atmospheric Constituents: Nitrogen,Oxygen.",4);
  planets[5] = new Planet(loadImage("mars.jpg"),"Mars", 925, 575, 265, 110, 5.3, #AF3030, "Mars: \n Average Distance From Sun: 227,936,640 Km \n Equatorial Radius: 3389.5 Km \n Equatorial Circumference: 21,344 Km \n Volume: 163,115,609,799 km3 \n Mass: 641,693,000,000,000,000,000,000 kg \n Density: 3.94 g/cm3 \n Surface Area 144,371,391 km2 \n Surface Gravity: 3.71 m/s2 \n Rotational Period: 1.026 Earth Days (24.62 hours) \n Orbit Period: 686.98 Earth Days \n Mean Orbit Velocity: 53,858 mph \n Minimum Surface Temperature:  -87˚C \n	 Maximum Surface Temperature: -5˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen, Argon.",5);
  planets[6] = new Planet(loadImage("jupiter.jpg"),"Jupiter", 1000, 650, 305, 112, 12, #C05B5B, "Jupiter: \n Average Distance From Sun: 778,412,020 Km \n Equatorial Radius: 69,9112 Km \n Equatorial Circumference: 439,264 Km \n Volume: 1,431,281,810,739,360 km3 \n Mass: 1,898,130,000,000,000,000,000,000,000 kg \n Density: 1.33 g/cm3 \n Surface Area 61,418,738,571 km2 \n Surface Gravity: 24.79 m/s2 \n Rotational Period: 0.4135 Earth Days (9.92496 hours) \n Orbit Period: 4,332.82 Earth Days \n Mean Orbit Velocity: 29,205mph \n Surface Temperature:  -148˚C \n Atmospheric Constituents: Hydrogen, Helium",6);
  planets[7] = new Planet(loadImage("saturn.jpg"),"Saturn", 1100, 750, 335, 98, 8, #DB872D, "Saturn: \n Average Distance From Sun: 778,412,020 Km \n Equatorial Radius: 58,232 Km \n Equatorial Circumference: 365,882 Km \n Volume: 827,129,915,150,897 km3 \n Mass: 568,319,000,000,000,000,000,000,000 kg \n Density: 0.687 g/cm3 \n Surface Area: 42,612,133,285 km2 \n Surface Gravity: 10.4 m/s2 \n Rotational Period: 0.4444 Earth Days (10.66 hours) \n Orbit Period: 10,755.70 Earth Days \n Mean Orbit Velocity: 21,562 mph \n Surface Temperature:  -178˚C \n Atmospheric Constituents: Hydrogen, Helium",7);
  planets[8] = new Planet(loadImage("uranus.jpg"),"Uranus", 1200, 850, 375, 117, 4, #616CB4, "Uranus: \n Average Distance From Sun: 2,870,972,200 Km \n Equatorial Radius: 25,362 Km \n Equatorial Circumference: 159,354.1 Km \n Volume: 68,334,355,695,584 km3 \n Mass: 86,810,300,000,000,000,000,000,000,000 kg \n Density: 1.270 g/cm3 \n Surface Area: 8,083,079,690 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: -0.718 Earth Days (-17.239 hours) (Retrograde) \n Orbit Period: 30,687.2 Earth Days \n Mean Orbit Velocity: 15,209 mph \n Surface Temperature:  -216˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",8);
  planets[9] = new Planet(loadImage("neptune.jpg"),"Neptune", 1300, 950, 415, 101, 12, #2D46E9, "Neptune: \n Average Distance From Sun: 4,498,252,900 Km \n Equatorial Radius: 24,764 Km \n Equatorial Circumference: 154,704.63 Km \n Volume: 62,525,703,987,421 km3 \n Mass: 102,410,000,000,000,000,000,000,000,000 kg \n Density: 1.638 g/cm3 \n Surface Area: 7,618,272,763 km2 \n Surface Gravity: 11.15 m/s2 \n Rotational Period: 0.671 Earth Days (16.11 Hours) \n Orbit Period: 60190.03 Earth Days \n Mean Orbit Velocity: 12,158 mph \n Surface Temperature:  -214˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",9);
  planets[10] = new Planet(loadImage("pluto.jpg"),"Pluto", 1400, 1100, 440, 123, 2, #2D46E9, "Pluto: \n Average Distance From Sun: 5,906,380,000 Km \n Equatorial Radius: 1,151 Km \n Equatorial Circumference: 7,231.9 Km \n Volume: 6,387,259,783 km3  Mass: 13,090,000,000,000,000,000,000 kg \n Density: 2.050 g/cm3 \n Surface Area: 16,647,940 km2 \n Surface Gravity: 0.66 m/s2 \n Rotational Period: -6.387 Earth Days (-153.293 hours) (Retrograde) \n Orbit Period: 90553.02 Earth Days \n Mean Orbit Velocity: 10,444 mph \n Minimum Temperature:  -233˚C \n Maximum Temperature: -223˚C ",10);  
  }
  
  else if(rectOverSunOn){ //sun decrease
  planets[1] = new Planet(loadImage("sun.jpg"), "Sun", 700, 350, 10, 1, 30, #FFCC00, "Sun: \n Age: 4.6 Billion Years \n Equatorial Radius: 695,508 Km \n Equatorial Circumference: 4,370,006 Km \n Volume: 1,409,272,569,059,860,000 km3 \n Mass: 1,989,100,000,000,000,000,000,000,000,000 kg \n Density: 1.409 g/cm3 \n Surface Area: 6,078,747,774,547 km2 \n Surface Gravity: 274.0 m/s2 \n Rotational Period: 25.382 Earth Days (609.12 Hours) \n Maximum Surface Temperature:  5,500˚C \n Synodic Period: 27.275 Days \n Composition: 92.1% Hydrogen, 7.8% Helium",1); 
  planets[2] = new Planet(loadImage("mercury.jpg"),"Mercury", 750, 400, 70, 100, 15, #975F34, "Mercury: \n Average Distance From Sun: 57,909,175 Km \n Equatorial Radius: 2439.7 Km \n Equatorial Circumference: 15,329.1 Km \n Volume: 60,827,208,742 km3 \n Mass: 330,1040,000,000,000,000,000,000 kg \n Density: 5.427 g/cm3 \n Surface Area 74,797,000 km2 \n Surface Gravity: 3.7 m/s2 \n Rotational Period: 58.646 Earth Days (1407.5 hours) \n Orbit Period: 87.97 Earth Days \n Mean Orbit Velocity: 105,946 mph \n Minimum Surface Temperature: -173˚C \n	 Maximum Surface Temperature: 427˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen",2);
  planets[3] = new Planet(loadImage("venus.jpg"),"Venus", 800, 450, 95, 120, 5, #A88468, "Venus: \n Average Distance From Sun: 108,208,930 Km \n Equatorial Radius: 3,760.4 Km \n Equatorial Circumference: 38,025 Km \n Volume: 928,400,000,000 km3 \n Mass: 4,868,500,000,000,000,000,000,000 kg \n Density: 5.24 g/cm3 \n Surface Area: 460,200,000 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: 243 Earth Days (5832.4 hours) \n Orbit Period: 224.7 Earth Days \n Mean Orbit Velocity: 78.34 mph \n Minimum surface Temperature: 462 ºC \n Maximum Surface Temperature: Unknown \n Atmospheric Constituents: Carbon Dioxide, Nitrogen  ",3);
  planets[4] = new Planet(loadImage("earth.jpg"),"Earth", 850, 500, 125, 110, 10, #193BE2,"Earth: \n Average Distance from Sun: 149,597,890 Km \n Equatorial radius : 6378.14 Km \n Equatorial circumf: 40,075 Km \n Volume: 1,083,200,000,000 km3 \n Mass: 5,973,700,000,000,000,000,000,000 kg \n Density: 5.515 g/cm \n Surface Area: 510,065,700 km2 \n Surface Gravity: 9.766 m/s2 \n Rotational Period: 23.934 hours \n Orbit Period: 365.24 \n Mean Orbit Velocity: 66.629 mph \n Minimum Surface Temperature: -88˚C \n Maximum Surface Temperature: 55˚C \n Atmospheric Constituents: Nitrogen,Oxygen.",4);
  planets[5] = new Planet(loadImage("mars.jpg"),"Mars", 925, 575, 165, 110, 5.3, #AF3030, "Mars: \n Average Distance From Sun: 227,936,640 Km \n Equatorial Radius: 3389.5 Km \n Equatorial Circumference: 21,344 Km \n Volume: 163,115,609,799 km3 \n Mass: 641,693,000,000,000,000,000,000 kg \n Density: 3.94 g/cm3 \n Surface Area 144,371,391 km2 \n Surface Gravity: 3.71 m/s2 \n Rotational Period: 1.026 Earth Days (24.62 hours) \n Orbit Period: 686.98 Earth Days \n Mean Orbit Velocity: 53,858 mph \n Minimum Surface Temperature:  -87˚C \n	 Maximum Surface Temperature: -5˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen, Argon.",5);
  planets[6] = new Planet(loadImage("jupiter.jpg"),"Jupiter", 1000, 650, 195, 112, 12, #C05B5B, "Jupiter: \n Average Distance From Sun: 778,412,020 Km \n Equatorial Radius: 69,9112 Km \n Equatorial Circumference: 439,264 Km \n Volume: 1,431,281,810,739,360 km3 \n Mass: 1,898,130,000,000,000,000,000,000,000 kg \n Density: 1.33 g/cm3 \n Surface Area 61,418,738,571 km2 \n Surface Gravity: 24.79 m/s2 \n Rotational Period: 0.4135 Earth Days (9.92496 hours) \n Orbit Period: 4,332.82 Earth Days \n Mean Orbit Velocity: 29,205mph \n Surface Temperature:  -148˚C \n Atmospheric Constituents: Hydrogen, Helium",6);
  planets[7] = new Planet(loadImage("saturn.jpg"),"Saturn", 1100, 750, 235, 98, 8, #DB872D, "Saturn: \n Average Distance From Sun: 778,412,020 Km \n Equatorial Radius: 58,232 Km \n Equatorial Circumference: 365,882 Km \n Volume: 827,129,915,150,897 km3 \n Mass: 568,319,000,000,000,000,000,000,000 kg \n Density: 0.687 g/cm3 \n Surface Area: 42,612,133,285 km2 \n Surface Gravity: 10.4 m/s2 \n Rotational Period: 0.4444 Earth Days (10.66 hours) \n Orbit Period: 10,755.70 Earth Days \n Mean Orbit Velocity: 21,562 mph \n Surface Temperature:  -178˚C \n Atmospheric Constituents: Hydrogen, Helium",7);
  planets[8] = new Planet(loadImage("uranus.jpg"),"Uranus", 1200, 850, 275, 117, 4, #616CB4, "Uranus: \n Average Distance From Sun: 2,870,972,200 Km \n Equatorial Radius: 25,362 Km \n Equatorial Circumference: 159,354.1 Km \n Volume: 68,334,355,695,584 km3 \n Mass: 86,810,300,000,000,000,000,000,000,000 kg \n Density: 1.270 g/cm3 \n Surface Area: 8,083,079,690 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: -0.718 Earth Days (-17.239 hours) (Retrograde) \n Orbit Period: 30,687.2 Earth Days \n Mean Orbit Velocity: 15,209 mph \n Surface Temperature:  -216˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",8);
  planets[9] = new Planet(loadImage("neptune.jpg"),"Neptune", 1300, 950, 305, 101, 12, #2D46E9, "Neptune: \n Average Distance From Sun: 4,498,252,900 Km \n Equatorial Radius: 24,764 Km \n Equatorial Circumference: 154,704.63 Km \n Volume: 62,525,703,987,421 km3 \n Mass: 102,410,000,000,000,000,000,000,000,000 kg \n Density: 1.638 g/cm3 \n Surface Area: 7,618,272,763 km2 \n Surface Gravity: 11.15 m/s2 \n Rotational Period: 0.671 Earth Days (16.11 Hours) \n Orbit Period: 60190.03 Earth Days \n Mean Orbit Velocity: 12,158 mph \n Surface Temperature:  -214˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",9);
  planets[10] = new Planet(loadImage("pluto.jpg"),"Pluto", 1400, 1100, 350, 123, 2, #2D46E9, "Pluto: \n Average Distance From Sun: 5,906,380,000 Km \n Equatorial Radius: 1,151 Km \n Equatorial Circumference: 7,231.9 Km \n Volume: 6,387,259,783 km3  Mass: 13,090,000,000,000,000,000,000 kg \n Density: 2.050 g/cm3 \n Surface Area: 16,647,940 km2 \n Surface Gravity: 0.66 m/s2 \n Rotational Period: -6.387 Earth Days (-153.293 hours) (Retrograde) \n Orbit Period: 90553.02 Earth Days \n Mean Orbit Velocity: 10,444 mph \n Minimum Temperature:  -233˚C \n Maximum Temperature: -223˚C ",10);   
  }


else if(rectOverOrbOff){ //scaled orbs
  planets[1] = new Planet(loadImage("sun.jpg"),"Sun", 700, 350, 10, 1, 34, #FFCC00, "Sun: \n Age: 4.6 Billion Years \n Equatorial Radius: 695,508 Km \n Equatorial Circumference: 4,370,006 Km \n Volume: 1,409,272,569,059,860,000 km3 \n Mass: 1,989,100,000,000,000,000,000,000,000,000 kg \n Density: 1.409 g/cm3 \n Surface Area: 6,078,747,774,547 km2 \n Surface Gravity: 274.0 m/s2 \n Rotational Period: 25.382 Earth Days (609.12 Hours) \n Maximum Surface Temperature:  5,500˚C \n Synodic Period: 27.275 Days \n Composition: 92.1% Hydrogen, 7.8% Helium",1); 
  planets[2] = new Planet(loadImage("mercury.jpg"),"Mercury", 750, 400, 57.9, 100, 5.38, #975F34, "Mercury: \n Average Distance From Sun: 57,909,175 Km \n Equatorial Radius: 2439.7 Km \n Equatorial Circumference: 15,329.1 Km \n Volume: 60,827,208,742 km3 \n Mass: 330,1040,000,000,000,000,000,000 kg \n Density: 5.427 g/cm3 \n Surface Area 74,797,000 km2 \n Surface Gravity: 3.7 m/s2 \n Rotational Period: 58.646 Earth Days (1407.5 hours) \n Orbit Period: 87.97 Earth Days \n Mean Orbit Velocity: 105,946 mph \n Minimum Surface Temperature: -173˚C \n	 Maximum Surface Temperature: 427˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen",2);
  planets[3] = new Planet(loadImage("venus.jpg"),"Venus", 800, 450, 108.21, 120, 5.95, #A88468, "Venus: \n Average Distance From Sun: 108,208,930 Km \n Equatorial Radius: 3,760.4 Km \n Equatorial Circumference: 38,025 Km \n Volume: 928,400,000,000 km3 \n Mass: 4,868,500,000,000,000,000,000,000 kg \n Density: 5.24 g/cm3 \n Surface Area: 460,200,000 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: 243 Earth Days (5832.4 hours) \n Orbit Period: 224.7 Earth Days \n Mean Orbit Velocity: 78.34 mph \n Minimum surface Temperature: 462 ºC \n Maximum Surface Temperature: Unknown \n Atmospheric Constituents: Carbon Dioxide, Nitrogen  ",3);
  planets[4] = new Planet(loadImage("earth.jpg"),"Earth", 850, 500, 149.60, 110, 6, #193BE2,"Earth: \n Average Distance from Sun: 149,597,890 Km \n Equatorial radius : 6378.14 Km \n Equatorial circumf: 40,075 Km \n Volume: 1,083,200,000,000 km3 \n Mass: 5,973,700,000,000,000,000,000,000 kg \n Density: 5.515 g/cm \n Surface Area: 510,065,700 km2 \n Surface Gravity: 9.766 m/s2 \n Rotational Period: 23.934 hours \n Orbit Period: 365.24 \n Mean Orbit Velocity: 66.629 mph \n Minimum Surface Temperature: -88˚C \n Maximum Surface Temperature: 55˚C \n Atmospheric Constituents: Nitrogen,Oxygen.",4);
  planets[5] = new Planet(loadImage("mars.jpg"),"Mars", 925, 575, 227.94, 110, 5.53, #AF3030, "Mars: \n Average Distance From Sun: 227,936,640 Km \n Equatorial Radius: 3389.5 Km \n Equatorial Circumference: 21,344 Km \n Volume: 163,115,609,799 km3 \n Mass: 641,693,000,000,000,000,000,000 kg \n Density: 3.94 g/cm3 \n Surface Area 144,371,391 km2 \n Surface Gravity: 3.71 m/s2 \n Rotational Period: 1.026 Earth Days (24.62 hours) \n Orbit Period: 686.98 Earth Days \n Mean Orbit Velocity: 53,858 mph \n Minimum Surface Temperature:  -87˚C \n	 Maximum Surface Temperature: -5˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen, Argon.",5);
  planets[6] = new Planet(loadImage("jupiter.jpg"),"Jupiter", 1000, 650, 778.41, 112, 16.9, #C05B5B, "Jupiter: \n Average Distance From Sun: 778,412,020 Km \n Equatorial Radius: 69,9112 Km \n Equatorial Circumference: 439,264 Km \n Volume: 1,431,281,810,739,360 km3 \n Mass: 1,898,130,000,000,000,000,000,000,000 kg \n Density: 1.33 g/cm3 \n Surface Area 61,418,738,571 km2 \n Surface Gravity: 24.79 m/s2 \n Rotational Period: 0.4135 Earth Days (9.92496 hours) \n Orbit Period: 4,332.82 Earth Days \n Mean Orbit Velocity: 29,205mph \n Surface Temperature:  -148˚C \n Atmospheric Constituents: Hydrogen, Helium",6);
  planets[7] = new Planet(loadImage("saturn.jpg"),"Saturn", 1100, 750, 1426.73, 98, 14.40, #DB872D, "Saturn: \n Average Distance From Sun: 1,426,725,400 Km \n Equatorial Radius: 58,232 Km \n Equatorial Circumference: 365,882 Km \n Volume: 827,129,915,150,897 km3 \n Mass: 568,319,000,000,000,000,000,000,000 kg \n Density: 0.687 g/cm3 \n Surface Area: 42,612,133,285 km2 \n Surface Gravity: 10.4 m/s2 \n Rotational Period: 0.4444 Earth Days (10.66 hours) \n Orbit Period: 10,755.70 Earth Days \n Mean Orbit Velocity: 21,562 mph \n Surface Temperature:  -178˚C \n Atmospheric Constituents: Hydrogen, Helium",7);
  planets[8] = new Planet(loadImage("uranus.jpg"),"Uranus", 1200, 850, 2870.97, 117, 9.04, #616CB4, "Uranus: \n Average Distance From Sun: 2,870,972,200 Km \n Equatorial Radius: 25,362 Km \n Equatorial Circumference: 159,354.1 Km \n Volume: 68,334,355,695,584 km3 \n Mass: 86,810,300,000,000,000,000,000,000,000 kg \n Density: 1.270 g/cm3 \n Surface Area: 8,083,079,690 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: -0.718 Earth Days (-17.239 hours) (Retrograde) \n Orbit Period: 30,687.2 Earth Days \n Mean Orbit Velocity: 15,209 mph \n Surface Temperature:  -216˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",8);
  planets[9] = new Planet(loadImage("neptune.jpg"),"Neptune", 1300, 950, 4498.25, 101, 8.88, #2D46E9, "Neptune: \n Average Distance From Sun: 4,498,252,900 Km \n Equatorial Radius: 24,764 Km \n Equatorial Circumference: 154,704.63 Km \n Volume: 62,525,703,987,421 km3 \n Mass: 102,410,000,000,000,000,000,000,000,000 kg \n Density: 1.638 g/cm3 \n Surface Area: 7,618,272,763 km2 \n Surface Gravity: 11.15 m/s2 \n Rotational Period: 0.671 Earth Days (16.11 Hours) \n Orbit Period: 60190.03 Earth Days \n Mean Orbit Velocity: 12,158 mph \n Surface Temperature:  -214˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",9);
  planets[10] = new Planet(loadImage("pluto.jpg"),"Pluto", 1400, 1100, 5906.38, 123, 5.18, #2D46E9, "Pluto: \n Average Distance From Sun: 5,906,380,000 Km \n Equatorial Radius: 1,151 Km \n Equatorial Circumference: 7,231.9 Km \n Volume: 6,387,259,783 km3  Mass: 13,090,000,000,000,000,000,000 kg \n Density: 2.050 g/cm3 \n Surface Area: 16,647,940 km2 \n Surface Gravity: 0.66 m/s2 \n Rotational Period: -6.387 Earth Days (-153.293 hours) (Retrograde) \n Orbit Period: 90553.02 Earth Days \n Mean Orbit Velocity: 10,444 mph \n Minimum Temperature:  -233˚C \n Maximum Temperature: -223˚C ",10);  
    cam.setDistance(4000);
   }
   
   else if (rectOverOrbOn){
     
  planets[1] = new Planet(loadImage("sun.jpg"),"Sun", 700, 350, 10, 1, 30, #FFCC00, "Sun: \n Age: 4.6 Billion Years \n Equatorial Radius: 695,508 Km \n Equatorial Circumference: 4,370,006 Km \n Volume: 1,409,272,569,059,860,000 km3 \n Mass: 1,989,100,000,000,000,000,000,000,000,000 kg \n Density: 1.409 g/cm3 \n Surface Area: 6,078,747,774,547 km2 \n Surface Gravity: 274.0 m/s2 \n Rotational Period: 25.382 Earth Days (609.12 Hours) \n Maximum Surface Temperature:  5,500˚C \n Synodic Period: 27.275 Days \n Composition: 92.1% Hydrogen, 7.8% Helium",1); 
  planets[2] = new Planet(loadImage("mercury.jpg"),"Mercury", 750, 400, 70, 100, 15, #975F34, "Mercury: \n Average Distance From Sun: 57,909,175 Km \n Equatorial Radius: 2439.7 Km \n Equatorial Circumference: 15,329.1 Km \n Volume: 60,827,208,742 km3 \n Mass: 330,1040,000,000,000,000,000,000 kg \n Density: 5.427 g/cm3 \n Surface Area 74,797,000 km2 \n Surface Gravity: 3.7 m/s2 \n Rotational Period: 58.646 Earth Days (1407.5 hours) \n Orbit Period: 87.97 Earth Days \n Mean Orbit Velocity: 105,946 mph \n Minimum Surface Temperature: -173˚C \n	 Maximum Surface Temperature: 427˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen",2);
  planets[3] = new Planet(loadImage("venus.jpg"),"Venus", 800, 450, 95, 120, 5, #A88468, "Venus: \n Average Distance From Sun: 108,208,930 Km \n Equatorial Radius: 3,760.4 Km \n Equatorial Circumference: 38,025 Km \n Volume: 928,400,000,000 km3 \n Mass: 4,868,500,000,000,000,000,000,000 kg \n Density: 5.24 g/cm3 \n Surface Area: 460,200,000 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: 243 Earth Days (5832.4 hours) \n Orbit Period: 224.7 Earth Days \n Mean Orbit Velocity: 78.34 mph \n Minimum surface Temperature: 462 ºC \n Maximum Surface Temperature: Unknown \n Atmospheric Constituents: Carbon Dioxide, Nitrogen  ",3);
  planets[4] = new Planet(loadImage("earth.jpg"),"Earth", 850, 500, 125, 110, 10, #193BE2,"Earth: \n Average Distance from Sun: 149,597,890 Km \n Equatorial radius : 6378.14 Km \n Equatorial circumf: 40,075 Km \n Volume: 1,083,200,000,000 km3 \n Mass: 5,973,700,000,000,000,000,000,000 kg \n Density: 5.515 g/cm \n Surface Area: 510,065,700 km2 \n Surface Gravity: 9.766 m/s2 \n Rotational Period: 23.934 hours \n Orbit Period: 365.24 \n Mean Orbit Velocity: 66.629 mph \n Minimum Surface Temperature: -88˚C \n Maximum Surface Temperature: 55˚C \n Atmospheric Constituents: Nitrogen,Oxygen.",4);
  planets[5] = new Planet(loadImage("mars.jpg"),"Mars", 925, 575, 165, 110, 5.3, #AF3030, "Mars: \n Average Distance From Sun: 227,936,640 Km \n Equatorial Radius: 3389.5 Km \n Equatorial Circumference: 21,344 Km \n Volume: 163,115,609,799 km3 \n Mass: 641,693,000,000,000,000,000,000 kg \n Density: 3.94 g/cm3 \n Surface Area 144,371,391 km2 \n Surface Gravity: 3.71 m/s2 \n Rotational Period: 1.026 Earth Days (24.62 hours) \n Orbit Period: 686.98 Earth Days \n Mean Orbit Velocity: 53,858 mph \n Minimum Surface Temperature:  -87˚C \n	 Maximum Surface Temperature: -5˚C \n Atmospheric Constituents: Carbon Dioxide, Nitrogen, Argon.",5);
  planets[6] = new Planet(loadImage("jupiter.jpg"),"Jupiter", 1000, 650, 195, 112, 12, #C05B5B, "Jupiter: \n Average Distance From Sun: 778,412,020 Km \n Equatorial Radius: 69,9112 Km \n Equatorial Circumference: 439,264 Km \n Volume: 1,431,281,810,739,360 km3 \n Mass: 1,898,130,000,000,000,000,000,000,000 kg \n Density: 1.33 g/cm3 \n Surface Area 61,418,738,571 km2 \n Surface Gravity: 24.79 m/s2 \n Rotational Period: 0.4135 Earth Days (9.92496 hours) \n Orbit Period: 4,332.82 Earth Days \n Mean Orbit Velocity: 29,205mph \n Surface Temperature:  -148˚C \n Atmospheric Constituents: Hydrogen, Helium",6);
  planets[7] = new Planet(loadImage("saturn.jpg"),"Saturn", 1100, 750, 235, 98, 8, #DB872D, "Saturn: \n Average Distance From Sun: 778,412,020 Km \n Equatorial Radius: 58,232 Km \n Equatorial Circumference: 365,882 Km \n Volume: 827,129,915,150,897 km3 \n Mass: 568,319,000,000,000,000,000,000,000 kg \n Density: 0.687 g/cm3 \n Surface Area: 42,612,133,285 km2 \n Surface Gravity: 10.4 m/s2 \n Rotational Period: 0.4444 Earth Days (10.66 hours) \n Orbit Period: 10,755.70 Earth Days \n Mean Orbit Velocity: 21,562 mph \n Surface Temperature:  -178˚C \n Atmospheric Constituents: Hydrogen, Helium",7);
  planets[8] = new Planet(loadImage("uranus.jpg"),"Uranus", 1200, 850, 275, 117, 4, #616CB4, "Uranus: \n Average Distance From Sun: 2,870,972,200 Km \n Equatorial Radius: 25,362 Km \n Equatorial Circumference: 159,354.1 Km \n Volume: 68,334,355,695,584 km3 \n Mass: 86,810,300,000,000,000,000,000,000,000 kg \n Density: 1.270 g/cm3 \n Surface Area: 8,083,079,690 km2 \n Surface Gravity: 8.87 m/s2 \n Rotational Period: -0.718 Earth Days (-17.239 hours) (Retrograde) \n Orbit Period: 30,687.2 Earth Days \n Mean Orbit Velocity: 15,209 mph \n Surface Temperature:  -216˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",8);
  planets[9] = new Planet(loadImage("neptune.jpg"),"Neptune", 1300, 950, 305, 101, 12, #2D46E9, "Neptune: \n Average Distance From Sun: 4,498,252,900 Km \n Equatorial Radius: 24,764 Km \n Equatorial Circumference: 154,704.63 Km \n Volume: 62,525,703,987,421 km3 \n Mass: 102,410,000,000,000,000,000,000,000,000 kg \n Density: 1.638 g/cm3 \n Surface Area: 7,618,272,763 km2 \n Surface Gravity: 11.15 m/s2 \n Rotational Period: 0.671 Earth Days (16.11 Hours) \n Orbit Period: 60190.03 Earth Days \n Mean Orbit Velocity: 12,158 mph \n Surface Temperature:  -214˚C \n	Atmospheric Constituents: Hydrogen, Helium, Methane.",9);
  planets[10] = new Planet(loadImage("pluto.jpg"),"Pluto", 1400, 1100, 350, 123, 2, #2D46E9, "Pluto: \n Average Distance From Sun: 5,906,380,000 Km \n Equatorial Radius: 1,151 Km \n Equatorial Circumference: 7,231.9 Km \n Volume: 6,387,259,783 km3  Mass: 13,090,000,000,000,000,000,000 kg \n Density: 2.050 g/cm3 \n Surface Area: 16,647,940 km2 \n Surface Gravity: 0.66 m/s2 \n Rotational Period: -6.387 Earth Days (-153.293 hours) (Retrograde) \n Orbit Period: 90553.02 Earth Days \n Mean Orbit Velocity: 10,444 mph \n Minimum Temperature:  -233˚C \n Maximum Temperature: -223˚C ",10);  
           cam.reset();
   }
   
   
   else if (rectOverTextOn){
          for(int i = 1; i<numPlanets; i++) {
      planets[i].textOn = true;
      planets[i].solidOn = false;
      } 
     
   }
   
   else if (rectOverTextOff){
          for(int i = 1; i<numPlanets; i++) {
      planets[i].textOn = false;
      planets[i].solidOn = true;
      } 
     
   }
   
   else if (rectOverHelp){
     
    help = true;
    
    
   }
   
    else if(rectOverObserve){

   observatory = true;
  }
  
  else if(rectOverPlanetsAnimate){

   observatory = false;
   for(int i=1; i<numPlanets; i++){
   planets[i].animate = true;
   }
      cam.setActive(true); 
  }
}



boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
  

void setupSphere(float R, int xDetail, int yDetail, int n){

  //set up shere with radius R, amount of x detail and amount of y detail. 
  
  // Create a 2D grid of standardized planet coordinates
  for(int i = 0; i <= xDetail; i++){
    xGrid[i][n]= i / (float) xDetail; //i = 2 for Sun, xGrid[2][1]= 2/20= 1/10
  } 
  for(int i = 0; i <= yDetail; i++){
    yGrid[i][n]= i / (float) yDetail;
  }

  textureMode(NORMAL);

  // Transform the 2D grid into a grid of points on the sphere, using the inverse planet projection
  for(int i = 0; i <= xDetail; i++){
    for(int j = 0; j <= yDetail; j++){ 
      float phi = xGrid[i][n]*2*PI; //creating PHI from the xGrid of points, values 0-19, the planets unique number. Then 2PI. 
      
      float theta = PI-yGrid[j][n]*PI; //create theta from PI-the grid of Y points, value 0-19 and unique number, time PI
      
      allPoints[i][j][0][n]= R*sin(theta)*cos(phi); //X 
      allPoints[i][j][1][n]= R*sin(theta)*sin(phi); //Y using cos here = 2D
      allPoints[i][j][2][n]= R*cos(theta); //Z using Sin here = pyramids
      
     }
  }
}

void drawSphere(PImage Map,int n){

  for(int j = 0; j < yDetail; j++){
    beginShape(TRIANGLE_STRIP);
    texture(Map);
    for(int i = 0; i <= xDetail; i++){
      vertex(allPoints[i][j+1][0][n],   allPoints[i][j+1][1][n],   allPoints[i][j+1][2][n],   xGrid[i][n],   yGrid[j+1][n]); //X strips
      vertex(allPoints[i][j][0][n],     allPoints[i][j][1][n],     allPoints[i][j][2][n],     xGrid[i][n],   yGrid[j][n]); //Y strips
    }
    endShape(CLOSE);
  }
}



