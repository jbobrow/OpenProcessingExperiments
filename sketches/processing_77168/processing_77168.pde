
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/76996*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
float obamaOH[]   = {51,44,49,46,49,38,50,47,48,45,46,49,44,45,50,48,44,45,47,47,48,47,50,48,45,44,50,49,45,50,50,48,47,51,48,49,53,52,51,49,51,50,51,47,45,51,46,48,51,45};
float romneyOH[]  = {47,42,42,42,46,44,38,41,40,39,42,44,42,44,43,42,46,48,38,44,45,45,44,45,45,46,44,46,45,45,43,47,46,46,44,42,43,44,42,45,43,49,47,48,44,45,42,47,46,42};
float daysOH[]    = {309.0,297.5,281.5,271.0,269.5,267.0,249.5,228.0,225.0,204.0,202.0,199.0,192.0,185.5,185.5,171.5,161.0,156.5,137.0,136.5,118.0,111.0,102.0,87.5,85.0,84.5,80.0,79.5,78.0,59.0,57.0,56.0,55.0,51.5,50.0,50.0,46.0,46.0,43.0,38.5,36.5,33.0,30.5,30.5,30.5,29.0,29.0,27.0,24.5,23.5};
float obamaFL[]   = {51,43,45,42,44,49,47,46,49,50,45,45,45,43,46,41,48,50,45,46,45,45,46,45,48,51,48,47,43,49,50,48,48,49,48,47,49,48,53,51,50,50,46,47,47,49,48,44,46,47,48,47};
float romneyFL[]  = {48,46,45,47,48,41,44,43,42,45,43,47,46,44,45,47,44,46,49,42,41,46,45,48,43,45,47,48,45,46,46,47,44,44,46,48,44,47,44,47,45,46,43,46,49,45,47,51,49,51,49,44};
float daysFL[]    = {309,304,289,287,285,284,270,238,228,206,204,199,195,192,183,172,171,157,156,144,137,120,119,118,111,102,101,84,83,80,74,66,59,57,55,50,50,49,46,46,46,45,38,36,33,32,29,28,27,26,24,22};

float time = 0.;                  
float speed = 0.05;

PFont f;
PImage ob,rom,fl,bg;

int numFrames = 11; 
int frame = 0;
PImage[] obHappy = new PImage[11];
PImage[] obSad = new PImage[30];
PImage[] romHappy = new PImage[16];
PImage[] romSad = new PImage[30];


void setup() {
  
    frameRate(30);
    size(400, 600);

 f = createFont("Gill Sans Ultra Bold", 22, true); 
 rom = loadImage ("20.png");
 fl = loadImage ("florida.png");
 
   for (int i = 0; i < obHappy.length; i ++)
   {
      obHappy[i] = loadImage( "obHappy" + i +".png");
   } 
   
   for (int i = 0; i < obSad.length; i ++)
   {
      obSad[i] = loadImage( "obSad" + i +".png");
   }
   
   for (int i = 0; i < romHappy.length; i ++)
   {
      romHappy[i] = loadImage( "romHappy" + i +".png");
   } 
   
   for (int i = 0; i < romSad.length; i ++)
   {
      romSad[i] = loadImage( "romSad" + i +".png");
   }
}


void draw() {

   background(230); 
   smooth();  
   
    time += speed;                   
    
    int index1 = (int)time % obamaFL.length;    // get integer part of "time", keep it in range
    int index2 = (index1 + 1) % obamaFL.length; // next index
    float interp = time - (int)time;       // get fractional part of "time"
    
    ////////////////   OBAMA
    float obama = obamaFL[index1] + interp * (obamaFL[index2] - obamaFL[index1]);
    
    float ypos = height - obama * 4.; // 100 points in poll, 400 pixels = height
    fill(0, 0, 255);
    rect(0, ypos, 200, 400);
     image(fl,10,ypos+5, 160,110);
     textFont(f, 16);
     fill(0);
    text("Florida", 40,ypos); 
    
      ////////////////    DRAW LABELS
    textFont(f, 20);
    textAlign(CENTER);
    fill(0,0,255);
    text("OBAMA", 55, 30);
    fill(255,0,0);
    text("ROMNEY", 330, 30);
    textFont(f, 14);
    text(daysFL[index1], 200, 30);
    textFont(f, 12);
    fill(0);
    text("days before election", 200, 50);
    
    ////////////////   ROMNEY
    float romney = romneyFL[index1] + interp * (romneyFL[index2] - romneyFL[index1]);
    
    ypos = height - romney * 4.; // 100 points in poll, 400 pixels = height
     fill(255, 0, 0);
    noStroke();
    rect(200, ypos, 200, 400);

  image(fl,210,ypos+5, 160,110);
  textFont(f, 16);
     fill(0);
    text("Florida", 240,ypos);   
    //romney loop;
    //image (rom, 150,100,300,225);

    if(obama > romney)
    {
      image (obHappy[frame % obHappy.length], -50,100,300,225);
       image (romSad[frame % romSad.length], 150,100,300,225);
    }
  else
  {
      image (obSad[frame % obSad.length], -50,100,300,225);
       image (romHappy[frame % romHappy.length], 150,100,300,225);
  }
      
     frame = frame + 1;  

   // frame = (frame+1) % numFrames;  // Use % to cycle through frames

   }

      


