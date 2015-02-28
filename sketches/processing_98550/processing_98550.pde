
PFont titleFont, labelFont;

String[] tugCountries = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};
// Note: The 1900 Tug of War gold medal team was composed of
//       athletes from both Sweden and Denmark. However, 
//       Sweden and not Denmark won solo medals later, 
//       so only Sweden is listed in this dataset.
int[] tugMedals = {5, 3, 4, 3, 2, 4, 1, 1};
String[] tugNames = {"Monday", "Friday", "Wednesday", "Thursday", "Friday",
                     "Saturday", "Sunday"};

void setup() {
  size(550, 210);
  titleFont = loadFont("GillSans-Bold-18.vlw");
  labelFont = loadFont("GillSans-12.vlw");
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(#333F48);
  noStroke();
  
  // Tug of War bar chart based on summary data
  int bb = 40;   // Bottom border
  int lb = 75;  // Left side border
  
  for(int i = 0; i < tugCountries.length; i++) {
    int w = 40;    // Width of bars
    int s = 20;    // Space between bars
    int[] t  = new int[tugCountries.length]; // Tall (for bars)
    t[i] = tugMedals[i] * 20;
    int[] x = new int[tugCountries.length];
    x[i] = int(lb + (i + .5) * (w + s));
    int[] y = new int[tugCountries.length];
    y[i] = height - bb - t[i]/2;
    
    if((mouseX > (x[i] - w/2)) && (mouseX < (x[i] + w/2)) &&
       (mouseY > (y[i] - t[i]/2)) && (mouseY < (y[i] + w/2))) {
       fill(#F6EB61);
       // Could also have bars fill in with flag of country.
       textFont(labelFont);
       textAlign(CENTER);
       // Info on rollover...
       text(tugNames[i] + ": " + tugMedals[i], x[i], y[i] - t[i]/2 - 10);
       // ... or info on click
//       if(mousePressed) {
//         text(tugNames[i] + ": " + tugMedals[i], x[i], y[i] - t[i]/2 - 10);
//       }
    } else {
    fill(#C8DEDA);
    }
    rect(x[i], y[i], w, t[i]);
  
    textAlign(CENTER);
    textFont(labelFont);
    fill(#E5EFE2);
    text(tugCountries[i], x[i], height - bb/2);
  }
  
  stroke(#B8DDE1);
  textFont(labelFont);
  textAlign(RIGHT, CENTER);
  for(int i = 0; i < 6; i++) {
    int y = height - bb - i * 20;
    line(lb - 5, y, lb - 8, y);
    text(i, lb - 15, y);
  }
  
  textAlign(CENTER);
  textFont(titleFont);
  text(" ITCT \n School Application Usage", width/2, 30);
}
