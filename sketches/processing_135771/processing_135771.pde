
//25 lines
//sean justice

float x1,x2,x3,x4,y1,y2,y3,y4;


void setup(){
  size(1200, 650);
  background (253);
 
}

void draw(){  


x1 = map(noise(.001*frameCount+5), 0,1,width/4,width);
x2 = map(noise(.0005*frameCount+10), 0,1,0,width);
x3 = map(noise(.001*frameCount+15), 0,1,0,width);
x4 = map(noise(.001*frameCount+125), 0,1,0,width);
y1 = map(noise(.001*frameCount), 0,1,0,height);
y2 = map(noise(.0001*frameCount+45), 0,1,0,height);
y3 = map(noise(.001*frameCount+55), 0,1,0,height);
y4 = map(noise(.001*frameCount+85), 0,1,0,height);


fill(255, 140);
noStroke();
rect(0,0,width,height);
noFill();
stroke(random(10), random(15), random (10));


strokeWeight (map(noise(width/2), 0,1,.8,1.2));//medium
bezier (x1,      y1,     x2,   y2,     x3,      y3,     x4,           height);//1
bezier (x1/1.2,  y1,     x2,   y2,     x3/4,    y3,     x4/1.4,       height);//2
bezier (x1/1.1,  y1/2,   x2,   y2,     x3/4,    y3,     x4/1.5,       height);//3
bezier (x1/1.4,  y1/3,   x2,   y2,     x3/4,    y3/3,   width/2.1,    height);//4
bezier (x1/1.8,  y1/1.4, x2,   y2,     x3/4,    y3/6,   width/2,      height);//5
bezier (x1/1.85, y1/13,  x2,   y2,     x3/4,    y3/2,   width/1.2,    height);//6
bezier (x1/2,    y1,     x2,   y2,     x3/4,    y3/4,   x4/2,         height);//7

strokeWeight (map(noise(width/2), 0,1,.9,1.4));//medium dark
bezier (x1/2.6,  y1,     x2,   y2,     x3/4,    y3/4,   x4/1.55,      height);//8

strokeWeight (map(noise(width/2), 0,1,.4,.6));//medium light
bezier (x1/2.4,  y1+.01, y4,   y2,     x3/4,    y3/4,   y4*1.4,       height);//9
bezier (x1/1.9,  y1+.1,  y4,   y2,     x3/4,    y3/5,   y4/2.8,       height);//10
bezier (x1/1.5,  y1/1.5, y4,   y2,     x3/4,    y3/4,   x4/2.05,      height);//11

strokeWeight (map(noise(width/2), 0,1,1.1,1.6));//darkest
bezier (x1/4,    y1/2.5, y4,   y2,     x3/4,    y3/4,   x4/1.42,      height);//12

strokeWeight (map(noise(width/2), 0,1,.9,1.4));//medium dark
bezier (x1/4.5,  y1/2.9, y4,   y2/1.5, x3/4,    y3/4,   x4/1.48,      height);//13

strokeWeight (map(noise(width/2), 0,1,.2,.5));//lightest
bezier (x1/5.2,  y1/5.4, y4,   y2/1.9, x3/4,    y3/4,   x4/1.55,      height);//14
bezier (x1/5.2,  y1,     x2,   y2,     x3/4,    y3/4,   x4*1.43,      height);//15

strokeWeight (map(noise(width/2), 0,1,1.1,1.6));//darkest
bezier (y1,      x1/2,   x2,   y2/3,   x3/3,    y3/3,   x4/1.35,      height);//16

strokeWeight (map(noise(width/2), 0,1,.4,.6));//medium light
bezier (y1/2,    x1/2,   x2,   y2/3,   x3/3,    y3/3,   x4/1.33,      height);//17
bezier (y1/3,    x1/2,   x2,   y2/3,   x3/3,    y3/3,   x4/1.63,      height);//18
bezier (y1/3.5,  x1/2.5, x2,   y2/3,   x3/3,    y3/3,   y4,           height);//19
bezier (y1/3.8,  x1/2,   x2/2, x2,     x3,      y3,     y4/2,         height);//20
bezier (y1/5,    x1/5,   x2/2, x2,     x3,      y3,     y4/2.5,       height);//21
bezier (y1/5.4,  x1/5.3, x2/2, x2,     x3,      y3,    (width/2+x4),  height);//22

strokeWeight (map(noise(width/2), 0,1,.2,.5));//lightest
bezier (y1/2.2,  x1/5,   x2/2, x2,     x3,      y3,    (width/1.5+x4),height);//23
bezier (y1/2.8,  x1/5,   x2/2, x2,     x3,      y3,    x4/1.83,       height);//24
bezier (y1/2.5,  y1/2,   x2/2, x2,     x3,      y3,    x4/1.9,        height);//25
}
void mousePressed() {
  noLoop();
}
void mouseReleased(){
  loop();
}


