
/*
After writing this program, thoughts and INTRO

First and foremost: this program is an attemp to create patterning.  This worked!
Second and equally important: I was trying to understand the concept of linear
patterning.  See explanations at http://en.wikipedia.org/wiki/Frieze_group or
at http://euler.slu.edu/escher/index.php/Frieze_Patterns.  I orginally was stuck
on the idea that you take a single image and apply some transformations to it
(such as rotations, shifting, and reflections) and thus create a linear pattern.
The generally idea is that there are a finite amount of unique patterns that can
be created. 7 in total.  However that does not appear to be the case and that you
need to thinking about an entire tiling effect and it is not about the individual
starting shape but what the entire row is doing.  I only explored the idea of
taking a single 'standard' image and putting it through 5 of the 7 unique  and 
possible transformations.  And thus if found p2mg and p2mm to be redudent and only
resulted in a linear shift. basically p1.  At the point of writing this code, I am
only interested in expressing the ablity to implement imageFlip and create some
tiling.  I also gained some understanding of arrays within a context of java and
processing.

Towards the very bottom is a futher explaintion of my attmepts at createing a
rotation about the origin and my explanation of what the conditionals are doing
as well as within the context of creating a new conditional to rotate about the
origin.

Lastly!: I'm sorry for any typos. I'm not spell checking this too much nor rereading it.
*/

PImage purpleTile;
int gutter=50; //main gutters
int innerGutter=20; //center gutter
int xImgScaler=53; //width of image
int yImgScaler=60; //height of image
int guideLineCounter=0;
int textCounter=0;
int generalCounter=0;
int skip=0;

void setup(){
  size(800,800);
  //purpleTile=loadImage("imageblack.gif", "gif"); //imageBlack.gif's size 53px by 60px
  background(255);
  smooth();
  fill(0);
  rect(400,700,300,50);
}

void draw(){
  //image(purpleTile, 0, 0);
  
  //p1
  if(generalCounter<=4){
    for(int k=0+gutter; k<width/2-innerGutter-xImgScaler*1; k=k+1*xImgScaler){ //using a repeat of 1 UNIT
      purpleTile=loadImage("imageblack.gif", "gif");
      image(purpleTile, k, gutter);
    }
    fill(0);
    text("p1", gutter+10, gutter+yImgScaler+20);
  }
  
  
  //p11g
  if(generalCounter<=4){
    for(int k=0+gutter; k<width/2-innerGutter-xImgScaler*4; k=k+1*xImgScaler){ //using a repeat of 2 UNITS
      purpleTile=loadImage("imageblack.gif", "gif");
      image(purpleTile, k+skip, gutter+233);
      imageFlip(purpleTile, k+xImgScaler+skip, gutter+233+yImgScaler, "h");
      skip=skip+xImgScaler;
    }
    fill(0);
    text("p11g", gutter+10, gutter+233+2*yImgScaler+20);
    skip=0;
  }

  //p11m
  if(generalCounter<=4){
    for(int k=0+gutter; k<width/2-innerGutter-xImgScaler*1; k=k+1*xImgScaler){ //using a repeat of 1 UNIT
      purpleTile=loadImage("imageblack.gif", "gif");
      image(purpleTile, k, gutter+467);
      imageFlip(purpleTile, k, gutter+467+yImgScaler, "h");
    }
    fill(0);
    text("p11m", gutter+10, gutter+467+2*yImgScaler+20);
  }  
  
  //p1m1
  if(generalCounter<=4){
    for(int k=width/2+10; k<width-gutter-xImgScaler*4; k=k+1*xImgScaler){ //using a repeat of 2 UNITS
      purpleTile=loadImage("imageblack.gif", "gif");
      image(purpleTile, k+skip, gutter);
      imageFlip(purpleTile, k+xImgScaler+skip, gutter, "v");
      skip=skip+xImgScaler;
    }
    fill(0);
    text("p1m1", width/2+20, gutter+1*yImgScaler+20);
    skip=0;
  }
  
  //p2
  if(generalCounter<=4){ //I'm using the lame way by having a image being rendered out of sight so then that image can be transformed and translated correctly!
    for(int k=width/2+10; k<width-gutter-xImgScaler*4; k=k+1*xImgScaler){ //using a repeat of 2 UNITS
      purpleTile=loadImage("imageblack.gif", "gif");
      image(purpleTile, k+skip, height/2);
      imageFlip(purpleTile, width+5, height+5, "v"); //the extra step
      imageFlip(purpleTile, k+xImgScaler+skip, height/2+yImgScaler, "h"); //the correct location and the correct orientation
      skip=skip+xImgScaler;
    }
    fill(0);
    text("p2", width/2+20, gutter+height/2+1*yImgScaler+25);
    skip=0;
  }
  
  
  //GUIDES
  if(guideLineCounter<=4){
    //strokeWeight(1);
    //stroke(0,60);
    //line(width/2-innerGutter, gutter, width/2-innerGutter, height-gutter);
    
    strokeWeight(1.5);
    stroke(0,100);
    line(width/2, gutter, width/2, height-gutter);
    line(gutter, gutter, gutter, height-gutter);
    line(gutter, height-gutter, width-gutter, height-gutter);
    line(width-gutter, gutter, width-gutter, height-gutter);
    line(gutter, gutter, width-gutter, gutter);
  }
  guideLineCounter++;
  textCounter++;
  generalCounter++;

}



