
//pre-load rain.zip @ blog.naver.com/drsejin

PImage img1;
PImage img2;
float x, y;
float speed;

void setup(){
  img1=loadImage("01.jpg");
  size(img1.width, img1.height);
  
  smooth();
  frameRate(30);
  
  
  
  speed = 4.0;
}

void draw() {    
  
background(img1); 
  
 y +=speed ;
 
  if (y>height) {
    x=random(0, width); 
    y=-1;
    }

    
      img2=loadImage("rm.png");
      img2.resize(40,150);
      image(img2,x-150,y-136);
      image(img2,x+200,y-75);
      
      img2.resize(20, 75);
      image(img2,x,y);
      image(img2,x+25,y-100);
      image(img2,x-75,y-150);
          
      if (mousePressed){
        float x1= 4*width/11;
        float y1=12*height/15;
        
            strokeWeight(2);
            stroke(#FEFF12,95);
            line(x1+3,y1,x1+20,y1);
            line(x1-3,y1,x1-20,y1);
            line(x1,y1+3,x1,y1+20);
            line(x1,y1-3,x1,y1-20);
            line(x1-2.5,y1-2.5,x1-15,y1-12);
            line(x1+2.5,y1+2.5,x1+15,y1+12);
            line(x1+2.5,y1-2.5,x1+15,y1-12);   
            line(x1-2.5,y1+2.5,x1-15,y1+12);
            
            
          
         }
 
    }

  

