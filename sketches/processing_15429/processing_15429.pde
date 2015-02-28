

public PGraphics film;
public int justmovequad = 0;
public PImage    film2;
public color mousecolour;
public color justmovecolour;
public boolean firstrun = true;
public boolean viewbuttons1= true;
public boolean viewbuttons2= true;
public boolean viewbuttons3= true;
public boolean viewbuttons4= true;

void keyPressed(){

  if(key=='1' ||
    key=='2' ||
    key=='3' ||
    key=='4'){
    if( key=='1')viewbuttons1=!viewbuttons1;
      if(  key=='2')viewbuttons2=!viewbuttons2;
        if(  key=='3')viewbuttons3=!viewbuttons3;
          if(  key=='4')   viewbuttons4=!viewbuttons4; 
             setup();
          }



        }
        public int quad1=int(color(23,23,233));
public color quad2=color(23,233,23);
public color quad3=color(233,23,23);
public color quad4=color(233,23,233);
//A=1;
//...
//Z=26;
int gap = 25;
public color [] buttons = new color [12];
int spacing = 60;
int topspace= 15;
public boolean viewlines =true;
int buttonsize = 60;
int vertspace = (topspace*2)+buttonsize;


void mouseReleased(){
  checkmouse();
}
void setup(){

  size(510,570,JAVA2D);
  if(firstrun){
  film = createGraphics(width,height,P3D);
  film2 = createImage(width,height,ARGB);
  loadPixels();
  film.loadPixels();
  film.beginDraw();
  smooth();

  scale(2);
  film.scale(2);

  ellipseMode(CENTER);
  film.ellipseMode(CENTER);
  buttons[0]=color(72,topspace+(topspace*1),255);
  buttons[1]=color(72+spacing,topspace+(topspace*1),255);
  buttons[2]=color(72+(spacing*2),topspace+(topspace*1),255);
  buttons[3]=color(72,topspace+(vertspace*1),255);
  buttons[4]=color(72+spacing,topspace+(vertspace*1),255);
  buttons[5]=color(72+(spacing*2),topspace+(vertspace*1),255);
  buttons[6]=color(72,(vertspace*2),255);
  buttons[7]=color(72+spacing,(vertspace*2),255);
  buttons[8]=color(72+(spacing*2),(vertspace*2),255);
  buttons[9]=color(72,(vertspace*3)-topspace,255);
  buttons[10]=color(72+spacing,(vertspace*3)-topspace,255);
  buttons[11]=color(72+(spacing*2),(vertspace*3)-topspace,255);

  background(1);
  film.background(1);
}
  if (viewbuttons1){
    putcircle(buttons[0]);
    putcircle(buttons[1]);
    putcircle(buttons[2]);
    putcircle(buttons[3]);
    putcircle(buttons[4]);
    putcircle(buttons[5]);
    putcircle(buttons[6]);
    putcircle(buttons[7]);
    putcircle(buttons[8]);
    putcircle(buttons[9]);
    putcircle(buttons[10]);
    putcircle(buttons[11]);
  }
  strokeWeight(.5);
  film.strokeWeight(5);
  film.stroke(1);
  stroke(1);
  if (viewlines){
    line(0,_fg2(buttons[0]),width,_fg2(buttons[2]));
    line(0,_fg2(buttons[3]),width,_fg2(buttons[5]));
    line(0,_fg2(buttons[6]),width,_fg2(buttons[8]));
    line(0,_fg2(buttons[9]),width,_fg2(buttons[11]));

    line(_fr2(buttons[0]),0,_fr2(buttons[9]),height);
    line(_fr2(buttons[1]),0,_fr2(buttons[10]),height);
    line(_fr2(buttons[2]),0,_fr2(buttons[11]),height);

  }


  if(viewbuttons2){
    colorbutton(0);
    colorbutton(2);
    colorbutton(3);
    colorbutton(4);
    colorbutton(5);
    colorbutton(6);
    colorbutton(7);
    colorbutton(8);
    colorbutton(9);
    colorbutton(11);
  }
  if(viewbuttons3){
    putcircle2(buttons[0],buttonsize/2,1);
    putcircle2(buttons[1],buttonsize/2,color(23,233,23,151));
    putcircle2(buttons[2],buttonsize/2,1);
    putcircle2(buttons[3],buttonsize/2,1);
    putcircle2(buttons[4],buttonsize/2,1);
    putcircle2(buttons[5],buttonsize/2,1);
    putcircle2(buttons[6],buttonsize/2,1);
    putcircle2(buttons[7],buttonsize/2,1);
    putcircle2(buttons[8],buttonsize/2,1);
    putcircle2(buttons[9],buttonsize/2,1);
    putcircle2(buttons[10],buttonsize/2,color(233,23,23,151));
    putcircle2(buttons[11],buttonsize/2,1);
  }
  if(viewbuttons4){
    putcircle3(buttons[0],buttonsize,1);
    putcircle3(buttons[1],buttonsize,color(23,233,23,111));
    putcircle3(buttons[2],buttonsize,1);
    putcircle3(buttons[3],buttonsize,1);
    putcircle3(buttons[4],buttonsize,1);
    putcircle3(buttons[5],buttonsize,1);
    putcircle3(buttons[6],buttonsize,1);
    putcircle3(buttons[7],buttonsize,1);
    putcircle3(buttons[8],buttonsize,1);
    putcircle3(buttons[9],buttonsize,1);
    putcircle3(buttons[10],buttonsize,color(233,23,23,111));
    putcircle3(buttons[11],buttonsize,1);
  }
  putshape("A",buttons[1],15,15,0,1);
  putshape("Z",buttons[10],15,15,0,1);
  putshape("box",buttons[0],15,15,0,-1);
  putshape("circle",buttons[11],15,15,0,-1);
  putshape("triangle",buttons[9],15,15,0,-1);
  putshape("x",buttons[2],15,15,0,-1);

  film.endDraw();
  film.updatePixels();
  film2=get();
firstrun =false;
}

