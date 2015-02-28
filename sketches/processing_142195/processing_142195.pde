

/* 


 Konkuk University 


 SOS iDesign 


Name: Sungbum Lee<<------ Write your full name here! 


 ID: legendlsb<<--------- Write your ID here! 


*/ 

void setup () { 


  background(255, 255, 255); 
  size (600, 600); 
  //noLoop (); 
  smooth (); 



} 


int value = 0; 


void draw () { 
  colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
  
 fill(255);
  quad(0,0,600,0,600,600,0,600);


  fill(238, 230, 176); 
  ellipse(280, 280, 449, 449); 
 strokeWeight(5); 
line(160, 121, 257, 164); 

strokeWeight(5); 
line(395, 111, 305, 186); 

//eyes

float eyeLeftX = constrain (mouseX,361,415);
float eyeLeftY = constrain (mouseY,122,252);
float eyeRightX = map(mouseX,0,width,62,94);
float eyeRightY = map(mouseY,0,width,102,137);




fill(value); 
ellipse(eyeLeftX, eyeLeftY ,75 ,75); 
fill(value); 
 ellipse(eyeLeftX-200, eyeLeftY ,75 ,75); 

strokeWeight(5); 
line(264, 231, 263, 352); 


float t = random(-8,8);
  t=random(-8,8);

strokeWeight(5); 
line(278+t, 372+t, 279+t, 418+t); 
strokeWeight(5); 
line(176+t, 436+t, 388+t, 414+t); 
strokeWeight(5); 
line(264+t, 372+t, 264+t, 414+t); 

if(mousePressed){  

 float a=random(255);  
 float b=random(255); 
float c=random(150);  

fill(constrain(mouseX,mouseY,a),b,c);  
 strokeWeight(8);  
ellipse(pmouseX,pmouseY,80,80);  



} 



} 


  


void mouseDragged()  


{ 


  value = value + 5; 


  if (value > 255) { 


    value = 0; 


  } 


} 


void mouseWheel(MouseEvent event) { 


  float e = event.getAmount(); 


  println(e); 


} 


  


void mouseMoved() { 


  value = value + 5; 


  if (value > 255) { 


    value = 0; 


  } 


} 


  


void keyPressed(){  


setup();  

} 

/*
// Don't worry about understanding the code below!
 // You only need to know that you will use the Volume
 import ddf.minim.*;

 Minim minim;
 AudioInput in;
 float volume = 0;
 float volumeF = 0;

 //-------------------------------------
 void setupAudio(){
 minim = new Minim(this);
 in = minim.getLineIn(Minim.MONO, 512);
 }

 //-------------------------------------
 void getVolume(){
 volumeF = in.right.level()*1000;
 volume = 0.8*volume + 0.8*volumeF; // Sensitivity = standard is 0.2*volumeF
 }

 //-------------------------------------
 void stop(){
 in.close();
 minim.stop();
 super.stop();
 } 
 /*
