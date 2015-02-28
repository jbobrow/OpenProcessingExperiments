
PImage img, leaf1, leaf2, leaf3, leaf4, leaf5, leaf6, leaf7, leaf8;
float y=0;
float y1 = -60;
float y2 = -60;
float y3 = -60;
float y4 = -60;
float y5 = -60;
float y6 = -60;
float y7 = -60;
float y8 = -60;

void setup() {
  size(400,300, P2D);
  img = loadImage("img.jpg");
  leaf1 = loadImage("leaf1.gif");
  leaf2 = loadImage("leaf2.gif");
  leaf3 = loadImage("leaf3.gif");
  leaf4 = loadImage("leaf4.gif");
  leaf5 = loadImage("leaf5.gif");
  leaf6 = loadImage("leaf6.gif");
  leaf7 = loadImage("leaf7.gif");
  leaf8 = loadImage("leaf8.gif");
  image(img,0,0,400,4500);
  smooth();
  noStroke();
}

void draw(){
  image(img,0,y,400,4500);
  image(leaf1,0,y1,30,60);
  image(leaf2,5,y2,30,60);
  image(leaf3,10,y3,30,60);
  image(leaf4,15,y4,30,60);
  image(leaf5,20,y5,30,60);
  image(leaf6,25,y6,30,60);
  image(leaf7,30,y7,30,60);
  image(leaf8,35,y8,30,60);
  image(leaf1,335,y1,30,60);
  image(leaf2,340,y2,30,60);
  image(leaf3,345,y3,30,60);
  image(leaf4,350,y4,30,60);
  image(leaf5,355,y5,30,60);
  image(leaf6,360,y6,30,60);
  image(leaf7,365,y7,30,60);
  image(leaf8,370,y8,30,60);
  if (key == CODED) {
    if (keyCode == DOWN) {
      y-=4;
    } else if (keyCode == UP) {
      y+=4;
    }
    if(y>0){
        y=0;
    }
    if(y<-4200){
        y=-4200;
    }
  }
 
     if (keyCode == DOWN) {
       y1+=3; 
      y2+=2.5;
      y3+=4;
      y4+=5.5;
      y5+=2;
      y6+=3.5;
      y7+=5; 
      y8+=4.5;
    } else if (keyCode == UP) {
      y1-=3; 
      y2-=2.5;
      y3-=4;
      y4-=5.5;
      y5-=2;
      y6-=3.5;
      y7-=5; 
      y8-=4.5;
    }
      
      if (y1>300){
        y1=-30;
      }
      if (y2>300){
        y2=-30;
      }
      if (y3>300){
        y3=-30;
      }
      if (y4>300){
        y4=-30;
      }
      if (y5>300){
        y5=-30;
      }
      if (y6>300){
        y6=-30;
      }
      if (y7>300){
        y7=-30;
      }
      if (y8>300){
        y8=-30;
      }
      
      if (y1<-60){
        y1=300;
      }
      if (y2<-60){
        y2=300;
      }
      if (y3<-60){
        y3=300;
      }
      if (y4<-60){
        y4=300;
      }
      if (y5<-60){
        y5=300;
      }
      if (y6<-60){
        y6=300;
      }
      if (y7<-60){
        y7=300;
      }
      if (y8<-60){
        y8=300;
      }
      
      
}


