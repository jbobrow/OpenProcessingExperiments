

PFont titleFont, labelFont, keyFont, labelHeadFont; // declare fonts

String[] suiDates = {"01.10", "02.01", "02.14", "02.16",  "02.18", "03.18", "03.23", "03.29",
                        "04.16", "04.20", "04.23", "04.29", "05.01", "05.07", "05.08", "05.11", "05.12", "05.24",
                      "06.03", "06.15", "06.15", "06.18", "06.21", "06.30", "07.08", "07.25", "07.26", "08.08", "09.22", "10.02",
                   "10.03", "10.11", "10.16" }; // Array of dates
int[] suiCasualties = {214, 97, 30, 284, 12, 51, 57, 47, 78, 8, 46, 55, 3, 52, 30, 8, 75, 5, 2, 33, 11, 94, 45, 100, 18, 39,
                   250, 98, 226, 24, 39, 4, 39}; // Array of total people affected
int[] suiDead = {93, 27, 7, 84, 5, 4, 22, 12, 18, 4, 6, 10, 1, 12, 3, 2, 7, 3, 0, 14, 11, 34, 15, 30, 8, 9, 50, 38, 81, 8,
             17, 2, 9}; // Array of people killed

int[] suiInjure = {121, 50, 23, 200, 7, 47, 35, 35, 60, 4, 40, 45, 2, 40, 27, 5, 68, 2, 2, 19, 0, 60, 30, 70, 10, 30, 200,
60, 145, 16, 22, 2, 30}; // Array of people injured
              
String[] suiCities = {"QUETTA", "HANGU", "HANGU",  "QUETTA", "PESHAWAR", "PESHAWAR", "WAZIRISTAN", "PESHAWAR", "PESHAWAR",
                     "BAJPUR", "QUETTA", "PESHAWAR", "SHIKARPUR", "HANGU", "BANNU", "KARACHI", "QUETTA", "PESHAWAR",
                   "WAZIRISTAN", "QUETTA", "QUETTA", "MARDAN", "PESHAWAR", "QUETTA", "HANGU", "SUKKUR", "KURAM", "QUETTA", "PESHAWAR",
                 "CHAMAN", "HANGU", "WAZIRISTAN", "D.I. KHAN"}; // Array of cities
PImage[] ratio = new PImage[suiDates.length];
String[] imageNames = {"01.png", "02.png", "03.png", 
                       "05.png", "06.png", "07.png", "08.png",
                       "09.png", "10.png","12.png",
                       "13.png", "14.png", "15.png", "16.png",
                       "17.png", "18.png", "19.png", "20.png",
                       "21.png", "22.png", "23.png", "24.png",
                       "25.png", "26.png", "27.png", "28.png",
                       "29.png", "30.png", "31.png", "32.png",
                       "33.png", "34.png", "35.png",
            }; // Array of visual proportion of each
PImage bg; // Declare background image
void setup() {
  size(1280, 720); 
  bg = loadImage("background_processing_sans_text.png");
  titleFont = loadFont("Rockwell-39.vlw");
  labelFont = loadFont("GillSans-12.vlw");
  keyFont= loadFont("AvenirNext-Medium-16.vlw");
  labelHeadFont= loadFont("Rockwell-11.vlw");
  
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(bg);
  noStroke();
  
  // Tug of War bar chart based on summary data
  int bb = 40;   // Bottom border
  int lb = 30;  // Left side border
  
  for(int i = 0; i < suiDates.length; i++) {
    int w = 15;    // Width of bars
    int s = 22;    // Space between bars
    int[] t  = new int[suiDates.length]; // length for bars)
    t[i] = suiCasualties[i] * 2;
    int[] x = new int[suiDates.length];
    x[i] = int(lb + (i + .5) * (w + s));
    int[] y = new int[suiDates.length];
    y[i] = height - bb - t[i]/2;
    ratio[i] = loadImage(imageNames[i]);
    
    if((mouseX > (x[i] - w/2)) && (mouseX < (x[i] + w/2)) &&
       (mouseY > (y[i] - t[i]/0.5)) && (mouseY < (y[i] + w/2))) {
       fill(#FFFFFF);
       textFont(labelHeadFont);
       textAlign(CENTER);
       text(suiCities[i], x[i], y[i] - t[i]/2 - 45);
       
       fill(#FFFFFF);
       textFont(labelFont);
       textAlign(CENTER);
       text("Injured" + " " + suiInjure[i], x[i], y[i] - t[i]/2 -30);
       text("Killed" + " " + suiDead[i], x[i], y[i] - t[i]/2 - 15);
       imageMode(CENTER);
       image(ratio[i], x[i], y[i], w, t[i]);
       noFill();
    } 
    else {
      fill(#CCCCCC);
    }
    rect(x[i], y[i], w, t[i]);
  
    textAlign(CENTER);
    textFont(labelFont);
    fill(#CCCCCC);
    text(suiDates[i], x[i], height - bb/2); // dates
  }
  
  
  
  textAlign(CENTER);
  textFont(titleFont);
  text("SUICIDE BOMBINGS IN PAKISTAN 2013", width/2, 40); // heading
  
  textAlign(LEFT);
  textFont(keyFont);
  text("KILLED", 1090, 22); // key
  
   textAlign(LEFT);
  textFont(keyFont);
  text("INJURED", 1090, 48); // key
}


