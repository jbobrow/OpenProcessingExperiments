

// a stroker is an object that can draw a background (with draw)
// and a foreground (with stroke) 
interface Stroker
{
  public void paint();
  public void background(float speed);
}


// An audiocard is a square object with a sound, and a stroke 
// associate to it  
class AudioCard
{
  int mouseXStart;  //where I put the card
  int mouseYStart;  //where I put the card
  int dimension=75; // the (fixed by default) dimension of the card
  int rPsv=0xff;  // passive Color red component
  int gPsv=0;     // passive Color green component
  int bPsv=0xff;  // passive Color blue component
  int rAct=0;     // active Color red component
  int gAct=0xff;  // active Color green component
  int bAct=0;     // active Color blue component
  int rCur;       // current Color red component
  int gCur;       // current Color green component
  int bCur;       // current Color blue component
  String audio;   // the audio filename
  Stroker stroker=null;   // the drawing object
  boolean active=false;   // whether the card is active or not (initially not)
  float speed;            // the speed of audio and video
  AudioPlayer player;     // the audio player
  
  /* constructor, pass the upper left coordinate 
   * the audio name and the stroker
  */
  AudioCard (int mouseX, int mouseY, String audio, Stroker str)
  {
    this.mouseXStart=mouseX;
    this.mouseYStart=mouseY;
    this.audio=audio;
    this.player = maxim.loadFile(audio);
    this.stroker=str; 
    this.active=false;
    this.rCur=rPsv;
    this.gCur=gPsv;
    this.bCur=bPsv;
    this.speed=1;
  }
  
  // drawn the card shape and - if active - the background drawing 
  // associated with the stroker, if it exists (note the speed 
  // parameter: it is used to associate the speed of the video to that of the 
  // audio)
  void background()
  {
    noStroke();
    fill(rCur,gCur,bCur);
    rect(mouseXStart,mouseYStart,dimension,dimension);
    if (stroker!=null && active) stroker.background(speed);
  }
  
  // draw the stroker's stroke, if it is active and stroker exists
  void paint()
  {
    if (stroker!=null && active) stroker.paint();
  }
  
  // what to do when the mouse is clicked
  void onMouseClick(int x, int y)
  {
    
    // if it is clicked in card's area
    if(mouseXStart<x && x<(mouseXStart+dimension) &&
       mouseYStart<y && y<(mouseYStart+dimension) ) 
    {
      // togle active/passive status
       active=!active;
       
       if (active)
       {
           // if active play and switch the color to active
            player.play();
            speed=1;
            player.speed(speed);
            player.setLooping(true);
            rCur=rAct;
            gCur=gAct;
            bCur=bAct;
       }
       else
       {
           // if not active stop playing and 
           // switch the current color to passive
           player.stop();
            rCur=rPsv;
            gCur=gPsv;
            bCur=bPsv;
       }
    }
  }
  
  // if the mouse is moving on the card
  void onMouseMove(int x, int y, int px, int py)
  {
    // if the card is active and the area is the card's none
    if(active && mouseXStart<x && x<(mouseXStart+dimension) &&
       mouseYStart<y && y<(mouseYStart+dimension) )
      { 
      // set the speed mapping the horizontal mouse position 
      // relative to the card's left and right boundaries
      // change player speed and colour the card accordingly  
      speed = map(x,mouseXStart,mouseXStart+dimension,0,2);
      player.speed(speed);
      float cursor=map(x,mouseXStart,mouseXStart+dimension,-127,127);
      if (cursor<0) {rCur=(int)(-2*cursor);bCur=0;}
      if (cursor>0) {bCur=(int)(2*cursor);rCur=0;}
      }
      
  }
  
}

class BlackBoard
{
  int xStart,yStart;
  int dimension;
  int swapSpeed=10;
  int red,green,blue;
  
  BlackBoard(int x,int y,int d,int s,int r,int g,int b)
  {
    xStart=x;
    yStart=y;
    dimension=d;
    swapSpeed=s;
    red=r;
    green=g;
    blue=b;
  }
  void background()
  {
    noStroke();
    fill(red,green,blue,swapSpeed);
    rect(xStart,yStart,dimension,dimension);
  }
}


Maxim maxim;
float alpha;
AudioCard []acs={null,null,null,null};
BlackBoard bb;
static int SCREEN_DIM=385;
PImage [] images;

