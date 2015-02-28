
import rita.*;
import ddf.minim.*;
    import java.util.*;
import java.lang.String;
/*
 * @desc Creates a haiku using a clever grammar.
 */

RiText[] weather;
RiGrammar grammar;
RiGrammar newsGrammar;
RiGrammar exchangeGrammar;
RiGrammar adGrammar;
  PImage b;
   PImage back;
   PImage bot;
   PImage ad;
   PImage side;
  Minim minim;
AudioPlayer in;
int[] dayNumberOrder;
String [] dayOrder;
int currentDay;
RiText[] dayDisplay;
RiText[] dayTemp;
RiText[] nightTemp;
RiText[] weatherTone;
RiText[] exchange;
boolean clicked;
Random generator;
int startPosition;
RiSpeech rsWeather;
String[] lines;
  PFont font;
    PFont exchangefont;
RiText newsText;
RiText adText;
void setup()
{

font = loadFont("AppleBraille-32.vlw"); 
exchangefont = loadFont("Serif-32.vlw");
textFont(font); 

  frameRate(0.5); 
  size(918,640);
  //lines = new String [5];
  dayNumberOrder = new int[7];
  dayOrder = new String[7];
  dayDisplay = new RiText[7];
  generator = new Random();
  dayTemp = new RiText[7];
  nightTemp = new RiText[7];
  weatherTone = new RiText[7];
  exchange = new RiText[4];
  clicked = false;
  RiText.setDefaultAlignment(LEFT);
  RiText.setDefaultFont("AppleBraille-32.vlw");
  startPosition = 120;
  imageMode(CENTER);
  rsWeather = new RiSpeech(this);
  //    grammar = new RiGrammar(this, "weatherGrammar.g");
 // rsWeather.setVoice(lines[0]);
  /*for (int i = 0; i < rts.length; i++) {
    rts[i].fadeToText(lines[i].trim(), 1.0f);*/
      //getStartingDay();
 /*rts = new RiText[5];
  RiText.setDefaultAlignment(LEFT);
  RiText.setDefaultFont("AppleBraille-32.vlw");
  for (int i = 0; i < 5; i ++)
  {
      rts[i] = new RiText(this, 70, 150 + i*45);
  }
  */
  back = loadImage("BACKGROUND.jpg");
  image(back,459,320);
  //minim = new Minim(this);
  //in = minim.loadFile("Spring.mp3");
  //in.play();
  
  // grammar.openGrammarEditor(); // for dev
  
  processWeather();
  displayExchangeRate();
}

void processWeather()
{
       RiText.deleteAll();
       rsWeather.stop();
       
    getStartingDay(); 
    grammar = new RiGrammar(this, "grammar.g");
  //  grammar.openEditor();
  String result = grammar.expand();
  lines = result.split("%");
  rsWeather.useMacTTS(lines[0]);
  //rsWeather.useMacTTS("Agnes");
  rsWeather.setVoiceRate(60);
  rsWeather.speak(lines[1]);
     RiText dayText = new RiText(this,"Day",300, startPosition - 60);
  RiText nightText = new RiText(this,"Night",400, startPosition - 60);
 clicked = true;
}

void draw()
{
 // background(255);
  
  
  
}


void displayExchangeRate()
{
  RiText.delete(exchange);
  exchangeGrammar = new RiGrammar(this, "exchange.g");
  //  grammar.openEditor();
  String result = exchangeGrammar.expand();
  String[] exlines = result.split("%");
  for (int i =0; i< exlines.length; i++)
  {
         exchange[i] = new RiText(this,exlines[i],700, startPosition -40 +i*45);
         exchange[i].fill(255);         
         exchange[i].textFont(exchangefont);
  }
  
}


void mouseClicked()
{
  //RiText.delete(newsText);
  bot = loadImage("bottom.jpg");
  side = loadImage("side.jpg");
  image(bot,459,598);
  image(side,800,280);
  if (newsText != null)
    newsText.setVisible(false);
  newsGrammar = new RiGrammar(this, "news.g");
  //  grammar.openEditor();
  String result = newsGrammar.expand();
  String[] exlines = result.split("%");
  for (int i =0; i< exlines.length; i++)
  {
         newsText = new RiText(this,exlines[i],200,600);
         newsText.fill(255);
         newsText.textFont(exchangefont,24);  
         //newsText.setVisible(true);
  }
  adGrammar = new RiGrammar(this,"ads.g");
  String adres = adGrammar.expand();
  //adText = new RiText(this,adres,700,500);
  ad = loadImage(adres);
  image(ad,800,400,235,300);
  displayExchangeRate();
}

void stop()
{
  rsWeather.stop();
  /*in.close();
  // always stop your Minim object
  minim.stop();
  super.stop*/
}

void getNextDay()
{
  currentDay++;
  //return dayOrder[currentDay];
}

void getStartingDay()
{
    currentDay = 0;
    int first = 0;
    dayOrder[0] = getDayInWeek(first);
    dayDisplay[0] = new RiText(this,dayOrder[0],80,startPosition);
    for (int i = 1; i < 7; i ++)
    {
      first = (first+1)%7;
      dayOrder[i] = getDayInWeek(first);
      dayDisplay[i] = new RiText(this,dayOrder[i],80,startPosition +i*60);
    }
    //return dayOrder[0];
}

void reportWeatherTone(float tone)
{
      //RiText.disableAutoDraw();
      if (tone == 0) //sunny
      {
        weatherTone[currentDay] = new RiText (this, "sunny.gif");
      }
      else // rain
      {
        weatherTone[currentDay] = new RiText (this, "rain.gif");
      }
      weatherTone[currentDay].setVisible(false);
      b = loadImage(weatherTone[currentDay].getText());
      image(b,530, startPosition - 10 +currentDay*60);
      
           currentDay++;
     if (currentDay == 7)
       currentDay = 6;
}

void generateTemp(float tone)
{
      
      int daytemp = 0;
      int nighttemp = 0;
      if (tone == 0) //cold
      {
        nighttemp = generator.nextInt( 20); // 0-10 F
        daytemp =  20 + (int)Math.round((Math.random() * (40 - 20))); // 10-20 F
      }
      else if (tone == 1) // mild
      {
        nighttemp = 10 + (int)Math.round((Math.random() * (30 - 10))); // 10-30 F
        daytemp =  30 + (int)Math.round((Math.random() * (50 - 30))); // 30-50 F
      }
      else // hot 
      {
        nighttemp = 20 + (int)Math.round((Math.random() * (40 - 20))); // 20-40 F
        daytemp =  40 + (int)Math.round((Math.random() * (60 - 40))); // 40-60 F
      }
      dayTemp[currentDay] = new RiText(this,Integer.toString(daytemp) + "F", 300, startPosition+currentDay*60);        
      nightTemp[currentDay] = new RiText(this,Integer.toString(nighttemp) + "F", 400, startPosition+currentDay*60);
     // return dayTemp[currentDay] + "F\t" + nightTemp[currentDay] + "F";
}

String getDayInWeek(int dayNumber)
{
  switch (dayNumber)
  {
    case 0:
    return "Sunday:";
    case 1:
    return "Monday:";
    case 2:
    return "Tuesday:";
    case 3:
    return "Wednesday:";
    case 4:
    return "Thursday:";
    case 5:
    return "Friday:";
    case 6:
    return "Saturday:";
    default:
    return "Saturday:";
  }
}