void imageFlip(PImage imageName, int xPos, int yPos, String mode){
  
  //"h2" flips the top half of the image across the x-axis
  if(mode == "h2"){
    imageName.loadPixels();
    for(int i = 0; i < imageName.height; i++){
      for(int j = 1; j < imageName.width; j++){
        imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
      }
    }
    imageName.updatePixels();
    image(imageName,xPos,yPos);
        
  //"v2" flips the left half of the image across the y-axis  
  }else if(mode == "v2"){
    imageName.loadPixels();
    for(int i = 0; i < imageName.height; i++){
      for(int j = 1; j < imageName.width; j++){
        imageName.pixels[i*imageName.width + j] = imageName.pixels[(i+1)*(imageName.width) - j];
      }
    }
    imageName.updatePixels();
    image(imageName,xPos,yPos);  
  
  
  //"h" flips the entire image across the x-axis
  }else if(mode == "h"){
    imageName.loadPixels();
    int tempImage[] = new int[imageName.width*imageName.height];
    for(int i = 0; i < imageName.width*imageName.height; i++){
     tempImage[i] = imageName.pixels[i];
    }
    for(int i = 0; i < imageName.height; i++){
      for(int j = 1; j < imageName.width; j++){
        imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = tempImage[i*(imageName.width) + j];
      }
    }
    imageName.updatePixels();
    image(imageName,xPos,yPos);


  //"v" flips the entire image across the y-axis  
  }else if(mode == "v"){
    imageName.loadPixels();
    int tempImage[] = new int[imageName.width*imageName.height];
    for(int i = 0; i < imageName.width*imageName.height; i++){
     tempImage[i] = imageName.pixels[i];
    }
    for(int i = 0; i < imageName.height; i++){
      for(int j = 1; j < imageName.width; j++){
        imageName.pixels[(i+1)*(imageName.width) - j] = tempImage[i*imageName.width + j];
      }
    }
    imageName.updatePixels();
    image(imageName,xPos,yPos);  
  
  
  
  
//-----------------Appropriated code from Nick's work, edited and annotated by Ender--------------------------------------------------------
  
  
  
  //"aboutOrigin" rotates the entire image about the origin
  
  
  /*
  My wishful attempts of trying to learn arrays without reading anything <3.
  My understanding of the conditionals "v" and "h" are that you have imageName being a
  'a space' that you load the the desired image to. Now a new array is created & called
  tempImage, this wil take the current image input of imageField. This is done with the
  first for loop?  Now the condition will run the 2nd for loop. This for loop will take
  the updated tempImage, make some transformations to it and rename it as imageName (more
  or less). Now that imageName is updated you can call the image function using imageName
  as the argument.
 
  So one of my later attempts is below.  I was thinking about calling a new arrary,
  tempImage2 which would take the first transformations of imageName and apply new ones.
  The idea behind this method is creating a rotaiton about the origin, it can be considered
  a reflection about both the x and y axis thus I would want to combine the "v" and "h"
  modes. ANOTHER strategy that I tried was to take the "v" conditional and try to mathematically
  encompass the "h" conditional however not fully understanding what the 2nd for loop was doing,
  that was also a fail.
  */
  
  }else if(mode == "aboutOrigin"){
    imageName.loadPixels();
    int tempImage[] = new int[imageName.width*imageName.height];
    //int tempImage2[]; = new int[tempImage.width*tempImage.height];
    for(int i = 0; i < imageName.width*imageName.height; i++){
     tempImage[i] = imageName.pixels[i];
    }
    for(int i = 0; i < imageName.height; i++){
      for(int j = 1; j < imageName.width; j++){
        imageName.pixels[(i+1)*(imageName.width) - j] = tempImage[i*imageName.width + j];       
        
      }
    }
    
    PImage imageName2;
    for(int i = 0; i < imageName.height; i++){
      for(int j = 1; j < imageName.width; j++){      
        //bellow commeted out text (3 lines) allows the program to run, otherwise the compiler hangs up on it
        //imageName2.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
        
      }
    }
    
    //imageName2.updatePixels();
    //image(imageName2,xPos,yPos); 
  } else {
    println("No mirror direction specified");
    println("Use v, v2, h, or h2 for the 4th argument");
  }
  
}//end of imageFlip 

/*CREDITS:
the class imageFlip was written by Nick Lally. Ender Wiggin made some naming modifications and attempted at adding a new conditional.
*/



