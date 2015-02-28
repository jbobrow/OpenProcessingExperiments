
int w = 155;
int h = 155;
int space = 64;
void setup(){
  size(310,310,P2D);
  mp=false;
  a=createImage(w,h,ARGB);
  //smooth(); 
  rotz=0;
}
float distx(float a,float b,float c ,float d){

  float retval = abs((a)+(c))-abs((b)+(d));


  return retval; 
}
boolean mp = false;
float pick;
int paw;
void draw(){
  pick+=.125;
  //mouseY=int(random(mouseX));
  paw+=int(pick);
  //mouseX=paw;
  //  background(255);
  if(!mp){
    // background(255);

    for (int x=w;x<w*2;x++){
      for (int y=h;y<h*2;y++){
        float dis = distx(mouseX,mouseY,x,y)*2;
        if(dis<100){
          //stroke(dis,dis/2,dis*2,dis);
          set(x,y,color(dis,dis/2,dis*2,dis));
          //point(x,y);
        }
      } 

    }
  }
  if(mp){
    // imageMode(3);
    rotz+=.1;

    translate(width/2+(w/2)-space,(height/2+(h/2))-space);
    rotate(radians(rotz));
    // translate(w/2+random(-1,1),h/2+random(-1,1));
    image(e,0,0);
    // image(a,int(random(-1,1)),int(random(-1,1)));

  }
  //point(mouseX,mouseY);
}
PImage a;
float rotz;
void mouseReleased(){
  if(!mp){
    a=get(w,h,w*2,h*2); 
    for (int y=0;y<h;y++){
      c.pixels [y]=a.get(y,1);
      d.pixels [y]=a.get(1,y);
      // e.pixels[y]=mix(c.pixels[y],d.pixels[y],.5,.5);
    }
    //c.filter(BLUR,5);
    d.filter(BLUR,5);
    d.mask(c);
    for (int y=0;y<h;y++){
      e.pixels[y]=mix(c.pixels[y],d.pixels[y],.5,.5);

    }

  }
  background(255);
  mp=true;

}
PImage c=createImage(1,h,ARGB);
PImage d=createImage(1,h,ARGB);
PImage e=createImage(1,h,ARGB);

int cr(color col){

  return col>>16&255;

}

int cg(color col){

  return col>>8&255;

}
int cb(color col){

  return col&255;

}
int ca(color col){

  return col>>24&255;

}
color mix(color A,color B,float X,float Y){

  PVector a = new PVector(cr(A),cg(A),cb(A));
  PVector b = new PVector(cr(B),cg(B),cb(B));

  color retval = color((a.x*X+b.x*Y),(a.y*X+b.y*Y),(a.z*X+b.z*Y));

  return retval; 
}
                
                
void keyReleased(){

if(key=='r')setup();

}
