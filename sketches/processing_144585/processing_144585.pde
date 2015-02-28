
float a = 30;
float b = 30;
float c = 20;
float sx = 1;
float sy = 1;
void setup(){
  size(800,500);
}

void draw(){
  background(0);
  drawThing(a,b,c);
  a = movex(a,sx);
  b = movey(b,sy);
  if(a>width+c){
    a=-c;
  } else if(a<-c){
    a=width+c;
  }
  if(b>height+c){
    b=-c;
  } else if(b<-c){
    b=height+c;
  }
}

void drawThing(float x, float y, float r){
  ellipse(x,y,r,r);
}
float movey(float r,float t){
  //if(key == CODED){
   if(keyCode == UP){
      t= -abs(t);
      //println("up");
    }
     if (keyCode == DOWN){
        t= abs(t);
        //println("down");
      }
 // }
  r+=t;
  return r;
}

float movex(float y,float x){
  //if(key == CODED){
   if(keyCode == LEFT){
      x= -abs(x);
    //println("left");
  }
     if (keyCode == RIGHT){
        x= abs(x);
        //println("right");
      }
 // }
  y+=x;
 // println(y);
  return y;
  
}
       

