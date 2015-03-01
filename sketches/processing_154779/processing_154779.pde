
//The MIT License (MIT) - See Licence.txt for details

//Vividha Goyal

Maxim maxim;
AudioPlayer player;
AudioPlayer player1;
boolean playing=false;
int m;
int m1;
int m2;
int interval = 0;
int currentFrame = 0;
float JennyFrame = 0.0;
// int m1 = 0;
PImage img;
PImage img1;
PImage [] images;
PImage [] Jenny;
PImage img_play_pause;
int i = 0;       // initial X value of Scissors
float j = 50.0; // initial Y position of Scissors
int cutb = 0;  //status of balloon
int bal_center_x ; 
int bal_center_y ;
float speedAdjust=1.0;

PImage[] loadImages(String path, String extension, int count) 
  {
    PImage[] temp = new PImage[count];
    for (int i=0; i<count; i++) {
        temp[i] = loadImage(path + i + extension);
  }
    return temp;
}


void setup()
{
  size(900, 600);
    
  images = loadImages("CloudsAndGrass", ".jpg", 28);
  Jenny = loadImages("Girl", ".png", 4);
  img = loadImage("vivi7.jpg");
  img_play_pause= loadImage("icon.png");
  img1 = loadImage("sad_jenny.png");
  maxim = new Maxim(this);
  player = maxim.loadFile("pop.wav");
  player.setLooping(false);
  player1 = maxim.loadFile("mykbeat.wav");
  player1.setLooping(true);
   
}


void draw()
{

  m = millis();  // Used to track time to give 3 seconds delay to start
  player1.speed(speedAdjust);
  Background();
  
  image(img_play_pause,width-150,height/6,100,100);
 
  if(playing){
 
    print ("cutb = ",cutb);
  if (cutb == 0) 
    { 
      showJenny(); 
      line(pmouseX, pmouseY, 765, 445);
      fill(0,255,0);
      ellipse(pmouseX, pmouseY, 100,100);
    }
  else  // balloon cut
    { 
     print ("Balloon is cut"); 
      baloon_cut() ; //Rope cut, perform functions at the time of cut
    }
    
    
  if (m>3000)    {sci();} // 3 seconds delay for the scissors to appear, so that player can adjust the balloon.
 }}



// Scissors function
void sci()
  {
    strokeWeight (2);
    if (cutb ==0) 
      { 

        line(i, j,i+50 ,j);
        cuts();  //checks if scissors pass through the rope
         i = i + 10;

         if (i == 850)  //Check if right edge reached
           {j= random(50,600); i = 0; } //randomise position of next appearance of scissors
      }
}



void baloon_cut()
{
  fill(255,0,0);
  ellipse(bal_center_x, bal_center_y,100, 100);
  line (450,850,750,450); 
  image(img1,730,380,Jenny[(int)JennyFrame].width/2+10,Jenny[(int)JennyFrame].height/2+10);
  bal_center_y = bal_center_y - 5;
 player1.stop();
PopSound ();
}




void cuts()
  {
    //equation of balloon string, slope = (Y2-Y1)/(X2-X1)
 
    float slope = (765.0 - pmouseX)/(445.0 - pmouseY); //765 and 445 are coordinates 
    if (j <=445) 
      {
        if (j > pmouseY)
          {
             float x = slope * (j - pmouseY) + pmouseX;  // x is x coordinate of intersection point
             // if x <= i+50 then scissors pass through the intersection point and cuts the rope
              if (abs(i+50 - x) <= 10)
                { 
                   cutb = 1;  // Set status to 1
                   bal_center_x = pmouseX;
                   bal_center_y = pmouseY;
                   PopSound();
                   //playing=false;
                }           
          }
      } 
    else //j > 445
    if (j < pmouseY)
    {
     float x = slope * (j - pmouseY) + pmouseX;  // x is x coordinate of intersection point
     // if x <= i+50 then scissors pass through the intersection point and cuts the rope
       if (i+50 - x <= 10)
        {
           cutb = 1;  // Set status to 1
           bal_center_x = pmouseX;
           bal_center_y = pmouseY;
           PopSound();
           //playing=false;
        }
     }
 }






void PopSound()
{
// Sound when string is cut
  player.cue(0);
  player.play();
}



void Background ()
{
interval = images.length * 50;
print ("interval= ",interval," ");
 image(images[(int)currentFrame], 0, 0, 900, 600);
 
 // print ("m",m);
// print ("m1 = ", m1);
 // print ("m1-m = ", m-m1,"\n");
  if (m-m1 >interval) 
  {
    currentFrame= currentFrame+1;
    m1 = m;
    print ("currentFrame = ", currentFrame, " ");
    
    if(currentFrame==27)
      {currentFrame=0; }
    
  }
}


void showJenny()
{
//int interval = Jenny.length * 1000;

//int interval = 3000;

 image(Jenny[(int)JennyFrame], 730,380,Jenny[(int)JennyFrame].width/2+10,Jenny[(int)JennyFrame].height/2+10);
     if(m-m2>100)
     {
       JennyFrame=JennyFrame+1.0*speedAdjust;//JennyFrame= JennyFrame+1;
       m2=m;
       if(JennyFrame==4||JennyFrame>4) 
         {JennyFrame=0;}    
     }
}



void mousePressed()
{
 
  cutb=0;
 j= random(50,600); i = 0; 


if(dist(mouseX, mouseY, (width-150)+50, (height/6)+50) < (50))
  {
    
    playing = !playing;
  }

  if (playing) {
    player1.play();
   } 
  else {

    player1.stop();
}}



void BackgroundSound()
{
// Sound when string is cut
 speedAdjust=map(mouseX,0,width,0,2);  
 player1.speed(speedAdjust);
  player1.cue(0);
  player1.play();
  //image(img_play,0,0,150,150);
}


void mouseDragged(){
  
    speedAdjust=map(mouseX,0,width,0,2);  
    //player1.speed(speedAdjust);
}


