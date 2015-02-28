
/*Song lyrics used:
  "The Owl and The Tanager" - Sufjan Stevens
  "Helplessness Blues" - Fleet Foxes
  */

boolean mouseIsDown;
boolean keyIsDown;
PFont ArialBlack;

void setup()
{
  size(1000,600);
  smooth();
  mouseIsDown = false;
  keyIsDown = false;
  frameRate(8);
  
  background(255,255,255);
  ArialBlack = loadFont("Aharoni-Bold-48.vlw");
}

void draw()
{  
  
  
  String[] owlAndTanager = { "All I had hoped for ", 
    "I kept inside your car ", 
    "The rabbit in the barn ",
    "Most of all I wait ", 
    "I wait beside the door, I wait beside the door ",
    "All I was wrong trembling in the cage ", 
    "I was diamonds in the cage ", 
    "In seven hours I consider death ",
    "And your father called to yell at me ",
    "You little boy, you little boy ",
    "Found out you cheated me ",
    "I ran behind the barn and cut my hands somehow ",
    "Blood in the meadowlark ",
    "I punched your ears instead ",
    "I punched you in the head ",
    "You only laughed and laughed and laughed ",
    "How I was wrong, tingling from the kill ",
    "Tickle me until, you devil bird you evil still ",
    "Slept on my arms, I was sleeping in the sill ",
    "I was sleeping in the room with you ",
    "You little boy, you little boy ",
    "How could you run from me now? ",
    "The loneliest chime in the house ",
    "The loneliest chime in the house ",
    "You let it out you let it out ",
    "Come to me Calvary still ",
    "I'm weeding and raking until ",
    "I'm bleeding in spite of my love for you ",
    "It bruised and bruised my will ",
    "Counting alluvial plains ",
    "The breathing inside of the range ",
    "You touched me inside of my cage ",
    "Beneath my shirt your hands embraced me ",
    "Come to me feathered and frayed ",
    "For I am the ugliest prey ",
    "For I am the ugliest prey ",
    "The owl, the reckless reckless praise. ",
    "You said you'd wait for me ",
    "Down by Tannery Creek ",
    "Far out by the roadside where we used to kiss behind the sheets ",
    "Wrapped in a blanket of red ",
    "The Owl and the Tanager said ",
    "The Owl and the Tanager said ",
    "One waits until the hour is death "
  };
  
  String[] helplessnessBlues = {
    "I was raised up believing I was somehow unique",
    "Like a snowflake distinct among snowflakes",
    "unique in each way you can see",
    "And now after some thinking",
    "I'd say I'd rather be",
    "A functioning cog in some great machinery",
    "serving something beyond me",
    "But I don't, I don't know what that will be",
    "I'll get back to you someday soon you will see",
    "What's my name, what's my station",
    "oh, just tell me what I should do",
    "I don't need to be kind to the armies of night",
    "that would do such injustice to you",
    "Or bow down and be grateful and say",
    "sure, take all that you see",
    "To the men who move only in dimly-lit halls",
    "and determine my future for me",
    "And I don't, I don't know who to believe",
    "I'll get back to you someday soon you will see",
    "If I know only one thing",
    "it's that everything that I see",
    "Of the world outside is so inconceivable",
    "Often i barely can speak",
    "Yeah I'm tongue-tied and dizzy",
    "and I can't keep it to myself",
    "What good is it to sing helplessness blues",
    "why should I wait for anyone else?",
    "And I know, I know you will keep me on the shelf",
    "I'll come back to you someday soon myself",
    "If I had an orchard, I'd work till I'm raw",
    "If I had an orchard, I'd work till I'm sore",
    "And you would wait tables and soon run the store",
    "Gold hair in the sunlight, my light in the dawn",
    "If I had an orchard, I'd work till I'm sore",
    "If I had an orchard, I'd work till I'm sore",
    "Someday I'll be like the man on the screen"
  };
  
  int randColor;
  
  if(mouseIsDown == true)
  {
     randColor = int(random(50,200));
     fill(randColor,randColor,randColor);
     textFont(ArialBlack, random(0,75));
     text(owlAndTanager[int(random(0,43))],  int(random(50,250)), mouseY );
  }
  
  if(mouseIsDown == false) 
  {
    fill(255,255,255,5);
    rect(0,0, 1000,600);
  }
  
  if(keyIsDown == true)
  {
    randColor = int(random(50,200));
    fill(randColor-50,randColor,randColor);
    textFont(ArialBlack, random(0,75));
    text(helplessnessBlues[int(random(0,35))],  int(random(25,250)), mouseY );
  }
}

void mousePressed()
{
  println("meep");
  mouseIsDown = true;
}

void mouseReleased()
{
  println("derp");
  mouseIsDown = false;
}

void keyPressed()
{
 keyIsDown = true; 
}

void keyReleased()
{
  keyIsDown = false;
}

