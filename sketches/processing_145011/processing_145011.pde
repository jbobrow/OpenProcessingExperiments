
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
  sx = movex(a,sx);
  sy = movey(b,sy);
  a+=sx;
  b+=sy;
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
  if(key == CODED){
   if(keyCode == UP){
      return(-abs(t));
      //println("up");
    }
     if (keyCode == DOWN){
        return(abs(t));
        //println("down");
      }
  }
}

float movex(float y,float x){
  if(key == CODED){
   if(keyCode == LEFT){
      return(-abs(x));
    //println("left");
  }
     if (keyCode == RIGHT){
        return(abs(x));
        //println("right");
      }
  }
  
}
       
