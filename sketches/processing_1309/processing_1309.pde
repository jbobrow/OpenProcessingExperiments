
PImage img,oriimg;
int qr[];
int qri=0;
int lineY[];
int W,H;
void setup(){
  size(397,477);
  frameRate(60);

  W=round(width /2f);
  H=round(height/4f);

  img=createImage(W,H,RGB);
  for(int y=0;y<H;y++)
  for(int x=0;x<W ;x++) img.set(x,y,color(random(255),random(255),random(255)));

  img=loadImage("zombie_my.jpg");  img.resize(W,H);

  oriimg=createImage(img.width,img.height,RGB);
  oriimg.set(0,0,img);

  qr=new int[0xFF+1];
  for(int i=0;i<qr.length;i++) qr[i]=1+floor(random(1000)/1000*1.5);

  lineY=new int[H];
  for(int i=0;i<H;i++) lineY[i]=round(1f*W/2 + sin(1f*i/6f)*10f );

  image(img,0,0,width,height);
}

void mousePressed(){
  img.set(0,0,oriimg);
  noTint();
  image(img,0,0,width,height);
}

//boolean sortHappens;
void draw(){
  noSmooth();
  //smooth();
  //noTint();
  tint(255,255/8);
  image(img,0,0,width,height);
  //sortHappens=false;
  if(millis()>1000)
    for(int i=0;i<1;i++){
      //sortXY0011();
      //sortXY0110();
      sortX();
      sortY();
    }
}

void sortX(){
  color a,b;
  int forbid;
  for(  int y=0;y<H  ;y++){
    for(int x=0;x<W-1;x++){
      a=img.get(x  ,y);
      b=img.get(x+1,y);
      //if(saturation(a)<hue(b)){
      //if(  (red(a)<blue(b))^(green(a)>blue(b)) ){
      if(  (brightness(a)<green(b))^( x>lineY[y] )^( 8<(y&31))  ){
        //sortHappens=true;
        img.set(x  ,y,b);
        img.set(x+1,y,a);
        //x++;
        x+=qr[qri];  qri=(qri+1) & 0xFF;
      }
    }
  }
}
void sortY(){
  color a,b;
  for(  int x=0;x<W  ;x++){
    for(int y=0;y<H-1;y++){
      a=img.get(x,y  );
      b=img.get(x,y+1);
      if(  (brightness(a)>brightness(b))   ){
        //sortHappens=true;
        img.set(x,y  ,b);
        img.set(x,y+1,a);
        //y++;
        y+=qr[qri];  qri=(qri+1) & 0xFF;
      }
    }
  }
}
void sortXY0011(){
  color a,b;
  for(  int x=0;x<W-1;x++){
    for(int y=0;y<H-1;y++){
      a=img.get(x  ,y  );
      b=img.get(x+1,y+1);
      if(red(a)<green(b)){
        //sortHappens=true;
        img.set(x  ,y  ,b);
        img.set(x+1,y+1,a);
      }
    }
  }
}
void sortXY0110(){
  color a,b;
  for(  int x=0;x<W-1;x++){
    for(int y=0;y<H-1;y++){
      a=img.get(x+1,y  );
      b=img.get(x  ,y+1);
      if(brightness(a)<brightness(b)){
        //sortHappens=true;
        img.set(x+1,y  ,b);
        img.set(x  ,y+1,a);
      }
    }
  }
}



