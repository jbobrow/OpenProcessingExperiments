
int counter = 0;
int x;
int speed;
int y;
int yspeed;

//step 1. create a font object
PImage myImage;

PImage myImage2;

PImage myImage3;

PImage myImage4;


void setup(){
  size(400,400);
  x=200;
  speed=round(random(120));
  y=200;
  yspeed=round(random(30));
  //step 2. load the image file
myImage = loadImage("100_3910.JPG");

  x=200;
  speed=round(random(30));
  y=200;
  yspeed=round(random(120));
  //step 2. load the image file
myImage2 = loadImage("100_3912.JPG");

  x=200;
  speed=round(random(30));
  y=200;
  yspeed=round(random(120));
  //step 2. load the image file
myImage3 = loadImage("100_3913.JPG");


  x=200;
  speed=round(random(120));
  y=200;
  yspeed=round(random(30));
  //step 2. load the image file
myImage4 = loadImage("100_3914.JPG");

  
}

void draw(){
  background(0);
  
  

  
  //now draw that image
  image(myImage, x,y,100,100);
  x=x+speed;
  y=y+speed;
  
   if(x>400-25){
    speed=speed*  -1;}
    
   if(x<25){
      speed=speed* -1;
    }
   if (y>400-25){
      yspeed=yspeed* -1;
    }
   if(y>25){
      yspeed=yspeed* -1;
      
        
  //now draw that image
  image(myImage2, x,y,100,100);
  x=x+speed;
  y=y+speed;
  
   if(x>400-25){
    speed=speed*  -1;}
    
   if(x<25){
      speed=speed* -1;
    }
   if (y>400-25){
      yspeed=yspeed* -1;
    }
   if(y>25){
      yspeed=yspeed* -1;}

 //now draw that image
  image(myImage3, y,x,100,100);
  x=x+speed;
  y=y+speed;
  
   if(x>400-25){
    speed=speed*  -1;}
    
   if(x<25){
      speed=speed* -1;
    }
   if (y>400-25){
      yspeed=yspeed* -1;
    }
   if(y>25){
      yspeed=yspeed* -1;}
   }
   
    //now draw that image
  image(myImage4, y,x,100,100);
  x=x+speed;
  y=y+speed;
  
   if(x>400-25){
    speed=speed*  -1;}
    
   if(x<25){
      speed=speed* -1;
    }
   if (y>400-25){
      yspeed=yspeed* -1;
    }
   if(y>25){
      yspeed=yspeed* -1;}
}
      
      void mousePressed(){
  save("circles"+counter+".jpg");
  counter= counter+1;
      
    
}