//25 lines
//sean justice

float x1,x2,x3,x4,y1,y2,y3,y4;


void setup(){
  size(1200, 650);
  background (253);
 
}

void draw(){  


x1 = map(noise(.001*frameCount+5), 0,1,width/4,width);
x2 = map(noise(.0005*frameCount+10), 0,1,0,width);
x3 = map(noise(.001*frameCount+15), 0,1,0,width);
x4 = map(noise(.001*frameCount+125), 0,1,0,width);
y1 = map(noise(.001*frameCount), 0,1,0,height);
y2 = map(noise(.0001*frameCount+45), 0,1,0,height);
y3 = map(noise(.001*frameCount+55), 0,1,0,height);
y4 = map(noise(.001*frameCount+85), 0,1,0,height);


fill(255, 140);
noStroke();
rect(0,0,width,height);
noFill();
stroke(random(10), random(15), random (10));


strokeWeight (map(noise(width/2), 0,1,.8,1.2));//medium
bezier (x1,      y1,     x2,   y2,     x3,      y3,     x4,           height);//1
bezier (x1/1.2,  y1,     x2,   y2,     x3/4,    y3,     x4/1.4,       height);//2
bezier (x1/1.1,  y1/2,   x2,   y2,     x3/4,    y3,     x4/1.5,       height);//3
bezier (x1/1.4,  y1/3,   x2,   y2,     x3/4,    y3/3,   width/2.1,    height);//4
bezier (x1/1.8,  y1/1.4, x2,   y2,     x3/4,    y3/6,   width/2,      height);//5
bezier (x1/1.85, y1/13,  x2,   y2,     x3/4,    y3/2,   width/1.2,    height);//6
bezier (x1/2,    y1,     x2,   y2,     x3/4,    y3/4,   x4/2,         height);//7

strokeWeight (map(noise(width/2), 0,1,.9,1.4));//medium dark
bezier (x1/2.6,  y1,     x2,   y2,     x3/4,    y3/4,   x4/1.55,      height);//8

strokeWeight (map(noise(width/2), 0,1,.4,.6));//medium light
bezier (x1/2.4,  y1+.01, y4,   y2,     x3/4,    y3/4,   y4*1.4,       height);//9
bezier (x1/1.9,  y1+.1,  y4,   y2,     x3/4,    y3/5,   y4/2.8,       height);//10
bezier (x1/1.5,  y1/1.5, y4,   y2,     x3/4,    y3/4,   x4/2.05,      height);//11

strokeWeight (map(noise(width/2), 0,1,1.1,1.6));//darkest
bezier (x1/4,    y1/2.5, y4,   y2,     x3/4,    y3/4,   x4/1.42,      height);//12

strokeWeight (map(noise(width/2), 0,1,.9,1.4));//medium dark
bezier (x1/4.5,  y1/2.9, y4,   y2/1.5, x3/4,    y3/4,   x4/1.48,      height);//13

strokeWeight (map(noise(width/2), 0,1,.2,.5));//lightest
bezier (x1/5.2,  y1/5.4, y4,   y2/1.9, x3/4,    y3/4,   x4/1.55,      height);//14
bezier (x1/5.2,  y1,     x2,   y2,     x3/4,    y3/4,   x4*1.43,      height);//15

strokeWeight (map(noise(width/2), 0,1,1.1,1.6));//darkest
bezier (y1,      x1/2,   x2,   y2/3,   x3/3,    y3/3,   x4/1.35,      height);//16

strokeWeight (map(noise(width/2), 0,1,.4,.6));//medium light
bezier (y1/2,    x1/2,   x2,   y2/3,   x3/3,    y3/3,   x4/1.33,      height);//17
bezier (y1/3,    x1/2,   x2,   y2/3,   x3/3,    y3/3,   x4/1.63,      height);//18
bezier (y1/3.5,  x1/2.5, x2,   y2/3,   x3/3,    y3/3,   y4,           height);//19
bezier (y1/3.8,  x1/2,   x2/2, x2,     x3,      y3,     y4/2,         height);//20
bezier (y1/5,    x1/5,   x2/2, x2,     x3,      y3,     y4/2.5,       height);//21
bezier (y1/5.4,  x1/5.3, x2/2, x2,     x3,      y3,    (width/2+x4),  height);//22

strokeWeight (map(noise(width/2), 0,1,.2,.5));//lightest
bezier (y1/2.2,  x1/5,   x2/2, x2,     x3,      y3,    (width/1.5+x4),height);//23
bezier (y1/2.8,  x1/5,   x2/2, x2,     x3,      y3,    x4/1.83,       height);//24
bezier (y1/2.5,  y1/2,   x2/2, x2,     x3,      y3,    x4/1.9,        height);//25
}
void mousePressed() {
  noLoop();
}
void mouseReleased(){
  loop();
}



