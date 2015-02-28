
void setup(){
  size(600,600,P2D);
  background(0);
  loadPixels();
}

int x,y,rr=128,rg=128,rb=128,dir;
float rrl=-1,rrr=1,rgl=-2,rgr=2,rbl=-3,rbr=3;
void draw(){
  for(int i=0;i<5000;i++){
  rr = rr+int(random(rrl,rrr));
  if(rr<0){rr++;}
  if(rr>255){rr--;}
  rg = rg+int(random(rgl,rgr));
  if(rg<0){rg++;}
  if(rg>255){rg--;}
  rb = rb+int(random(rbl,rbr));
  if(rb<0){rb++;}
  if(rb>255){rb--;}
  if((height/2+y)*width+(width/2+x)>0){
    if((height/2+y)*width+(width/2+x)<(width*height)){
      pixels[(height/2+y)*width+(width/2+x)]=color(rr,rg,rb,1);
    } else {y--;}  
  } else {y++;}
  dir = dir+2+int(random(5));
  if(dir>7){dir=dir-8;}
  switch(dir){
    case 0:
      x++;
      break;
    case 1:
      x++;
      y++;
      break;
    case 2:
      y++;
      break;
    case 3:
      x--;
      y++;
      break;
    case 4:
      x--;
      break;
    case 5:
      x--;
      y--;
      break;
    case 6:
      y--;
      break;
    case 7:
      x++;
      y--;
      break;
  }}
}

void keyPressed() {
  if((key=='q')&&(rrl>-8.0)){rrl=rrl-.3;}
  if((key=='w')&&(rrl<-1.0)){rrl=rrl+.3;}
  if((key=='e')&&(rrr>1.0)){rrr=rrr-.3;}
  if((key=='r')&&(rrr<8.0)){rrr=rrr+.3;}

  if((key=='a')&&(rgl>-8.0)){rgl=rgl-.3;}
  if((key=='s')&&(rgl<-1.0)){rgl=rgl+.3;}
  if((key=='d')&&(rgr>1.0)){rgr=rgr-.3;}
  if((key=='f')&&(rgr<8.0)){rgr=rgr+.3;}

  if((key=='z')&&(rbl>-8.0)){rbl=rbl-.3;}
  if((key=='x')&&(rbl<-1.0)){rbl=rbl+.3;}
  if((key=='c')&&(rbr>1.0)){rbr=rbr-.3;}
  if((key=='v')&&(rbr<8.0)){rbr=rbr+.3;}
}

