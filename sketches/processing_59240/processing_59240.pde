
//revision:
// 1.set image to center
// 2.add grass
// 3.background images
// 4.add tentacles.

PImage building;
PImage milan;
PImage glass;
PImage cctv;
PImage rrl;
PImage pyramid;
PImage iarray[];
ArrayList history = new ArrayList();
float distthresh = 60;
int numFrames = 7;
int curimage=0;
PImage[] images = new PImage[numFrames];
int frame = 0;
float thick=5;
 
void setup()
{
  
  size(800, 800);
 
  smooth();
  images [0] = loadImage("birds-4.png");
  images [1] = loadImage("lips.png");
  images [2] = loadImage("elephant.png");
  images [3] = loadImage("foot.png");
  images [4] = loadImage("grass.png");
  images [5] = loadImage("monster.png");
  images [6] = loadImage("dog.png");//load decorations
  
  iarray = new PImage[6];
  building = loadImage("NYC.png");
  iarray[0]=building;
  milan = loadImage("milan.png");
  iarray[1]=milan;
  glass = loadImage("glass.png");
  iarray[2]=glass;
  cctv = loadImage("cctv.png");
  iarray[3]=cctv;
  rrl = loadImage ("rrl.jpg");
  iarray[4]=rrl;
  pyramid = loadImage("pyramid.png");
  iarray[5]=pyramid;
  //load background images
   background(iarray[curimage]);
}
 
void draw()//press any key other than e or t to stop drawing tool
{ 
  if (key== 't')//draws trees
  {
    frameRate(200);
    stroke(random(255), random(255), random(255), 75);
    strokeWeight(2);
    line(pmouseX, pmouseY,
    mouseX + random(-20, 20),
    mouseY + random(-20, 20));
  }
}

void mouseDragged()
{
  if (key== 'p')//paints pink graffiti
  {
    strokeWeight(thick);
    //stroke(66, 76, 111, 50);
    stroke(255, 31, 117);
    PVector d = new PVector(mouseX,mouseY,0);
    history.add(0,d);
 
    for (int p=0; p<history.size(); p++)
    {
      PVector v = (PVector) history.get(p);
      float joinchance = p/history.size() + d.dist(v)/distthresh;
      if (joinchance < random(0.4))  line(d.x,d.y,v.x,v.y);
    }
  } 


  if (key== 'y')//paints yellow graffiti
  {
    strokeWeight(thick);
    stroke(248, 248, 52);
    //stroke(200, 5,300, 322);
    PVector d = new PVector(mouseX,mouseY,0);
    history.add(0,d);
 
    for (int p=0; p<history.size(); p++)
    {
      PVector v = (PVector) history.get(p);
      float joinchance = p/history.size() + d.dist(v)/distthresh;
      if (joinchance < random(0.4))  line(d.x,d.y,v.x,v.y);
    }
  }
    
      if (key== 'v')//paints violet graffiti
  {
    strokeWeight(thick);
    stroke(60, 17, 155);
    //stroke(200, 5,300, 322);
    PVector d = new PVector(mouseX,mouseY,0);
    history.add(0,d);
 
    for (int p=0; p<history.size(); p++)
    {
      PVector v = (PVector) history.get(p);
      float joinchance = p/history.size() + d.dist(v)/distthresh;
      if (joinchance < random(0.3))  line(d.x,d.y,v.x,v.y);
    }
  }
 
  if (key== 's')//draws shaded circles
  {
    strokeWeight(random(30));
    stroke(random(255), random(255), random(255), 75);
    point(mouseX+(random(-5,10)), mouseY+(random(-5, 10)));
  }
 
  else if (key== 'c')//draws clouds
  {
    noStroke();
    if (mouseY <= 100)
      fill(random(150, 220), 76);
    if (mouseY >= 101 && mouseY <= 170)
      fill(random(180, 230), 80);
    if (mouseY >= 171 && mouseY <= 200)
      fill(random(180, 200), 100); 
 
    ellipse(mouseX, mouseY, random(25, 40), random(0, 40));
    ellipse(mouseX, mouseY, random(0, 25), random(5, 40));
    ellipse(mouseX+5, mouseY+5, random(5, 40), random(0, 25));
    ellipse(mouseX+5, mouseY+5, random(1, 6), random(6,8));
  }
  
    } 


