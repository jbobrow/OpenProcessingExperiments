
//"DVD LOGO", because that's so much more creative than ellipses. Really.
//Homework for Monday, Sept. 26th

int x;
int y;
int directionX;
int directionY;

void setup(){
  size(800,600);
  smooth();
  noStroke();
  
  x=0;
  y=0;
  directionX=1;
  directionY=3;
}

void draw(){
  background(10);
  x+=directionX;
  y+=directionY;
  
  //DVD
 // fill(35,142,144);
  beginShape();
    vertex((x+7.94),(y));
    vertex((x+6.88),(y+5.31));
    vertex((x+19.94),(y+5.31));
    vertex((x+23.88),(y+6.44));
    vertex((x+26.81),(y+8.5));
    vertex((x+27.19),(y+12));
    vertex((x+25.31),(y+15.44));
    vertex((x+21.69),(y+17.63));
    vertex((x+17.56),(y+18.81));
    vertex((x+12.88),(y+18.81));
    vertex((x+15.56),(y+7.5));
    vertex((x+6.38),(y+7.25));
    vertex((x+2.13),(y+24.31));
    vertex((x+18.06),(y+24.31));
    vertex((x+24.94),(y+22.75));
    vertex((x+31.56),(y+19.06));
    vertex((x+36.19),(y+14));
    vertex((x+36.88),(y+8.06));
    vertex((x+45),(y+29.75));
    vertex((x+28.63),(y+29.75));
    vertex((x+31.69),(y+30.13));
    vertex((x+22.06),(y+30.63));
    vertex((x+13.88),(y+31.5));
    vertex((x+8.38),(y+32.5));
    vertex((x+2.69),(y+33.94));
    vertex((x+0),(y+35.56));
    vertex((x+0),(y+37.13));
    vertex((x+3.13),(y+39));
    vertex((x+11.88),(y+40.69));
    vertex((x+23.31),(y+42.19));
    vertex((x+38),(y+42.75));
    vertex((x+43.5),(y+42.75));
    vertex((x+43.5),(y+38.88));
    vertex((x+37.56),(y+38.44));
    vertex((x+34.25),(y+37.38));
    vertex((x+33.44),(y+36.19));
    vertex((x+35.69),(y+35));
    vertex((x+39),(y+34.44));
    vertex((x+48.53),(y+34.38));
    vertex((x+51.94),(y+34.94));
    vertex((x+53.94),(y+35.88));
    vertex((x+54.31),(y+36.94));
    vertex((x+52.25),(y+37.81));
    vertex((x+49.13),(y+38.56));
    vertex((x+44.5),(y+38.75));
    vertex((x+44.5),(y+42.75));
    vertex((x+55.5),(y+42.75));
    vertex((x+67.56),(y+42.19));
    vertex((x+79.13),(y+41));
    vertex((x+87.69),(y+39.13));
    vertex((x+91.19),(y+37.19));
    vertex((x+91.19),(y+35.94));
    vertex((x+88.13),(y+34.06));
    vertex((x+81.56),(y+32.31));
    vertex((x+73.56),(y+31.31));
    vertex((x+63.38),(y+30.31));
    vertex((x+56.25),(y+30));
    vertex((x+45.6),(y+29.75));
    vertex((x+66.69),(y+5.56));
    vertex((x+81.19),(y+5.44));
    vertex((x+84.5),(y+6.81));
    vertex((x+86.88),(y+9.5));
    vertex((x+86.81),(y+12.94));
    vertex((x+85.19),(y+15.31));
    vertex((x+81.94),(y+17.69));
    vertex((x+77.5),(y+18.75));
    vertex((x+72.81),(y+18.75));
    vertex((x+75.31),(y+7.5));
    vertex((x+66),(y+7.44));
    vertex((x+62.06),(y+24.19));
    vertex((x+77.5),(y+24.19));
    vertex((x+86.38),(y+22.13));
    vertex((x+92.25),(y+18.56));
    vertex((x+94.94),(y+15.88));
    vertex((x+96.75),(y+12.44));
    vertex((x+96.75),(y+8.13));
    vertex((x+94.5),(y+4.63));
    vertex((x+86.75),(y+0));
    vertex((x+61.38),(y+0));
    vertex((x+48.53),(y+15.56));
    vertex((x+43.81),(y+0));
    vertex((x+7.94),(y+0));
  endShape();
  
    if(y > (height-42.75)){
    directionY = -3;
    fill((random(0,255)),(random(0,255)),(random(0,255)));
  }
  
  if(y < 0){
    directionY=3;
    fill((random(0,255)),(random(0,255)),(random(0,255)));
  }
  
  if(x > (width-96.75)){
    directionX = -1;
    fill((random(0,255)),(random(0,255)),(random(0,255)));
  }
  
  if(x < 0){
    directionX = 1;
    fill((random(0,255)),(random(0,255)),(random(0,255)));
  }  
  
  
}

