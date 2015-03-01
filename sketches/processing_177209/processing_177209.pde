
void setup() {
  size(500, 300);
  background(0);
  textAlign(CENTER, CENTER);
}
 
void draw() {
  //Setting text size to 60
  textSize(60);
   
  //Storing into String type variables the current hour, minute, second
  String seconds = str(second());
  String minutes = str(minute());
  String hours = str(hour());
   
  //Instead of showing 9 seconds or 9 minutes for example, fixes to 09 seconds or 09 minutes
  //Adds a 0 at the beginning of the string if its length is 1 character only
  if(seconds.length() == 1) {
    seconds = "0" + seconds;
  } else if(minutes.length() == 1) {
    minutes = "0" + minutes;
  } else if (hours.length() == 1) {
    hours = "0" + hours;
  }
   
  //Mashes all time variables into one string variable to compose the HEX value 
  String bgcolor = hours + minutes + seconds;
     
  //Sets the background to the mashed variable with the HEX value
  //unhex() function description from processing reference:
  //Converts a String representation of a hexadecimal number to its equivalent integer value
  background(0xFF000000 + unhex(bgcolor));
   
  //Prints all strings on screen
  text(seconds, width/2 + 100, height/2-30);
  text(":", width/2 + 50, height/2-30);
  text(minutes, width/2, height/2-30);
  text(":", width/2 - 50, height/2-30);
  text(hours, width/2 - 100, height/2-30);
   
  //Prints the current HEX in the background
  textSize(20);
  text("#" + bgcolor, width/2, height-70);
}
