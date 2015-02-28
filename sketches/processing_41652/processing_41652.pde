
//dan 02:14 10/10/2011
int i=0;
int j=0;
int arcWidth=0;
int arcStart=0;
int ran1=0;
int ran2=0;
int ran3=0;
int ran4=0;
int mod=0;
color bg=color(130,180,170);
color sea=color(160,210,200);
color colorRan1;
color colorRan2;
int arcHeight=0;
boolean rain = false;
int starter=0;
int rapid=20;
int randomed=0;
boolean greyscale=true;
int direction=0;
int[] arRain = new int[50];

void setup(){
  size(600,600);
  noFill();
  arcWidth=width/10;
  arcStart=arcWidth/2;
  ran1=int(random(5,10));
  ran2=int(random(1,5));
  ran3=int(random(10,100));
  ran4=int(random(10,100));
  smooth();

  colorRan1=color(random(0,255));
  colorRan2=color(random(0,255));
  for(int i=0;i<50;i++){arRain[i]=int(random(0,100));}
}

void draw(){
  arcHeight=height/4*3;

if (mousePressed == true) {
  if(frameCount%10==0){
    randomed=int(random(10,60));
    arcWidth=randomed;
    arcHeight=height/4*3-arcWidth/2-randomed/2;
  }
  
  if(greyscale) {
    bg=color(20,20);
    sea=color(10,20);
  }
  else {
    bg=color(20,15,150,20);
    sea=color(10,20,20,20);
  }

  if(!rain) starter=frameCount;
    rain=true;
  } 
  else{
    arcWidth=1;
    arcHeight=height/4*3;
    if(greyscale) {
      bg=color(230);
      sea=color(240);
    }
    else {
      bg=color(130,180,170);
      sea=color(160,210,200);
    }
    rain=false;
  }

  fill(bg,10);
  rect(0,0,width,height);
  noStroke();
  fill(sea);
  mod=frameCount%2;

  for(int i=0;i<width/arcWidth;i++)
    arc(arcStart+i*arcWidth, arcHeight, arcWidth, arcWidth, 0, PI);
  
  rect(0,0,width,arcHeight);

  fill(colorRan1,50);
  quad(width/5,height/16*11,
       width/4,height/4*3+50,
       width/4*3,height/4*3+50,
       width/5*4,height/16*11
       );

  stroke(255);
  strokeWeight(2);
  line(width/2,height/4,width/2,height/16*11); //tree

  noStroke();
  fill(colorRan1);
  triangle(width/2,height/4, width/10*ran1, height/9*6-ran3, width/2,height/9*6-ran3);
  fill(colorRan2);
  triangle(width/2,height/4, width/10*ran2, height/9*6-ran4, width/2,height/9*6-ran4);

  stroke(255);
  strokeWeight(1);
  if(rain) {
    if((frameCount-starter)>15){starter=frameCount;}
    if(mouseX>width/2) {direction=mouseX/8+5;}
    else direction=-mouseX/8-5;
    for(int i=0;i<50;i++){
     line((frameCount-starter)*rapid+i*50-500,(frameCount-starter)*rapid-arRain[i],(frameCount-starter)*rapid+20+i*50-500,(frameCount-starter)*rapid+direction-arRain[i]);
     line((frameCount-starter)*rapid+i*50-500,(frameCount-starter)*rapid-arRain[i]+50,(frameCount-starter)*rapid+20+i*50-500,(frameCount-starter)*rapid+direction-arRain[i]+50);
     line((frameCount-starter)*rapid+i*50-500,(frameCount-starter)*rapid-arRain[i]+100,(frameCount-starter)*rapid+20+i*50-500,(frameCount-starter)*rapid+direction-arRain[i]+100);
     line((frameCount-starter)*rapid+i*50-500,(frameCount-starter)*rapid-arRain[i]+150,(frameCount-starter)*rapid+20+i*50-500,(frameCount-starter)*rapid+direction-arRain[i]+150);
  }
   for(int i=0;i<50;i++){arRain[i]=int(random(-50,500));}
 }
}

void keyReleased() {
 if (keyCode == 'C') {if(greyscale)greyscale=false; else greyscale=true;}
 ran1=int(random(5,10));
 ran2=int(random(1,5));
 ran3=int(random(10,100));
 ran4=int(random(10,100));
 if(greyscale) {
   colorRan1=color(random(40,200));
   colorRan2=color(random(40,200));
  }
  else {
   colorRan1=color(random(0,255),random(0,255),random(0,255));
   colorRan2=color(random(0,255),random(0,255),random(0,255));
  }
}
