
int v = 0;
int x = 0;
float y =50;
float a = 2;
int sentchange =0;
int sentChangeFrames = 19;
int numFrames=19;
int frame = 0;
String [] TYPE = new String[sentChangeFrames];
PImage [] images = new PImage [numFrames];

PFont f;

void setup()
{
  f = createFont("Arial",10,true);
  size(500,120);
  frameRate(11);
  TYPE[0] = "Huh what are you doing in here? Are you some burglar or something?";
TYPE[1] = "Nah you're probably not, you look like a programmer!";
TYPE[2] = "Huh? You want to know more about me?";
TYPE[3] = "Nah I'm not telling you~";
TYPE[4] = "Because I don't know you and you don't know me brochacho~";
TYPE[5] = "Alright maybe later hmhm~";
TYPE[6] = "Oh but one thing! Don't tug on my cat ears";
TYPE[7] = "Seriously don't! They're real! Not kidding!";
TYPE[8] = "Huh? You want to pet them... Sorry but I'm not a kitty cat~";
TYPE[9] = "You see that glitch right there?";
TYPE[10] = "Sorry, but that's the programmer being lazy,  its maddening yeah~";
TYPE[11] = "Huh? Wait what's up... why am I like this?";
TYPE[12] = "Sowee~ I really can't tell you!";
TYPE[13] = "Because it would be too lengthy of a conversation!";
TYPE[14] = "And... well... you better not think about it in a gross way... seriously.";
TYPE[15] = "UH... w-wait... what's that in your hand?...";
TYPE[16] = "Is it a cookie?";
TYPE[17] = "...Must.... have..... cookie!";
TYPE[18] = "Click to restart... please";

  images[0] = loadImage("Capture.PNG");
  images[1] = loadImage("Capture2.PNG");
  images[2] = loadImage("Capture3.PNG");
  images[3] = loadImage("Capture4.PNG");
  images[4] = loadImage("Capture5.PNG");
  images[5] = loadImage("Capture6.PNG");
  images[6] = loadImage("Capture7.PNG");
  images[7] = loadImage("Capture8.PNG");
  images[8] = loadImage("Capture9.PNG");
  images[9] = loadImage("Capture10.PNG");
  images[10] = loadImage("Capture11.PNG");
  images[11] = loadImage("Capture12.PNG");
  images[12] = loadImage("Capture13.PNG");
  images[13] = loadImage("Capture14.PNG");
  images[14] = loadImage("Capture15.PNG");
  images[15] = loadImage("Capture16.PNG");
  images[16] = loadImage("Capture17.PNG");
  images[17] = loadImage("Capture18.PNG");
  images[18] = loadImage("capture19.PNG");
  
  
}
void draw()
{
  background(245);
  for(int t =0; t <370; t+=1000)//x // MOVING GREEN LOAD IN
 {
   for(int o= 0; o <100; o++)//y
   {
     
   fill(220, 220, 100, v+10);
   rect(v,o,40,40);
   } 
   v = v+8;
 }
  
  
  rect(0,0, 300,100);
    fill(30);
  rect(0,90,500, 500);
  rect(370,0, 200,200);
  stroke(0);
  strokeWeight(4);
  fill(255);
  rect(190,180, 140,140);



  if(mousePressed == true)
  {
    frame= frame +1;
  
  }
  if(mousePressed)
  {
    sentchange = sentchange +1;
    
    //Somehow make text appear in sketch
  }
  
  if(sentchange >=sentChangeFrames)
  {
    sentchange = 0;
  }
/* frame= frame + 1; */
 if(frame >=  numFrames)
 {
   frame = 0;
 }
 
 image(images[frame], 370, 0);// places frame at cooridnate
 noStroke();
 x = x+1;//TYPING INDICATOR
   
   if(x > 1)
   {
     fill(255);
   }
   if(x > 3)
   {
     fill(20);
   }
   
   if(x >5)
   {
          x= 0;
   }
  rect(10,95,2,25);
  
  
 if(mousePressed == false)
 {
   fill(255);
   text(TYPE[sentchange],10, 100);  //should print text each frame.
 }
   
 

}

