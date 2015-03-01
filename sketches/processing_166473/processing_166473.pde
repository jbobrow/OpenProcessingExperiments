
int frames = 22;
int panel = 0;
int x=0;
PImage theImage= new PImage[frames];
PImage bg;
float  disappear=5;
float count_ceiling = 200;
int p=0;
ALine a1 = new ALine(20, 2.0); 
int time;
int start=0;
int trans1 =1000;
int trans2= 200;
float xposs=200;
float s=10000;
float last =24000;


void setup(){
  size(1000,600);
  colorMode(RGB);
  frameRate(1);
  myFont = createFont("Chalkduster");
  textFont(myFont);
  imageMode(CENTER);
  for (int i=0; i<theImage.length;i++){
    theImage[i]=loadImage(i+".png");
  }
  bg = loadImage("classroom.jpg");
  background(bg);
 
}

void draw(){
 
  imageMode(CORNER);
  image(bg,0,0);
  
  
  
  imageMode(CENTER);
  panel=(panel+1) % frames;
  pushMatrix();
  translate(-250,-250);
  scale(2);
  image(theImage[panel%frames],400,300);
  popMatrix();
  fill(255);
  textSize(30);
  text("How I feel about each week at DePaul", 300, 550);
  
  
  a1.update(); 
 
}

class ALine { 
  
  float xpos, speed, xposs; 
  ALine (float x, float s) {  
    xpos = x; 
    xposs = x;
    xposss =x;
    xpossss =x-50;
    xposssss=x-30;
    xpossssss=x-50;
    speed = s+200; 

  } 
  void update() { 
    textSize(50);
      frameRate(1);
    
    xpos = xpos+ speed;
    xposs = (xposs+50) % width;
    xposss= xposss+60;
    xpossss= xpossss+20;
    xposssss+=10;
    xpossssss+=40;
    
    
    
    if (xpos > width && xposs>width) {}

          if(millis() >start) {   
           fill(255); 
    text("Week1",xpos,150);}
    
    
          if (millis()>4500 &&millis()<10000){        
    text("Week 2,3,4....",(xposs % width), 70);}
    
          if(millis()>9500 &&millis()<12000){
            
            fill(#CB15AA);
            text("MIDTERM",xposss,200);}
            
            
            if(millis()>12000 && millis()<15000){
              fill(255);
              text("After MIDTERM",xpossss,150);}
            
            if(millis()>15000 && millis()<20000){
              fill(#441EC6);
              text("Final Exams already..?",xposssss, 190);};
              
            if (millis()>20000 && millis()<=24000){
              fill(255);
              text("Done!",xpossssss, 200);}
            
            
    
    
       
  
        
          }}



