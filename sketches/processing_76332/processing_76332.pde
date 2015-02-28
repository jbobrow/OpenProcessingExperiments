
//function w/ mode
float angle;
boolean mode;
int radius;

void setup(){
  background(0);
  size (500, 600);
  smooth();
  angle = 0;
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
 
}

void mouseReleased(){
  
  
    if(mode){
      mode = false;
      
    } else { if(!mode){
      mode = true;
    }
    }
}


void draw(){

  if (mode){
    myFun();
  }
  
  if (!mode){
    myFun2();
    myFun3();
  }
}

void myFun(){
  float bgcolor = abs(255*sin(radians(angle)));
  fill(bgcolor,100, 100, 10);
  //abs is absolute value, is always positive
  //background (bgcolor);
  float x = 300 * cos(radians(angle)) *cos(radians(angle*2));
  float y = 100 * sin(radians(angle)) *cos(radians(angle/10))*sin(radians(180-angle));
  //can use 'tan' in place of sin, cos, etc for more effects.
  
  //ellipse(angle/2,y+200,20,20);
  //ellipse(x + width/2,y + height/2,20,20);
  //angle++;
  angle+=4;
  
  ellipse(x+width/2, y+height/2,5,8);
  ellipse(y+=width/2, x+=height/2,5,8);
}

void myFun2(){
   float bgcolor = abs(255*sin(radians(angle)));
  fill(bgcolor,100, 100, 10);
  //abs is absolute value, is always positive
  //background (bgcolor);
  float x = 300 * cos(radians(angle)) * cos(radians(angle*2));
  float y = 100 * sin(radians(angle)) * cos(radians(angle/10));
  //can use 'tan' in place of sin, cos, etc for more effects.
  
  //ellipse(angle/2,y+200,20,20);
  //ellipse(x + width/2,y + height/2,20,20);
  //angle++;
  angle+=2;
  //radius+=1;
  
  ellipse(y+width/2, x+height/2,5,5);
  //ellipse(x+width/2, y+height/2,10,10);
  //ellipse(y+width/2, x+height/2,5,5);
}

void myFun3(){
   float bgcolor = abs(255*sin(radians(angle)));
  fill(bgcolor,100, 100, 10);
  //abs is absolute value, is always positive
  //background (bgcolor);
  float x = 100 * cos(radians(angle)) * cos(radians(angle*2));
  float y = 300 * sin(radians(angle)) * sin(radians(angle/10));
  //can use 'tan' in place of sin, cos, etc for more effects.
  
  //ellipse(angle/2,y+200,20,20);
  //ellipse(x + width/2,y + height/2,20,20);
  //angle++;
  angle+=2;
  //radius+=1;
  
  ellipse(y+width/2, x+height/2,6,6);
  //ellipse(x+width/2, y+height/2,10,10);
  //ellipse(y+width/2, x+height/2,5,5);
}
