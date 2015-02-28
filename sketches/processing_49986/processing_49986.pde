
int sizeRect=10;
float coord1=50;
float coord2=0;
int colorNum=0;
int trans=100;
color[] palette=new color[3];

void setup(){
  frameRate(25);
  smooth();
  
  palette[0]=color(0,0,0);
  palette[1]=color(255,255,255);
  palette[2]=color(0,100,0);
  
  size(500,500);
 
}

void draw(){
  
    if(coord2<500){
      colorNum=int(random(palette.length));
      stroke(palette[colorNum],trans);
      strokeWeight(int(random(1,10)));
      sizeRect=int(random(5,100));
      coord1+=int(random(-15,15));
      rect(coord1,coord2,sizeRect,sizeRect);
      coord2+=10;
      fill(#FFFFFF,5);
      noStroke();
      rect(0,0,500,500);
    }
    else{
      if(coord1>450)
        coord1=0;
      else
        coord1+=25;
      coord2=0;
    }

}

