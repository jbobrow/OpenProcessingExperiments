
import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context
float x1, y1, x2, y2;
int num = 50;
float mx[] = new float[num];
float my[] = new float[num];
PImage doge;
PImage dogeface;
String message = "tickle";
float angle;
float x,y ;
int savedTime;
int totalTime = 12000;
int totalTime2 = 15000;
int totalTime3 = 17500;
PFont comicFont;
/*boolean sketchFullScreen() {
  return true;
}*/
void setup() {
  noCursor();
background(0);
size(500, 500);
  doge = requestImage("c09.jpg");
  frameRate(15);
   dogeface = loadImage("dogeface.png");
   comicFont = createFont("Comic Sans MS Bold", 36);
  textFont(comicFont, 36);

smooth();

minim = new Minim(this);
  player = minim.loadFile("Dubstep.mp3", 2048);
  player.play();
  
    savedTime = millis();
}



void draw(){
  
   if (doge.width >0)
  {
    
    image(doge,0,0,width,height);
  }
  
 
  
 //green
   fill(4,200,0);
   ellipse(mouseX, mouseY, 15+random(20), 15+random(20));
    

    
 //yellow
   fill(255,204,0);
   ellipse(mouseX+20, mouseY-20,15+random(20), 15+random(20));
    
 //red
   fill(150, 0, 0);
   ellipse(mouseX-20, mouseY+20, 15+random(20), 15+random(20));
    

    
 // purple
   fill(130,10,220);
   ellipse(mouseX+20, mouseY+20,15+random(20), 15+random(20));
     
 //blue
  fill(25,100,300);
  ellipse(mouseX-20, mouseY-20, 15+random(20), 15+random(20));
   
 
 

fill(50,255,30, 50);
 line(width, height, mouseX, mouseY);
 line(0, 0, mouseX, mouseY);
    line (width, 0, mouseX, mouseY);
     line (0, height, mouseX, mouseY);
     line (width/2, 0, mouseX, mouseY);
   line (width/2, height, mouseX, mouseY);
   line (0, height/2, mouseX, mouseY);
   line (width, height/2, mouseX, mouseY);

 ellipse(mouseX, mouseY, mouseX, mouseY);
angle +=.05;
 
translate(mouseX,mouseY);
 
rotate (angle);
 
 

  
  


 strokeWeight(4);
 
  
    fill(random(0, 255), random(0, 255), random(0, 255));
    for(int i=1; i<num; i++) {

    mx[i-1] = mx[i];

    my[i-1] = my[i];

  } 

  mx[num-1] = mouseX;

  my[num-1] = mouseY;


    for(int i=0; i<num; i++) {
      ellipse(mx[i], my[i], i/0.75, i/0.75);

rotate(PI/3.0);
ellipse(width/2,frameCount*2 % height, 10,10); 
   ellipse(width/3,frameCount*1.7189742 % height, 10,10); 
   ellipse(width/4,frameCount % height, 10,10); 
    image(dogeface, mouseX, mouseY, 100, 100);

  }


  int passedTime = millis() - savedTime;
  
  if (passedTime > totalTime) {
    println( " 12 seconds have passed! " );
   for (int i = 0; i < width; i = i + 10)
  {
    strokeWeight(random(255));
 
 x2 = x1;
 y2 = y1;
 x1 = random(0, width);
 y1 = random(0, height);
 
 stroke(random(255), 2, 2);

    float percent = i / (float)width;
      float r = random(25);
  stroke(r);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    
    float z = random(255);
  fill(z);
ellipse(i, i, 25, 25);
fill(random(0, 255), random(0, 255), random(0, 255));
  text("wow", x2, y2);
  

  }
   strokeWeight(4);
 
  
    fill(0);
    for(int i=1; i<num; i++) {

    mx[i-1] = mx[i];

    my[i-1] = my[i];

  } 

  mx[num-1] = mouseX;

  my[num-1] = mouseY;


    for(int i=0; i<num; i++) {
      ellipse(mx[i], my[i], i/0.75, i/0.75);

rotate(PI/3.0);
ellipse(width/2,frameCount*2 % height, 10,10); 
   ellipse(width/3,frameCount*1.7189742 % height, 10,10); 
   ellipse(width/4,frameCount % height, 10,10); 
    image(dogeface, mouseX, mouseY, 100, 100);

  }

  }
  
    if (passedTime > totalTime2) {
    println( " 15 seconds have passed! " );
   for (int i = 0; i < width; i = i + 10)
  {
    strokeWeight(random(255));
 
 x2 = x1;
 y2 = y1;
 x1 = random(0, width);
 y1 = random(0, height);
 
 stroke(random(255), 2, 2);

    float percent = i / (float)width;
      float r = random(25);
  stroke(r);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    
    float z = random(255);
  fill(z);
ellipse(i, i, 25, 25);
fill(random(0, 255), random(0, 255), random(0, 255));
  text("very", x2, y2);
  

  }
 strokeWeight(4);
 
  
    fill(0);
    for(int i=1; i<num; i++) {

    mx[i-1] = mx[i];

    my[i-1] = my[i];

  } 

  mx[num-1] = mouseX;

  my[num-1] = mouseY;


    for(int i=0; i<num; i++) {
      ellipse(mx[i], my[i], i/0.75, i/0.75);

rotate(PI/3.0);
ellipse(width/2,frameCount*2 % height, 10,10); 
   ellipse(width/3,frameCount*1.7189742 % height, 10,10); 
   ellipse(width/4,frameCount % height, 10,10); 
    image(dogeface, mouseX, mouseY, 100, 100);

  }

  }
   if (passedTime > totalTime3) {
    println( " 17 seconds have passed! " );
   for (int i = 0; i < width; i = i + 10)
  {
    strokeWeight(random(255));
 
 x2 = x1;
 y2 = y1;
 x1 = random(0, width);
 y1 = random(0, height);
 
 stroke(random(255), 2, 2);

    float percent = i / (float)width;
      float r = random(25);
  stroke(r);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    
    float z = random(255);
  fill(z);
ellipse(i, i, 25, 25);
fill(random(0, 255), random(0, 255), random(0, 255));
  text("amaze", x2, y2);
  

  }
 

  }

}
  



void mousePressed() {
    savedTime = millis(); 

}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}