void draw(){
  scale(2);

  mousecolour =film2.pixels[mouseX+width*mouseY];

  if (mousecolour==quad1)justmovequad = 1;
  if (mousecolour==quad2)justmovequad = 2;
  if (mousecolour==quad3)justmovequad = 3;
  if (mousecolour==quad4)justmovequad = 4;
  checkmouse();

}

public int run;
void colorbutton(int val){

  rectx(buttons[val],25,25,"ul",quad1);
  rectx(buttons[val],25,25,"ur",quad2);
  rectx(buttons[val],25,25,"dl",quad3);
  rectx(buttons[val],25,25,"dr",quad4);
}
void putcircle(color col){
  fill(-1);
  noStroke();
  ellipse(_fr2(col),_fg2(col),buttonsize,buttonsize);

}

void putcircle2(color col,int sz,color in){
  fill(in);
  noStroke();
  ellipse(_fr2(col),_fg2(col),sz,sz);
  film.fill(col);
  film.noStroke();
  film.ellipse(_fr2(col),_fg2(col),sz,sz);
}

void putcircle3(color col,int sz,color in){
  strokeWeight(18);
  // fill(in);
  stroke(1);
  noFill();
  ellipse(_fr2(col),_fg2(col),sz,sz);

}

color _fr2(color colx){ 
  return  colx >> 16 & 0xff;
}
color _fg2(color colx) { 
  return  colx >> 8 & 0xff;
}
color _fb2(color colx){
  return    colx  & 0xff;
}

//void rectx(int x, int y, int w,int h,int,String orientation,color in){
void rectx(color place, int w,int h,String orientation,color in){
  strokeWeight(1);
  noStroke();
  int x= _fr2(place);
  int y = _fg2(place);
  rectMode(CORNER);
  fill(in);
  //orientation ul = up left , ur = up right dr= down right  dl = down left
  if (orientation=="ul"){
    rect(x-w,y-h,w,h);
  }
  if (orientation=="ur"){
    rect(x,y-h,w,h);
  }
  if (orientation=="dl"){
    rect(x-w,y,w,h);
  }
  if (orientation=="dr"){
    rect(x,y,w,h);
  }

}








