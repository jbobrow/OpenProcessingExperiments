
int brushno;
int value;
int suit;
int pauseCounter;
PImage deck;
PImage vader;
boolean backgrounder;
boolean pause;
boolean tripwire;
String yeats;
String sample;
void setup()
{
  size(900,618);
  value = 0;
  brushno=0;
  suit = 0;
  pauseCounter=0;
  backgrounder=true;
  pause=false;
  tripwire=false;
  deck=loadImage("Carte_bergamasche.jpg");
  vader=loadImage("flamethrowerVader.gif");
  yeats=" Turning and turning in the widening gyre The falcon cannot hear the falconer Things fall apart the centre cannot hold Mere anarchy is loosed upon the world,The blood-dimmed tide is loosed, and everywhere The ceremony of innocence is drowned The best lack all conviction, while the worst Are full of passionate intensity.";
  sample="";
}



void draw() {
  
  if(backgrounder)
  {
     background(#FFFFFF);
     backgrounder=false;
  }
  noStroke();
  

if(!pause)
{
  if(keyPressed) {

    if (key == '1') 
    {
      brushno=1;
    }
    if (key == '2') 
    {
      brushno=2;
    }
    if (key == '3') 
    {
      brushno=3;
    }
    if (key == '4') 
    {
      brushno=4;
    }
  }
  
  if(brushno==1)
  {
    fill(0);
    rect(mouseX-25, mouseY-25, 50, 50);
  }
  if(brushno==2)
  {
     copy(deck, 0+value, 3+suit, 80, 142, mouseX, mouseY, 80, 142);
     if(value<720)
     {
       value+=80;
     }
     else if(value==720)
     {
       value=0;
       suit+=142;
       if(suit>426)
         suit=0;
     }
  }
  
  if(brushno==3)
  {
    if(mousePressed)
    {
      fill(random(256));
      textSize(random(96));
      sample=yeats.charAt(random(yeats.length()));
      text(sample,random(900),random(618));
    }
  }
}
  if(brushno==4&&pause)
  {
    image(vader,0,0);
    fill(0);
    textSize(48);
    text("Incineration in progress.",10,100);
    text("Please wait.",450,550);
    pauseCounter++;
    if(pauseCounter==150)
    {
      pause=false;
      backgrounder=true;
      pauseCounter=0;
    }
  }

}

void mousePressed(){
  if(brushno==4)
  {
    pause=true;
  }
}







