


int s;
int m;
int h;
int dy;
int mnth;
int yr;
int dec;
int mil;
int dis = 10;
float x= 255;
int line_height = 200;
int gap = 25;

float movement;

PFont font;

void setup(){

  size (500, 500);
  background(255);
  smooth();
  movement = 1000/60.0;

}

void draw(){

  s = second();
  m = minute();
  h = hour();
  dy = day();
  mnth = month();
  yr = year();



  font = loadFont("ArialMT-48.vlw");

  background(255);
  noStroke();

  textFont(font);
  textSize(17);

  fill(0, 10, 255, 100);

  rect(width/2, 0, 18, height);


  fill(255);
  text(s, width/2, line_height);
  text(m, width/2, line_height+gap);
  text(h, width/2, line_height+gap*2);
  text(dy, width/2, line_height+gap*3);
  text(mnth, width/2, line_height+gap*4);


  

  fill(0);
  textSize(12);

  //seconds//////////////////////////////////////////////////////

  for (float i = movement+dis; i < width; i+=movement ) {
    s+=1;
    if (s==60){
      s=0;
    }
    text(s, width/2+i, line_height-i);
    
  }

  s = second();

  for(float i = movement+dis; i < 1000; i+=movement){
    s=s-1;
    if(s==-1){
      s= 59;
    }

fill(0, 255-i);
    text(s, width/2-i , line_height+i);
  }
fill(0);
  //mins///////////////////////////////////////////////////////////

  for (float i = movement+dis; i < width; i+=movement ) {
    m+=1;
    if (m==60){
      m=0;
    }

    text(m, width/2+i, line_height+gap-i);
  }

  m = minute();

  for(float i = movement+dis; i < 1000; i+=movement){
    m=m-1;
    if(m==-1){
      m= 59;
    }

fill(0, 255-i);
    text(m, width/2-i , line_height+gap+i);
  }
fill(0);
  //hours/////////////////////////////////////////////////////

  for (float i = movement+dis; i < width; i+=movement ) {
    h+=1;
    if (h==24){
      h=0;
    }
    text(h, width/2+i, line_height+gap*2-i);
  }

  h = hour();

  for(float i = movement+dis; i < 1000; i+=movement){
    h=h-1;
    if(h==-1){
      h= 23;
    }

fill(0, 255-i);
    text(h, width/2-i , line_height+gap*2+i);
  }
fill(0);

//day//////////////////////////////////////////////////////////

  for (float i = movement+dis; i < width; i+=movement ) {
    dy+=1;
    if ((mnth==1)||(mnth==3)||(mnth==5)||(mnth==7)||(mnth==8)||(mnth==10)||(mnth==12)){
      if (dy == 32){
      dy=1;
      }
    }
        if ((mnth==4)||(mnth==6)||(mnth==9)||(mnth==11)){
      if (dy == 31){
      dy=1;
      }
    }
    if ((mnth==28)&&(dy==29)){
      dy=1;
    }
    text(dy, width/2+i, line_height+gap*3-i);
  }

  dy = day();

  for(float i = movement+dis; i < 1000; i+=movement){
    dy=dy-1;
    if((mnth==2)||(mnth==4)||(mnth==6)||(mnth==8)||(mnth==9)||(mnth==11)||(mnth==1)){
    if(dy==0){
      dy= 31;
    }
    }
  
    if((mnth==5)||(mnth==7)||(mnth==10)||(mnth==12)){
    if(dy==0){
      dy= 30;
    }
    }
fill(0, 255-i);
    text(dy, width/2-i , line_height+gap*3+i);
  }

fill(0);
  //month/////////////////////////////////////////////////////

  for (float i = movement+dis; i < width; i+=movement ) {
    mnth+=1;
    if (mnth==13){
      mnth=1;
    }
    text(mnth, width/2+i, line_height+gap*4-i);
  }

  mnth = month();

  for(float i = movement+dis; i < 1000; i+=movement){
    mnth=mnth-1;
    if(mnth==0){
      mnth= 12;
    }
  
fill(0, 255-i);
    text(mnth, width/2-i , line_height+gap*4+i);
  }
  fill(0);
  //Year//////////////////////////////////////////////////////
  
  for (float i = movement+dis; i < width; i+=movement) {
    yr+=1;

    
    text(yr, width/2+i, line_height+gap*5-i);
  }

  yr = year();

  for(float i = movement+dis*1.5; i < 1000; i+=movement){
    yr=yr-1;
  
fill(0, 255-i);
    text(yr, width/2-i , line_height+gap*5+i);
  }
  translate(width/2, height/2);
  rotate(radians(90));
  
yr = year();
textSize(17);
fill(255);
  text(yr,63 , -4);
}







