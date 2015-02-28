
int color1=0;
int color2=0;
int color3=0;

int brushSize=5;

void setup(){
  size(600,400);
  background(255);
  smooth();
  strokeWeight(0);
}

void draw(){
  ellipseMode(CENTER);
  fill(0);
  rectMode(CENTER);
  rect(25,25,50,50);
  fill(255,0,0);
  rect(75,25,50,50);
  fill(0,255,0);
  rect(125,25,50,50);
  fill(0,0,255);
  rect(175,25,50,50);
  fill(127);
  rect(225,12.5,50,25);
  fill(255);
  rect(225,37.5,50,25);
  
  if (mousePressed&&(mouseButton==LEFT)){
    if (mouseX>=0&&mouseX<=50&&mouseY>=0&&mouseY<=50){
      color1=0;
      color2=0;
      color3=0;
    }
    else if(mouseX>=50&&mouseX<=100&&mouseY>=0&&mouseY<=50){
      color1=255;
      color2=0;
      color3=0;
    }
    else if(mouseX>=100&&mouseX<=150&&mouseY>=0&&mouseY<=50){
      color1=0;
      color2=255;
      color3=0;
    }
    else if(mouseX>=150&&mouseX<=200&&mouseY>=0&&mouseY<=50){
      color1=0;
      color2=0;
      color3=255;
    }
    else if(mouseX>=200&&mouseX<=250&&mouseY>=0&&mouseY<=25){
      if (brushSize>=11){
        brushSize=10;
      }
      brushSize++;
    }
    else if(mouseX>=200&&mouseX<=250&&mouseY>=25&&mouseY<=50){
      if (brushSize<=2){
        brushSize=3;
      }
      brushSize--;
    }else{
    //fill(color1,color2,color3);
    //ellipse(mouseX,mouseY,brushSize,brushSize);
    
    line(mouseX,mouseY,pmouseX,pmouseY);
    }
  }
  stroke(color1,color2,color3);
  strokeWeight(brushSize);
}

