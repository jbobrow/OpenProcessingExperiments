
final int MAX = 15;

PImage start;
PImage back;
PImage [] filipe;
String [] time = { "0", "7.00 AM", "7.59 AM", "8.30 AM", "8.45 AM", "9.00 AM", "10.00 AM", "1.00 PM", "3.00 PM", "5.00 PM" , "6.00 PM", "7.00 PM", "7.34 PM", "10.00 PM", "SOMETIME"};
String [] caption = { "0", "Filipe gracefully wakes to the rising sun", "Filipe less gracefully wakes to his alarm", 
"Filipe enjoys a hot shower", "Filipe grabs a quick and healthy breakfast", "Filipe is off to work", "Filipe codes using Processing!", "Filipe continues coding", 
"Filipe hunts for the syntax error", "Filipe gets distracted by his own beauty", "Filipe gets back to coding", "Filipe is finally home", 
"Filipe cooks!", "Filipe goes to sleep", "Filipe terroizes Pittsburgh"};

PFont AWC;
PFont DIN;
PFont HN;

int scene; 



void setup()
{
start = loadImage("first.jpg");
scene = 0;
  
back = loadImage("background.jpg");
size(500, 534);

AWC = loadFont("AWCInline.vlw");
DIN = loadFont("DINLight48.vlw");
HN  = loadFont("HelveticaNeue.vlw");
smooth();
filipe = new PImage[MAX];
  for(int i= 0; i < filipe.length; i++)
  {
  String filipeName = "filipe" + (i+1) + ".jpg";
  filipe[i] = loadImage(filipeName);
  }
}

void draw()
{

  if(scene == 0)
  {
  image(start, 0, 0);
      if(dist(mouseX, mouseY, 255, 175) < 100)
      {
       ellipseMode(CENTER);
       noStroke();
       fill(200,150,100,60);
       ellipse(255,175, 200, 200); 
      }
      if (mousePressed)
      {
           if(dist(mouseX, mouseY, 255, 175) < 100)
           {
           scene = scene + 1;
            } 
       }
    
   }
   
   if(scene > 0)
   {
    background(back); 
    sceneDisplay();
    
   }
   
}



void sceneDisplay()
{
int i = scene;
  image(filipe[i], 100, 100);
  textFont(AWC);
  textAlign(CENTER);
  fill(150);
  text(time[i], width/2, 70);
  textFont(DIN);
  textSize(20);
  text(caption[i],width/2, 450);
  
  if(scene < 14)
  {
   fill(200);
   triangle(410, 220, 410, 280, 440, 250); 
   if(mouseX > 410 && mouseX < 440 )
   {
      if(mouseY > 220 && mouseY < 280)
       {
        fill(200,150,100,60);
        triangle(410, 220, 410, 280, 440, 250); 
        } 
     
   }
   
   if(scene > 1)
     {
     fill(200);
     triangle(90, 220, 90, 280, 60, 250);
       if(mouseX > 60 && mouseX < 90)
        {
           if(mouseY > 220 && mouseY < 280)
             {
              fill(200,150,100,60);
              triangle(90, 220, 90, 280, 60, 250);
             }
        } 
     }
      
  }
  
}

 void mouseClicked()
   {
     if(scene < 14)
     {
     if(mouseX > 410 && mouseX < 440 )
   {
      if(mouseY > 220 && mouseY < 280)
     {
      scene = scene + 1;
     }
   }
     }
     
     if(scene > 1)
     {
      if(mouseX > 60 && mouseX < 90)
  {
   if(mouseY > 220 && mouseY < 280)
   {
    scene = scene - 1;
   }
   }
   }
   }

