
/* @pjs preload="b-thmp.png"; */
/* @pjs preload="bo-thmp.png"; */
/* @pjs preload="pd-thmp.png"; */
/* @pjs preload="ll-thmp.png"; */

/* @pjs preload="b.png"; */
/* @pjs preload="bo.png"; */
/* @pjs preload="pd.png"; */
/* @pjs preload="ll.png"; */

int colorA=0;
int colorB=0;
int colorC=0;
 
int brushSize=1;
 
void setup(){
  size(800,800);
  background(255);
  smooth();
  strokeWeight(0);
  frameRate(200);
}
 
void draw(){
  ellipseMode(CENTER);
  fill(0);
  rectMode(CENTER);
  ellipse(50,50,50,50);
  fill(255,0,0);
  ellipse(50,100,50,50);
  fill(0,255,0);
  ellipse(50,150,50,50);
  fill(0,0,255);
  ellipse(50,200,50,50);
  fill(127);
  ellipse(750,25,24,24);
  fill(255);
  ellipse(750,50,24,24);
  
  ellipse(750,150,24,24);
  ellipse(750,174,24,24);
  ellipse(750,198,24,24);
  
  
  ellipse(750,750,50,50);
  
      PImage img;
  img = loadImage("ll-thmp.png");
      image(img, 25, 675);
      
      PImage imgA;
  img = loadImage("bo-thmp.png");
      image(img, 135, 675);
      
      PImage imgB;
  img = loadImage("pd-thmp.png");
      image(img, 240, 675);
      
      PImage imgC;
  img = loadImage("b-thmp.png");
      image(img, 345, 675);

   
  if (mousePressed){
    if (mouseX>=25&&mouseX<=75&&mouseY>=25&&mouseY<=50){
      colorA=0;
      colorB=0;
      colorC=0;
    }
    else if(mouseX>=25&&mouseX<=75&&mouseY>=75&&mouseY<=125){
      colorA=255;
      colorB=0;
      colorC=0;
    }
    else if(mouseX>=25&&mouseX<=75&&mouseY>=125&&mouseY<=175){
      colorA=0;
      colorB=255;
      colorC=0;
    }
    else if(mouseX>=25&&mouseX<=75&&mouseY>=175&&mouseY<=225){
      colorA=0;
      colorB=0;
      colorC=255;
    }
    else if(mouseX>=738&&mouseX<=762&&mouseY>=12&&mouseY<=36){
      if (brushSize>=11){
        brushSize=10;
      }
      brushSize++;
    }
    else if(mouseX>=738&&mouseX<=763&&mouseY>=37&&mouseY<=60){
      if (brushSize<=2){
        brushSize=2;
      }
      brushSize--;
    }
    else if(mouseX>=738&&mouseX<=763&&mouseY>=137&&mouseY<=162){
      colorA=colorA+5;
      colorB=colorB;
      colorC=colorC;
    }
    else if(mouseX>=738&&mouseX<=763&&mouseY>=162&&mouseY<=186){
      colorA=colorA;
      colorB=colorB+5;
      colorC=colorC;
    }
    else if(mouseX>=738&&mouseX<=763&&mouseY>=186&&mouseY<=210){
      colorA=colorA;
      colorB=colorB;
      colorC=colorC+5;
    }
     else if(mouseX>=25&&mouseX<=135&&mouseY>=620&&mouseY<=730){
      PImage imgfull;
  img = loadImage("ll.png");
      image(img, 0, 0);
    }
    else if(mouseX>=135&&mouseX<=240&&mouseY>=620&&mouseY<=730){
      PImage imgAfull;
  img = loadImage("bo.png");
      image(img, 0, 0);
    }
    else if(mouseX>=240&&mouseX<=345&&mouseY>=620&&mouseY<=730){
      PImage imgBfull;
  img = loadImage("pd.png");
      image(img, 0, 0);
    }
    else if(mouseX>=345&&mouseX<=450&&mouseY>=620&&mouseY<=730){
      PImage imgCfull;
  img = loadImage("b.png");
      image(img, 0, 0);
    }
    
    
    else if(mouseX>=738&&mouseX<=763&&mouseY>=725&&mouseY<=775){
      background(255);
    }
    
    
    
    else{
    //fill(colorA,colorB,colorC);
    //ellipse(mouseX,mouseY,brushSize,brushSize);
     
    line(mouseX,mouseY,pmouseX,pmouseY);
    }
    
  }
  stroke(colorA,colorB,colorC);
  strokeWeight(brushSize);
}




