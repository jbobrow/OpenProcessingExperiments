
//Controls: Press mouse to play or pause !
//Author: jubin c jose :: blog.teampixfx.com

int i = 0,px,py,pox,poy;
float rad=200,oldRad=0;
boolean press = true;

void setup(){
  size(500,500);
  frameRate(200);
  oldRad = rad;
  px = 0;
  py = 0;
  pox = 0;
  poy = 0;
background(0);
}
void draw(){
  stroke(255,random(5,10));
  fill(255,210-rad);
  //background(0,100);
  //rotateZ(1);
  translate(width/2,height/2);
  
  if(rad < 0){part2();}
  else{
  float angle = random(TWO_PI);
  float x = cos(angle)*rad;
  float y = sin(angle)*rad;
  float er = random(5);
  line(x,y,0,0);
  ellipse(x,y,er,er);
  
  if(i > 360){rad-=10;i=0;}
  i++;
  }
}
void part2(){
  stroke(#ffffff,random(0,dist(0,0,px,py)/10));
  fill(#ffffff,dist(0,0,px,py)/10);
  int cases = (int)random(8);
  int w = (int) random(30);
  switch(cases){
   case 1: py = poy-w; break;
   case 2: px = pox+w; break;
   case 3: py = poy+w; break;
   case 4: px = pox-w; break;
   case 5: px = pox+w; py = poy-w; break;
   case 6: px = pox+w; py = poy+w; break;
   case 7: px = pox-w; py = poy+w; break;
   case 0: px = pox-w; py = poy-w; break;
  }
  if(dist(0,0,px,py)<=oldRad+50){
  line(pox,poy,px,py);
  ellipse(px,py,1,1);
  pox = px;
  poy = py;
  }
}
void mousePressed(){
  if(press)
 noLoop();
 else
 loop();
  press = !press; 
}
