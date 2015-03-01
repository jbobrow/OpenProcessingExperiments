
//ben kandov
//my function for color; I'll be modifying it in future for loops to make different arrays of color
void colordisplay(float color1, float color2, float color3){
  fill(color1,color2,color3);
}
void setup(){
  /*
  In this void setup, I put the designs for my drawing material buttons
  and the for loops that draw my arrays of colors, which I'll use later in the mousePressed function to set the buttons for choosing between colors 
  */
  size(500,400);
  background(255,255,255);
  rectMode(CENTER);
  //designs for buttons for switching between drawing materials
  fill(125,125,125);
  rect(425,25,50,50);
  fill(0,0,0);
  text("Ink",415,25);
  fill(125,125,125);
  rect(475,25,50,50);
  fill(0,0,0);
  text("Paint",465,25);
  fill(125,125,125);
  rect(425,75,50,50);
  fill(0,0,0);
  text("Eraser",410,75);
  fill(125,125,125);
  rect(475,75,50,50);
  fill(0,0,0);
  text("Big",465,70);
  text("Eraser",460,85);
  
  for(float c = 0; c<200; c+=15){
      colordisplay(c,0,0);
      rect(415,200+c,15,15);
     }
  for(float c =0; c<200; c+=15){
      colordisplay(0,c,0);
      rect(430,200+c,15,15);
     }
  for(float c =0; c<200;c+=15){
      colordisplay(0,0,c);
      rect(445,200+c,15,15);
     }
  for(float c =0; c<200;c+=15){
      colordisplay(c,0,c);
      rect(460,200+c,15,15);
     } 
  for(float c =0; c<200;c+=15){
      colordisplay(0,c,c);
      rect(475,200+c,15,15);
     }  
  for(float c =0; c<200;c+=15){
      colordisplay(c,c,0);
      rect(490,200+c,15,15);
     }  
     
 
}
    
//variables for sizes of material
//variable for paint-stroke size
float ps = 5;
//variable for eraser-size
float e = 10;
//variable for big-eraser-size
float be = 25;
//variable for splotch size
float s = 25;
//booleans for drawing materials - their values decide whether a material is active or not
boolean inkSplotch=false;
boolean paintStroke=false;
boolean eraser = false;
boolean bigEraser = false;
//this randfactor is just for the use of the ink splotch material, to calculate the random factor of stray ink splotches
float randfactor = 5;

//variables for color which will be later determined by my for loops that determine color
float colorVal1;
float colorVal2;
float colorVal3;


void draw(){
  //the fill of the drawing material, which uses those variables dependant on later for loops
  fill(colorVal1,colorVal2,colorVal3);

  //conditionals for big eraser material
  //if boolean is activated/button is pressed, make bigEraser shape wherever mouseX/Y is below 200, and then the same place +200 in the x direction
  if(bigEraser==true){
    noStroke();
    if ((mousePressed==true) && (mouseX<200)){
      bigEraser(mouseX,mouseY,be);
      float xmirrored = 200 + (200-mouseX);
      bigEraser(xmirrored,mouseY,be);
    }
  }
  //conditionals for eraser material
  //if boolean is activated/button is pressed, make Eraser shape wherever mouseX/Y is below 200, and then the same place +200 in the x direction
 if(eraser==true){
  noStroke();
  if ((mousePressed==true) && (mouseX<200)){
      eraser(mouseX,mouseY,e);
      float xmirrored = 200 + (200-mouseX);
      eraser(xmirrored,mouseY,e);
  }
 }
  //conditionals for paint-brush material
  //if boolean is activated/button is pressed, make painStroke shape wherever mouseX/Y is below 200, and then the same place +200 in the x direction
 if(paintStroke==true){
   noStroke();
  if ((mousePressed==true) && (mouseX < 200)) {
    brushStroke(mouseX,mouseY,ps);
    float xmirrored = 200 + (200-mouseX);
    brushStroke(xmirrored,mouseY,ps);
  }  
 } 
  //conditionals for ink splotch material
  //if boolean is activated/button is pressed, make inkSplotch shape wherever mouseX/Y is below 200, and then the same place +200 in the x direction
  //also calculates a random factor to make smaller ellipses and change the size of the main ellipse in the inkSplotch, yet keeps it above diameter of 15, and below one of 50.
 if(inkSplotch==true){
   noStroke();
  //if mouse is pressed in a certain area, and the mouse is in the first half of the screeen (width/2)
  if ((mousePressed == true) && (mouseX < 200)) {
    splotch(mouseX,mouseY,s);
    s += random(-randfactor,randfactor);
    
    float xmirrored = 200 + (200-mouseX);
    splotch(xmirrored, mouseY, s);
    s += random(-randfactor,randfactor);
    if(mousePressed == false) {
      s = 5;
    }
    
  }
  if (s>50){
    s-=5;
  }
  if (s<15) {
    s+=5;
  }
 }
 //if key is pressed, everything drawn is erased, yet permanent things like buttons are retained and redrawn
 if (keyPressed==true){
      background(255,255,255);
      stroke(5);
        //designs for buttons for switching between drawing materials
      fill(125,125,125);
      rect(425,25,50,50);
      fill(0,0,0);
      text("Ink",415,25);
      fill(125,125,125);
      rect(475,25,50,50);
      fill(0,0,0);
      text("Paint",465,25);
      fill(125,125,125);
      rect(425,75,50,50);
      fill(0,0,0);
      text("Eraser",410,75);
      fill(125,125,125);
      rect(475,75,50,50);
      fill(0,0,0);
      text("Big",465,70);
      text("Eraser",460,85);
       //designs for buttons for switching between colors
      for(float c = 0; c<200; c+=15){
        colordisplay(c,0,0);
        rect(415,200+c,15,15);
        }
      for(float c =0; c<200; c+=15){
        colordisplay(0,c,0);
        rect(430,200+c,15,15);
        }
      for(float c =0; c<200;c+=15){
        colordisplay(0,0,c);
        rect(445,200+c,15,15);
        }
      for(float c =0; c<200;c+=15){
        colordisplay(c,0,c);
        rect(460,200+c,15,15);
        } 
        for(float c =0; c<200;c+=15){
        colordisplay(0,c,c);
        rect(475,200+c,15,15);
        }  
       for(float c =0; c<200;c+=15){
        colordisplay(c,c,0);
        rect(490,200+c,15,15);
        }   
      
    }
} 

