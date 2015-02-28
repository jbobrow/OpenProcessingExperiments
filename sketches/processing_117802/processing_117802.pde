
//53463247 Young Hiu Ting  Mini project
import ddf.minim.*;
Minim minim;
AudioPlayer bgmusic;
AudioSample horn;

int numFrames = 2;   //the total number of frame of the mouse icon 
int frame = 0;
PImage[] chara = new PImage[numFrames];

int numFrames2 = 14; //the total number of frame of the mouse icon (when pressing any key)
int frameS = 0;
PImage[] charashock = new PImage[numFrames2];

int numFrames3 =14; //the total number of frame of the special frame effect (when pressing any key)
int frameC = 0;
PImage[] charaframe = new PImage[numFrames3];

Cloud[] clouds = new Cloud [10];

void setup(){
  size(800, 600);    //set the background size
  noStroke();        //set the objects without outlines
  
  //Shift the clouds to the left
  for(int i=0; i < clouds.length; i++){
    clouds[i] = new Cloud((150*i),int(random(0,600)));
  }
  
  //load the sound effect and the background music files
  minim = new Minim(this);
  horn = minim.loadSample("comedy_single_toot_of_a_bicycle_horn.mp3"); 
  bgmusic = minim.loadFile("file-05.mp3"); 
  bgmusic.loop();     //loop the background music
  
  createFrame();     //the function name of special frame effect
  frameRate(6);
}

void draw(){
  background(102,204,255);    //set background color to bright blue
  
  for (int i=0; i < clouds.length; i++){
    clouds[i].createcloud();
  }
  
  imageMode(CENTER);
  mouseIcon();       //the function name of the mouse icon
  
  imageMode(CORNER);
  
  //set the special frame effect exist when pressing any key
  if (keyPressed == true){
    frameC = frameC+1;
    image(charaframe[frameC % numFrames3], 0, 0);
  }else{
   image(charaframe[0], 0, 0);
  }
}

//you can click the mouse to press the horn
void mousePressed(){  
  horn.trigger();
}

//defining a function of the mouse icon
//This is a character that I created for the mouse icon
void mouseIcon(){ 
  chara[0] = loadImage("character0001.png");
  chara[1] = loadImage("character0002.png"); 
  
  charashock[0] = loadImage("character_shock0001.png");
  charashock[1] = loadImage("character_shock0002.png");
  charashock[2] = loadImage("character_shock0003.png");
  charashock[3] = loadImage("character_shock0004.png");
  charashock[4] = loadImage("character_shock0005.png");
  charashock[5] = loadImage("character_shock0006.png");
  charashock[6] = loadImage("character_shock0007.png");
  charashock[7] = loadImage("character_shock0008.png");
  charashock[8] = loadImage("character_shock0008.png");
  charashock[9] = loadImage("character_shock0008.png");
  charashock[10] = loadImage("character_shock0008.png");
  charashock[11] = loadImage("character_shock0008.png");
  charashock[12] = loadImage("character_shock0008.png");
  charashock[13] = loadImage("character_shock0008.png");

//the mouse icon will change its facial expression when you press any key
  if (keyPressed == true){
    frameS = (frameS+1) % numFrames2;
    image(charashock[frameS % numFrames2], mouseX, mouseY);
  }else{
   frame = (frame+1) % numFrames;
   image(chara[frame % numFrames], mouseX, mouseY);
  }
}

//defining a function of the special frame effect 
void createFrame(){
  charaframe[0] = loadImage("chara_frame0000.png");
  charaframe[1] = loadImage("chara_frame0001.png");
  charaframe[2] = loadImage("chara_frame0002.png");
  charaframe[3] = loadImage("chara_frame0003.png");
  charaframe[4] = loadImage("chara_frame0004.png");
  charaframe[5] = loadImage("chara_frame0005.png");
  charaframe[6] = loadImage("chara_frame0006.png");
  charaframe[7] = loadImage("chara_frame0006.png");
  charaframe[8] = loadImage("chara_frame0006.png");
  charaframe[9] = loadImage("chara_frame0006.png");
  charaframe[10] = loadImage("chara_frame0006.png");
  charaframe[11] = loadImage("chara_frame0006.png");
  charaframe[12] = loadImage("chara_frame0006.png");
  charaframe[13] = loadImage("chara_frame0006.png");
}

//draw the clouds and make them floating on the sky from the left 
//to the right randomly and continuosly
class Cloud{
  int xPos;
  int yPos;
  
  Cloud(int _xPos, int _yPos){
    this.xPos = _xPos;
    this.yPos = _yPos;
  }

void createcloud(){
  pushMatrix();
  if(xPos > width){
    xPos = -400;
  }else{
      xPos+= random(100);
    }
    
  translate(xPos, yPos);
  ellipse(0, 5, 60, 60);
  ellipse(80, 0, 60, 60);
  ellipse(20, 30, 60, 60);
  ellipse(60, 25, 60, 60);
  ellipse(40, -20, 60, 60);
  popMatrix();
  }
}

//Source of the music:
//file-05.mp3 - http://downloads.khinsider.com/game-soundtracks/album/loco-roco
//comedy_single_toot_of_a_bicycle_horn.mp3 - http://www.freesfx.co.uk/sfx/horn?p=3



