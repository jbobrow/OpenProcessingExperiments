
int startingTime;
final String format = "{0,number,integer} days " +
    "{1,number,integer} hours {2,number,integer} minutes " +
    "and {3,number,integer} seconds";
final String prefix = "";

void setup()
{
  size(600, 200);
  PFont font = loadFont("AmericanTypewriter-24.vlw");
  textFont(font);
  frameRate(1);

  startingTime = millis();
// For tests
//  startingTime = millis() - 1000*(60*60*23 + 60*59 + 50);
  
  // Remove title bar
  // Esc to close the window
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
}

void draw()
{
  background(#99EEAA);

  int seconds = (millis() - startingTime) / 1000;
  int minutes = seconds / 60;
  int hours = minutes / 60;
  int days = hours / 24;
//  println(">H " + hours + " M " + minutes + " S " + seconds);
  seconds -= minutes * 60;
  minutes -= hours * 60;
  hours -= days * 24;
//  println("=H " + hours + " M " + minutes + " S " + seconds);

//~   String message = MessageFormat.format(format,
//~       days,
//~       hours,
//~       minutes,
//~       seconds
//~   );
  String message = prefix +
      GetPlural(days, "day") + " " +
      GetPlural(hours, "hour") + " " +
      GetPlural(minutes, "minute") + " and " +
      GetPlural(seconds, "second");
  stroke(#0000FF);
  fill(#224488);
  text(message, 22, 102);
  fill(#9977EE);
  text(message, 20, 100);
//  println(message);
}

String GetPlural(int value, String word)
{
  if (value == 1)
    return value + " " + word;
  // Ad hoc for current sketch,
  // I have something more elaborate for irregular plurals
  return value + " " + word + "s";
}
void keyPressed()
{
  startingTime = millis();
  
  // Also prevent direct exit from Escape key, ask confirmation first
  if (key == KeyEvent.VK_ESCAPE) 
  {
    key = 0;
  }
}


