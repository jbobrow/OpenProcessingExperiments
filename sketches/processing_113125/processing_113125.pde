


int numFrames = 30;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(800, 800);
  frameRate(2400);
  
  images[0]  = loadImage("1.jpg");
  images[1]  = loadImage("2.jpg"); 
  images[2]  = loadImage("3.jpg");
  images[3]  = loadImage("4.jpg"); 
  images[4]  = loadImage("5.jpg");
  images[5]  = loadImage("6.jpg"); 
  images[6]  = loadImage("7.jpg");
  images[7]  = loadImage("8.jpg"); 
images[8]  = loadImage("9.jpg"); 
images[9]  = loadImage("10.jpg"); 
images[10]  = loadImage("11.jpg"); 
images[11]  = loadImage("12.jpg"); 
images[12]  = loadImage("13.jpg"); 
images[13]  = loadImage("14.jpg"); 
images[14]  = loadImage("15.jpg"); 
images[15]  = loadImage("16.jpg"); 
images[16]  = loadImage("17.jpg"); 
images[17]  = loadImage("18.jpg"); 
images[18]  = loadImage("19.jpg"); 
images[19]  = loadImage("20.jpg"); 
images[20]  = loadImage("21.jpg"); 
images[21]  = loadImage("22.jpg"); 
images[22]  = loadImage("23.jpg"); 
images[23]  = loadImage("24.jpg"); 
images[24]  = loadImage("25.jpg"); 
images[25]  = loadImage("26.jpg"); 
images[26]  = loadImage("27.jpg"); 
images[27]  = loadImage("28.jpg"); 
images[28]  = loadImage("29.jpg"); 
  images[29]  = loadImage("30.jpg");
   

} 
 
  boolean a ;

 
void draw() { 
  background(0);
 
  
  
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = 0; x < width; x += images[0].width) { 
    
    offset+=10;
    image(images[(frame+offset) % numFrames], 0  , 0,400,400);
    image(images[(frame+offset) % numFrames],400, 400,400,400);
    
    offset+=1000;
     image(images[(frame+offset) % numFrames], 400, 0,400,400);
     image(images[(frame+offset) % numFrames], 0, 400,400,400);
     
    
    
  }

if ( a == true) { 
  frame = frame-1;
}else{ 

  frame = (frame+1) % numFrames;
} 

noStroke();
fill(255,100);
if (mouseX<390 & mouseY<390){//when cursor is above that picture the particular picture will appear with highest opacity
  
rect(420,20,360,360);
rect(20,420,360,360);
rect(420,420,360,360);

}

if (mouseX>390 & mouseY<390){
 
rect(20,20,360,360);
rect(20,420,360,360);
rect(420,420,360,360);

}
 
 if (mouseX>390 & mouseY>390){
  
rect(20,20,360,360);
rect(420,20,360,360);
rect(20,420,360,360);

}
 
 if (mouseX<390 & mouseY>390){
  
rect(420,20,360,360);
rect(20,20,360,360);
rect(420,420,360,360);

}
  
  if(mousePressed==true){
    a = true;}
    else{a = false;}
}
  
  
  
   

  
     
  void mousePressed(){//the gif stops when mouse is pressed and continues when mouse button is released
       a = true; }
       
       void mouseReleased(){
       a = false;}
       
       
       void keyPressed() {//the gif is in slow motion when key is pressed
       frame = frame-1;}
       
     //IMAGE LINK: http://iliketowastemytime.com/sites/default/files/mind-bending-gif-images1.gif


