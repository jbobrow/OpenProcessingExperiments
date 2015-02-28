
//Kang-Yu,Liu
//wiggly line
//20131023

void setup(){
  size(500,250);
  noLoop();
}

void draw(){
  background(255);
  strokeWeight(3);
  stroke(233);
  line(20,70,480,70);
  line(20,60,480,60);
  line(20,50,480,50);
  line(20,40,480,40);
line(20,30,480,30);

 strokeWeight(3);
  stroke(3);
  float xstep = 10;
  float ystep = 10;
  float lastx = 20;
  float lasty = 50;
  float y = 50;
  int border = 20;
   for (int x=border; x<=width-border;x+=xstep){
    ystep = random(20)-10;
    y += ystep;
    line(x,y,lastx,lasty);//(20,
    lastx = x;
    lasty = y;
  }
  
  strokeWeight(3);
  stroke(233);
  line(20,170,480,170);
  line(20,160,480,160);
  line(20,150,480,150);
  line(20,140,480,140);
line(20,130,480,130);

 strokeWeight(3);
  stroke(3);
  float x1step = 10;
  float y1step = 10;
  float lastx1 = 20;
  float lasty1 = 50;
  float y1 = 150;
  int border1 = 20;
   for (int x=border1; x<=width-border1;x+=x1step){
    y1step = random(20)-10;
    y1 += y1step;
    line(x,150,lastx1,lasty1);//(20,
    lastx1 = x;
    lasty1 = y1;
  }
  
  
  }


