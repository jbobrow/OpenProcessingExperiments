
import ddf.minim.*;
import ddf.minim.analysis.*;
 
  //the main minim object
  Minim minim;
  //the audio input
  AudioInput in;
  FFT fft;
  AudioSnippet boing;
  AudioSnippet haha;
PFont font;
PFont font2;
PFont font3;


float a = 250;
float b = 440;
float x = 3;
float aa = a - 15;
float aaa = a + 15;
float bb = 30;
float cl = 0.109; //mic correction level


int i = 3;
int gy;
int zaehler = 0;
//int xo = (22050 - fft.getAvg(i));
int size = 10; 
float xpos = random(500);
float ypos = random(350);




float xspeed = 2.8; 
float yspeed = 2.2; 



int xdirection = 1; 
int ydirection = 1;









void setup() {
  size(500,500);
     minim = new Minim(this);
     minim.debugOn();
     in = minim.getLineIn(Minim.STEREO, 1024);
     fft = new FFT(in.bufferSize(), in.sampleRate());
     fft.logAverages(25, 1);
     boing = minim.loadSnippet("sf02.wav");
     haha = minim.loadSnippet("evil_laf.wav");
  smooth();
  frameRate(120);
  font = loadFont ("HelveticaNeueLTCom-XBlkCn-48.vlw");
  font2 = loadFont ("HelveticaNeueLTCom-ThCn-16.vlw");
  font3 = loadFont ("HelveticaNeueLTCom-XBlkCn-28.vlw");
   
   
 }

void draw() {
  
  
  
  fft.forward(in.mix);
  
  float atl = ((fft.getAvg(1) + fft.getAvg(2) + fft.getAvg(3) ) / 3);
  
  
  background(255);
  noStroke();
  fill(0);
  
  rect(0,0,10, height*2);
  rect(0,0,width*2,10);
  rect(width, height,-10,-height*2);
  rect(width, height,-width*2,-10);
  fill(255,0,0);
  rectMode(CENTER);
  rect(width/2,0,100,10);
  fill(0);
  
  

  if (zaehler >= 1) {
  gy = 4; } else {
  gy = 0; }

  if (zaehler >= 2) {
  gy = 8; } else {
  gy = 0; }

  if (zaehler >= 3) {
  gy = 12; } else {
  gy = 0; }


  if(keyPressed) {
  if (key == 'a' || key == 'A') {
  a = a - x; } } 

  if(keyPressed) {
  if (key == 'd' || key == 'D') {
  a = a + x; } }

  if(keyPressed) {
  if (key == 'w' || key == 'W') {
  b = b - x; } }

  if(keyPressed) {
  if (key == 's' || key == 'S') {
  b = b + x; } }



// HERE ARE THE TESTER TEXTS

//text(atl,250,250);

 /*text(fft.getAvg(0),50,250);
 text(fft.getAvg(1),150,250);
 text(fft.getAvg(2),250,250);
 text(fft.getAvg(3),350,250);
 text(fft.getAvg(4),450,250);
 
 
//text(in.mix.level(),250,250);  
  
//ellipse(250,250,fft.avgSize(),fft.avgSize());

//------------------------------------


  /*if ( in.mix.level() > 0.109 && bb < 450 ) {
     bb = bb + ((in.mix.level() - cl) * 650);
  }
  
  if ( bb > 30 ) {
    bb = bb - xspeed*5;
  } 
  
  
  if ( 2.5 <  fft.getAvg(3) && b > 100  ) {
    b = b - (yspeed*2+(fft.getAvg(3)-1)); }

  
    
 if ( b < 440 ) {
    b = b + yspeed*2; 
  }
 
  */
  rectMode(CENTER); 
  
       
     
 //for( int i; i < fft.avgSize() ; b = b+yspeed*xo ) {
 
    
  
  rect(a,b,bb,10);
 
  

//--------------------------------------------------------------------------

  fill(0);


  xpos = xpos + ( xspeed * xdirection + gy );
  ypos = ypos + ( yspeed * ydirection + gy );


  if (ypos >= b-(6+size/2) && ypos <= b-(4+size/2) && xpos >= a-(bb/2) && xpos <= a+(bb/2) ) {
  
  ydirection *= -1;
 
  
} 

  if (ypos <= 5 && xpos < width/2+50 && (ypos <= 5 && xpos > width/2-50) ) {
  
    zaehler +=1;
    ydirection *= -1;
    boing.play(0); 
     
    
  } else if ( ypos <=5 && xpos < width/2-50 || ypos <=5 && xpos > width/2+50 )
  { ydirection *= -1; }

 if ( ypos > height-size-5) {ydirection *= -1;}


  if (xpos > width-size-5 || xpos < 5) {
  xdirection *= -1;
  }
  
  

textFont(font2);
  text("your awesomenessscore:", width-170,height-20);
  fill(255,0,0);
  text( zaehler , width - 25 , height - 20 );
fill(0);

 if (zaehler >= 3) {
  background(0); 
  fill(255,0,0);
  textFont(font);
  textAlign(CENTER);
  text("YOUR GAME IS OVER",width/2,height/2);
  textFont(font3);
  text("press q to exit" ,width/2,height/2+30);
  fill(0);
  haha.play(0);
  noLoop();
 }
   


  ellipse(xpos+size/2, ypos+size/2, size, size);

  



}

  void keyPressed() {
  if ( key == 'q' || key == 'Q' ) {
  loop();
  exit();
} }

 void stop()
 {
   // always close Minim audio classes when you are done with them
   boing.close();
   in.close();
   minim.stop();
   
   super.stop();
 }


