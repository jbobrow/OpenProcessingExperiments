
/* @pjs preload="eyes.jpg"; */

PImage im;
int Maxlines = 0;
float a = 0.0;
float s = 0.0;

void setup(){
  size (300,300);
  im = loadImage("eyes.jpg");
  frameRate(200);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw(){
   if(time>=800){
     
   a = a + 0.05;
  s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s); 
  fill(178,250,251);
  rect(0, 0, 50, 50); 
  
  translate(75, 0);
  fill(51,73,11);
  scale(s);
  rect(0, 0, 50, 50);    
   }  
 /* im.filter(POSTERIZE, 4);*/
  im.resize(300, 300);
  image(im, 0, 0);
      int time;
        time = millis(); 
            if(time<24000){
            im.filter(POSTERIZE, 4); //set filter to posterize
             } else {
               image(im,0,0);
               im.filter(none);
             }
             if(time<24000){
            im.filter(DILATE, 10); //set filter to posterize
             } else {
               image(im,0,0);
               im.filter(none);
             }
             
            
             println(time);
             
     if (Maxlines <= 2000)
   {
   strokeWeight(4);
   stroke(random(0,255),random(0,255),random(0,255));
   line(250,250,random(0,500),random(0,500));
   Maxlines += 5;
   }
   if(time>=800){
     
   a = a + 0.05;
  s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s); 
  fill(178,250,251);
  rect(0, 0, 50, 50); 
  
  translate(75, 0);
  fill(51,73,11);
  scale(s);
  rect(0, 0, 50, 50);    
   }   
}


