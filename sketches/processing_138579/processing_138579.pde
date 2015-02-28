
PFont font;

String lorumIpsum = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.";
String preamble = "We the People of the United States, in Order to form a more perfect Union, establish Justice, insure domestic Tranquility, provide for the common defence, promote the general Welfare, and secure the Blessings of Liberty to ourselves and our Posterity, do ordain and establish this Constitution for the United States of America.";

float xPadding = 24;
float yPadding = 24 + 4;

color bgColor = color(0);
color updateWPSColor = color(255); 

//internal variables

String textToRead;

String[] wordsToShow;

String backlogText = "";

float wordUpdateRatePerSecond;

float beginningTime = 0;
float elapsedTime = 0;

int currentWord = 0;
int lastWord = 0;

float yOffsetDisplay = 0;

boolean startDisplay;

int timer;

void setup()
{
  textToRead = preamble;
  wordUpdateRatePerSecond = 0.1f;
  
  startDisplay = true;
  
  size(320, 240);
  font = loadFont("Roboto-Light-24.vlw");
  wordsToShow = split(textToRead, ' ');  
  textFont(font, 24);
  
  beginningTime = 0;
  
  background(0);
  
}

void draw()
{
  if (!startDisplay)
    return;
  elapsedTime = (float)millis() / 1000 - beginningTime; 
  //println(elapsedTime);
  drawDisplay();
  
}

void mousePressed() {
  if (mouseButton == LEFT) {
    timer = millis();
    backlogText = "";
    currentWord = 0;
    lastWord = 0;
    startDisplay = true;
  } 
  else if (mouseButton == RIGHT) {
    startDisplay = false;
  } 
}

void keyPressed() {
  if (key >= '1' && key <= '9')
  {
    drawWordsPerSecondRate(bgColor); //"erase" previous value
    //ASCII '0' = 48
    wordUpdateRatePerSecond = ((int)key - 48) * 0.05f;
    drawWordsPerSecondRate(updateWPSColor);
    timer = millis();
  }
  if (key == '_' || key == '-')
  {
     //pause it
     startDisplay = false;
  }
  if (key == '+' || key == '=')
  {
    //start it
    timer = millis();
    backlogText = "";
    currentWord = 0;
    lastWord = 0;
    startDisplay = true;
  }
    
}

void drawDisplay() {
  if (millis() - timer >= wordUpdateRatePerSecond * 1000)
  {
    timer = millis();
    currentWord++; 
  }
  //currentWord = (int)(elapsedTime / wordUpdateRatePerSecond);
  
  if (currentWord > lastWord)
  {
    //update display
    if (currentWord <= wordsToShow.length)
    {
      background(bgColor);
      stroke(255, 255, 0);
      fill(255, 255, 0);
      
      //write the currently viewed word
      String newWord = wordsToShow[currentWord - 1];
      
      textAlign(RIGHT);
      text(newWord, width - xPadding, height - yPadding);
      
      //write the past text
      fill(255); //white
      
      backlogText += newWord + " ";
      
      ArrayList display = wordWrap(backlogText, (int)(width - yPadding*2));
      
      for (int i=0; i < display.size(); i++)
      {
        //write each line from the bottom up 
        int currentLine = display.size() - i;
        float yLineDisplay = height - (yPadding * (2 + currentLine));  
        
        //fade the text as it goes up if we are not currently scrolling through text
        if (yOffsetDisplay == 0)
          fill(255 - (currentLine - 1)*20);
        else
          fill(255);
        
        if (currentLine == 1) //right align the most current text
        {
          textAlign(RIGHT);
          text(display.get(i).toString(), width - xPadding, yLineDisplay);
        }
        else //possibly left align past text
        {
          //textAlign(LEFT);
          //text(display.get(i).toString(), xPadding, yLineDisplay);
          textAlign(RIGHT);
          text(display.get(i).toString(), width - xPadding, yLineDisplay);
        }
          
      }
      
      //println(backlogText);
      //println(newWord);
    }
    
    lastWord = currentWord;
   
    drawWordsPerSecondRate(updateWPSColor); 
  }
}

void drawWordsPerSecondRate(color textColor) 
{
  textFont(font, 12);
  fill(textColor);
  textAlign(LEFT);
  int charPlaces = 4;
  String floatText = Float.toString(wordUpdateRatePerSecond);
  if (floatText.length() > charPlaces)
    floatText = floatText.substring(charPlaces);
  String textToDisplay = floatText + "f";
  text(textToDisplay, xPadding, height - yPadding);
  textFont(font, 24);
}

//TODO make this justify the text with spaces...??
ArrayList wordWrap(String s, int maxWidth) {
  // Make an empty ArrayList
  ArrayList a = new ArrayList();
  float w = 0;    // Accumulate width of chars
  int i = 0;      // Count through chars
  int rememberSpace = 0; // Remember where the last space was
  // As long as we are not at the end of the String
  while (i < s.length()) {
    // Current char
    char c = s.charAt(i);
    w += textWidth(c); // accumulate width
    if (c == ' ') rememberSpace = i; // Are we a blank space?
    if (w > maxWidth) {  // Have we reached the end of a line?
      String sub = s.substring(0,rememberSpace); // Make a substring
      // Chop off space at beginning
      if (sub.length() > 0 && sub.charAt(0) == ' ') sub = sub.substring(1,sub.length());
      // Add substring to the list
      a.add(sub);
      // Reset everything
      s = s.substring(rememberSpace,s.length());
      i = 0;
      w = 0;
    } 
    else {
      i++;  // Keep going!
    }
  }
 
  // Take care of the last remaining line
  if (s.length() > 0 && s.charAt(0) == ' ') s = s.substring(1,s.length());
  a.add(s);
 
  return a;
}


