
int sizeEllipse=1;
float coord1=57;
float coord2=101;
float strokeSize=1;
int colorNum=0;
int circleNum=350;
int trans=100;
boolean blah=true;
color[] palette=new color[3];

void setup(){
  frameRate(30);
  smooth();
  
  palette[0]=color(0,0,0);
  palette[1]=color(255,255,255);
  palette[2]=color(0,0,100);
  
  size(500,500);
 
}

void draw(){
  
    if(circleNum>1){
      circleNum--;
      colorNum=int(random(palette.length));
      stroke(palette[colorNum],trans);
      noFill();
      strokeWeight(2);
      ellipse(width/2,height/2,sizeEllipse,sizeEllipse);
      sizeEllipse+=3;
      if(sizeEllipse>125)
          ellipse(width/2,height/2,sizeEllipse-125,sizeEllipse-125);
      if(sizeEllipse>250)
          ellipse(width/2,height/2,sizeEllipse-250,sizeEllipse-250);
      if(sizeEllipse>375)
          ellipse(width/2,height/2,sizeEllipse-375,sizeEllipse-375);
      fill(#FFFFFF,5);
      noStroke();
      rect(0,0,500,500);
    }
    else{
      circleNum=350;
      sizeEllipse=1;
    }

}