void keyPressed()
{
  if (key == CODED) {  
     if (keyCode == RIGHT) {
       if (curimage<5) {
        curimage++;
    }
     else if (curimage==5){
       curimage=0; }}

 
 if (keyCode == LEFT) {
       if (curimage>0) {
        curimage--;
         }
     else if (curimage==0){
       curimage=5; }}
       background(iarray[curimage]);
       history.clear();
     }//shift between images;
     
  if (key== 'l') //draws garbage at mouse location; fix: next img, blend
  {
    {
      frame = 1;
      blend(images[frame], 0, 0, images[frame].width, images[frame].height,
      mouseX-images[frame].width/2, mouseY-images[frame].height/2,
      images[frame].width, images[frame].height, DARKEST);
      //blend(images[frame+1], 0, 0, images[frame+1].width, images[frame+1].height, mouseX, mouseY, images[frame+1].width, images[frame+1].height, DARKEST);
  }
    
  }  
    if (key== 'b') //draws birds at mouse location; fix: next img, blend
  {
    {
      //frame = (frame) % numFrames;
      frame = 0;
       blend(images[frame], 0, 0, images[frame].width, images[frame].height,
      mouseX-images[frame].width/2, mouseY-images[frame].height/2,
      images[frame].width, images[frame].height, DARKEST);
    }  
  }
  
     if (key== 'e') //draws elephant at mouse location; fix: next img, blend
  {
    {
      //frame = (frame) % numFrames;
      frame = 2;
       blend(images[frame], 0, 0, images[frame].width, images[frame].height,
      mouseX-images[frame].width/2, mouseY-images[frame].height/2,
      images[frame].width, images[frame].height, DARKEST);
    }  
  }
  
       if (key== 'f') //draws rat at mouse location; fix: next img, blend
  {
 
      //frame = (frame) % numFrames;
      frame = 3;
       blend(images[frame], 0, 0, images[frame].width, images[frame].height,
      mouseX-images[frame].width/2, mouseY-images[frame].height/2,
      images[frame].width, images[frame].height, DARKEST);
  
  }
  
 
  if (key== 'm') //draws rat at mouse location; fix: next img, blend
  {
    {
      //frame = (frame) % numFrames;
      frame = 5;
      blend(images[frame], 0, 0, images[frame].width, images[frame].height,
      mouseX-images[frame].width/4, mouseY-images[frame].height*5/6,
      images[frame].width, images[frame].height, SUBTRACT);
  }  
  }
  if (key== 'g') //draws grass at mouse location; fix: next img, blend
  {
    frame = 4;
       blend(images[frame], 0, 0, images[frame].width, images[frame].height,
      mouseX-images[frame].width/2, mouseY-images[frame].height/2,
      images[frame].width, images[frame].height, DARKEST);
  }
      
        if (key== 'd') //draws grass at mouse location; fix: next img, blend
  {
    frame = 6;
       blend(images[frame], 0, 0, images[frame].width, images[frame].height,
      mouseX-images[frame].width/2, mouseY-images[frame].height/2,
      images[frame].width, images[frame].height, DARKEST);
  }
  
  if (key == ' ') //clears sketch
  {
    background(iarray[curimage]);
    history.clear();
  }
  
  
}

// if (key== 't') draws trees
// if(key== 's') draws shaded circles
//if (key== 'p') draws pink graffiti
////if (key== 'v') draws violet graffiti
//if (key== 'y') draws yellow graffiti
//else if (key== 'c')//draws clouds
// if (key== 'f') stamps footprint at mouse location
//if (key== 'b') stamps birds at mouse location
// if (key== 'e') stamps elephant at mouse location
//if (key== 'l') stamps lips at mouse location
// m, tentacles
//g, glass






/*Libby Riefler er845@bard.edu
 Computer Landscaping
 Based on Mitchell Whitelaw's Harmony Web Remake*/