//functions for different drawing materials
//ink splotches/default material
//this function for inkSplotches makes that random factor, and also an ellipse which is the ink splotch.
void splotch(float xsplotch, float ysplotch, float splotchsize){


 ellipse(xsplotch,ysplotch,splotchsize,splotchsize);
 float chance = random(6);
 
 
 
 if (chance>5) {
   float rand = random(0.4);
   ellipse(xsplotch+splotchsize+random(-3,3),ysplotch+splotchsize+random(-3,3),s*rand,s*rand);
 }
}
//paint-strokes material
//this function just makes a simple ellipse with no random factors. It's for cleaner drawing
void brushStroke(float strokeX, float strokeY, float strokeSize){
  ellipse(strokeX,strokeY,strokeSize,strokeSize);
}
//eraser material
//this is just the small eraser; it makes an ellipse that is always white independent from the fill at the beginning of my draw loop
void eraser(float eraserX, float eraserY, float eraserSize){
  fill(255,255,255);
  ellipse(eraserX,eraserY,eraserSize,eraserSize);
}
//big eraser material
//this is a bigger eraser, and it makes a bigger ellipse that is also always white independent from the fill at the beginning of my draw loop
void bigEraser(float bigEraserX,float bigEraserY,float bigEraserSize){
  fill(255,255,255);
  ellipse(bigEraserX,bigEraserY,bigEraserSize,bigEraserSize);
}
  
//function button pressings
//this is the function for all of my buttons. I reincorporated the color for loops to insert mouse conditionals within them.
void mousePressed(){
  //designs for buttons for switching between drawing materials
  fill(125,125,125);
  rect(425,25,50,50);
  fill(0,0,0);
  text("Ink",415,25);
  fill(125,125,125);
  rect(475,25,50,50);
  fill(0,0,0);
  text("Paint",465,25);
  fill(125,125,125);
  rect(425,75,50,50);
  fill(0,0,0);
  text("Eraser",410,75);
  fill(125,125,125);
  rect(475,75,50,50);
  fill(0,0,0);
  text("Big",465,70);
  text("Eraser",460,85);
  //inkSplotch button
  if(mouseX>400&&mouseX<450&&mouseY>0&&mouseY<50){
    inkSplotch=true;
    paintStroke=false;
    eraser=false;
    bigEraser=false;
  }
  //paintStroke button
  if(mouseX>450&&mouseX<500&&mouseY>0&&mouseY<50){
    paintStroke=true;
    inkSplotch=false;
    eraser=false;
    bigEraser=false;
  }
  //eraser button
  if(mouseX>400&&mouseX<450&&mouseY>50&&mouseY<100){
    eraser=true;
    inkSplotch=false;
    paintStroke=false;
    bigEraser=false;
  }
  //big eraser button
  if(mouseX>450&&mouseX<500&&mouseY>50&&mouseY<100){
    bigEraser=true;
    eraser=false;
    paintStroke=false;
    eraser=false;
  }


  for(float c = 0; c<200; c+=15){
       colordisplay(c,0,0);
       rect(415,200+c,15,15);
      if(mouseX>408&&mouseX<422&&mouseY>200+c-7&&mouseY<200+c+7){
        colorVal1=c;
        colorVal2=0;
        colorVal3=0;
      }
     }
  for(float c =0; c<200; c+=15){
       colordisplay(0,c,0);
       rect(430,200+c,15,15);
      if(mouseX>423&&mouseX<437&&mouseY>200+c-7&&mouseY<200+c+7){
        colorVal1=0;
        colorVal2=c;
        colorVal3=0;
      }
     }
  for(float c =0; c<200;c+=15){
       colordisplay(0,0,c);
       rect(445,200+c,15,15);
      if(mouseX>438&&mouseX<452&&mouseY>200+c-7&&mouseY<200+c+7){
        colorVal1=0;
        colorVal2=0;
        colorVal3=c;
      }
     }
  for(float c =0; c<200;c+=15){
       colordisplay(c,0,c);
       rect(460,200+c,15,15);
       if(mouseX>453&&mouseX<467&&mouseY>200+c-7&&mouseY<200+c+7){
         colorVal1=c;
         colorVal2=0;
         colorVal3=c;
       }
     } 
  for(float c =0; c<200;c+=15){
       colordisplay(0,c,c);
       rect(475,200+c,15,15);
       if(mouseX>468&&mouseX<482&&mouseY>200+c-7&&mouseY<200+c+7){
         colorVal1=0;
         colorVal2=c;
         colorVal3=c;
       }
     }  
  for(float c =0; c<200;c+=15){
       colordisplay(c,c,0);
       rect(490,200+c,15,15);
       if(mouseX>483&&mouseX<497&&mouseY>200+c-7&&mouseY<200+c+7){
         colorVal1=c;
         colorVal2=c;
         colorVal3=0;
       }
     }   
}



