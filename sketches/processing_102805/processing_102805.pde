
/**************************************************
 # this progrram whas originally write in python
 # Determine the moon phase of a date given
 # Python code by HAB
 *************************************************/

String date = "";
String status = "";
String _light = "";
String phase = "";

PImage[] images = new PImage[8];
PImage img = new PImage();

void setup() {
  size(300, 200, P2D);
  
  imageMode(CENTER);  
  for (int i = 0; i < images.length; i ++) {
    images[i] = loadImage("lua0" + String.valueOf(i) +".png");
  }
}

void draw() {
  int d = day();    // Values from 1 - 31   
  int m = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  
  background(0);
  noLoop();
  moon_phase(d, m, y);
} 

void moon_phase(int day, int month, int year ) {
  // Determine the moon phase of a date given
  // Python code by HAB
  // processing code by Armando Marques da Silva Sobrinho
  int days_into_phase = 0;
  int index = 0;
  int light = 0;
  int a, b, c, d = 0;
  int[] ages = {
    18, 0, 11, 22, 3, 14, 25, 6, 17, 28, 9, 20, 1, 12, 23, 4, 15, 26, 7
  };
  int[] offsets = {
    -1, 1, 0, 1, 2, 3, 4, 5, 7, 7, 9, 9
  };
  String[] description = {
    "New Moon (totally dark)", 
    "Waxing Crescent (low light)", 
    "First Quarter (partial light)", 
    "waxing gibbous (increasing to full)", 
    "Full Monn (full light)", 
    "Waning Gibbous (decreasing from full)", 
    "Last Quarter (partial light)", 
    "Waning Crescent (low light)"
  };
  String[] months = {
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  };

  if (day == 31) {
    day = 1;
  }

  days_into_phase = ((ages[(year + 1) % 19] + ((day + offsets[month-1]) % 30) + int(year < 1900)) % 30);
  index = int((days_into_phase + 2) * 16/59.0);
  if (index > 7) {
    index = 7;
  }
  status = description[index];

  // light should be 100% 15 days into phase
  light = int(2 * days_into_phase * 100/29);
  if (light > 100) {
    light = abs(light - 200);
  }
  _light = light+"%";

  date = day + " " + months[month-1]+" " + year;

  phase = "The moon in "+date+", is in your \n"+status+". \nLigth in : "+_light; 
  fill(160);
  stroke(0);

  image(images[index], width/2, 80);

  text(phase, 10, 2*images[index].width+20);

//  sdmoons[index].cue(0);
//  sdmoons[index].play();
}