void setup()
{
  size(SCREEN_DIM+10, SCREEN_DIM+100);
  maxim = new Maxim(this);
  images = loadImages("movie", ".jpg", 497);
  bb = new BlackBoard(0,0,SCREEN_DIM,10,0,0,0);

  
  acs[0] = new AudioCard( 10,400
      ,"birds.wav"
//      ,new Stroker() {public void paint(){line(pmouseX,pmouseY,mouseX,mouseY);}public void background(float speed){}}
      ,new Stroker() {
        PImage []birds={loadImage("bird1.png"),loadImage("bird2.png"),loadImage("bird3.png")};
         int count=0;
        public void paint(){
           if (count==0)
           {
          image(birds[0],mouseX+4,mouseY+4,(mouseX-pmouseX)*2,(mouseX-pmouseX)*2);
          image(birds[1],mouseX+15,mouseY-15,(mouseY-pmouseY)*2,(mouseY-pmouseY)*2);
          image(birds[2],mouseX-30,mouseY-10,30,30);
           }
           if (15<count++) count=0;
          //line(pmouseX,pmouseY,mouseX,mouseY);
      }
      public void background(float speed){}}
      );
  acs[1] = new AudioCard(110,400
      ,"dogs.wav"
//      ,new Stroker() {public void paint(){line(SCREEN_DIM/2+((SCREEN_DIM/2)-pmouseX),pmouseY,SCREEN_DIM/2+((SCREEN_DIM/2)-mouseX),mouseY);}public void background(float speed){}}
      ,new Stroker() {
         PImage []dogs={loadImage("dog1.png"),loadImage("dog2.png"),loadImage("dog3.png")};
         int count=0;
         public void paint(){
           if (count==0)
           {
            image(dogs[0],mouseX-4,mouseY+14,10,10);
            image(dogs[1],mouseX+25,mouseY+25,20,20);
            image(dogs[2],mouseX-20,mouseY-30,30,30);
           }
           if (20<count++) count=0;
         }
         public void background(float speed){}
       }
      );
  acs[2] = new AudioCard(210,400
      ,"water.wav"
//      ,new Stroker() {public void paint(){line(pmouseX,SCREEN_DIM/2+((SCREEN_DIM/2)-pmouseY),mouseX,SCREEN_DIM/2+((SCREEN_DIM/2)-mouseY));}public void background(float speed){}}
/*      ,new Stroker() {
         PImage []drops={loadImage("drop1.png"),loadImage("drop2.png"),loadImage("drop3.png")};
         int count=0;
         public void paint(){
           if (count==0)
           {
            image(drops[0],mouseX+10,mouseY+11,10,10);
            image(drops[1],mouseX-15,mouseY-15,6,6);
            image(drops[2],mouseX+20,mouseY+30,5,5);
           }
           if (20<count++) count=0;
         }
         public void draw(float speed){}
       }
*/
      ,new Stroker() {
        public void paint(){
          float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
          float lineWidth = map(speed, 0, 10, 10, 1);
          lineWidth = constrain(lineWidth, 0, 10);
          strokeWeight(lineWidth);
          float red = map(mouseX, 0, SCREEN_DIM, 0, 255);
          float blue = map(mouseY, 0, SCREEN_DIM, 0, 255);
          float green = dist(mouseX,mouseY,width/2,height/2);
          stroke(red, green, blue, 255);
          line(pmouseX,pmouseY,mouseX,mouseY);
        }
      public void background(float speed){}}
      );
  acs[3] = new AudioCard(310,400
      ,"flies.wav"
//      ,new Stroker() {public void paint(){line(SCREEN_DIM/2+((SCREEN_DIM/2)-pmouseX),SCREEN_DIM/2+((SCREEN_DIM/2)-pmouseY),SCREEN_DIM/2+((SCREEN_DIM/2)-mouseX),SCREEN_DIM/2+((SCREEN_DIM/2)-mouseY));}}
      ,new Stroker() {
        PImage []flies={loadImage("fly1.png"),loadImage("fly2.png"),loadImage("fly3.png")};
        int count=0;
        float pos=0;
         public void paint(){
           if (count==0)
           {
            image(flies[0],mouseX-10,mouseY+11,10,10);
            image(flies[1],mouseX+25,mouseY-25,20,20);
            image(flies[2],mouseX-30,mouseY+30,30,30);
           }
           if (10<count++) count=0;
         }
        public void background(float speed) {
             image(images[(int)pos], 0, 0, SCREEN_DIM, SCREEN_DIM/2);
             pos +=speed;
             if (pos>=images.length) pos =0;
        }
      }
      );
}

void draw()
{
  bb.background();
  for(int i=0;i<acs.length;i++) acs[i].background();

}

void mouseDragged()
{
  if (pmouseX>SCREEN_DIM || mouseX>SCREEN_DIM || pmouseY>SCREEN_DIM || mouseY>SCREEN_DIM)
  {
    for(int i=0;i<acs.length;i++) acs[i].onMouseMove(mouseX,mouseY,pmouseX,pmouseY);
    return ;
  }
  
  for(int i=0;i<acs.length;i++) acs[i].paint();

}

void mouseClicked()
{
  for(int i=0;i<acs.length;i++) acs[i].onMouseClick(mouseX,mouseY);
 
}


