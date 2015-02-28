
import com.google.code.chatterbotapi.*;
 
ChatterBotSession bot1session, bot2session;
 int counter;
int lastTime;
final int DISPLAY_TIME = 2000;


void setup()
{    size (300,300);
  lastTime = millis(); 
  ChatterBotFactory factory = new ChatterBotFactory();
  ChatterBot bot1 = null, bot2 = null;
  try
  {
    bot1 = factory.create(ChatterBotType.CLEVERBOT);
    bot2 = factory.create(ChatterBotType.PANDORABOTS, "b0dafd24ee35a477");
  }
  catch (Exception e)
  {
    println("Error: " + e);
  }
  bot1session = bot1.createSession();
  bot2session = bot2.createSession();
}
 
 
void draw()
{
 
    
    
  try
  {
     String s = "Hello, how are you??";
  
   String lines[] = loadStrings("positions2.txt");
    for (int i = 0 ; i < lines.length; i++) {
      String hola = lines[i];}
         if (millis() - lastTime >= DISPLAY_TIME) {
      counter = ++counter % lines.length;
      lastTime = millis();
    
    println("bot1> " +lines[counter]  );
  
 
   s  = bot2session.think(lines[counter] );
   println("bot2> " +s );
      text(lines[counter], 100, 100);     }
//  lines[counter] = bot1session.think(lines[counter]);
    
  }
  catch (Exception e)
  {
    println("Error: " + e);
  }
}

