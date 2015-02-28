
int posx,posy,velx,vely,szx,szy,E,D,segonaBola,posxx,posyy,velxx,velyy,szxx,szyy,vermell,verd,blau;
float sortida,time,sortidasegona;
void setup(){
  size(500,500);
  szx=width/20;
  szy=height/20;
  posx=width/2;
  posy=height/2;
  velx=int(random(3,4));
  vely=int(random(3,4));
 sortida=0;
 sortidasegona=0;
  E=height/2-50;
  D=height/2-50;
  time=0;
  segonaBola=0;
  posxx=width/2;
  posyy=height/2;
  velxx=int(random(3,4));
  velyy=int(random(3,4));
  szxx=width/20;
  szyy=height/20;
 
  
}

void draw(){
  background(255);
  
 if(posy>height/2){
   vermell=100;
   verd=200;
   blau=0;}
   else{
     vermell=0;
     verd=0;
     blau=255;
   }
  rectMode(CENTER);
  strokeWeight(10);
  stroke(0);
  noFill();
  time+=0.01;
  sortida+=0.5;
  sortidasegona+=0.5;
  rect(width/2,height/2,width,height);
 strokeWeight(2);
  fill(vermell,verd,blau);
  ellipse(posx,posy,szx,szy);
  fill(255,0,0);
  if(velx==0){
    velx=1;
  }
    if(vely==0){
    vely=1;
  }
  
  
  
  if (mousePressed){
  segonaBola+=5;
  }
  if(segonaBola>2){
    stroke(time*2,time,time*5);
    ellipse(posxx,posyy,szxx,szyy);
    posxx=posxx+velxx;
    posyy=posyy+velyy;
    
    if(posyy<10+szyy/2){
    posyy=10+szyy/2;
    velyy=-velyy;
  }
  if(posyy>height-10-szyy/2){
    posyy=height-10-szyy/2;
    velyy=-velyy;
  }
  if((posxx<10+szxx/2)&&(posyy<E+100)&&(posyy>E)){
    posxx=10+szxx/2;
    velxx=-velxx*3/2;
  
  }
  if((posxx>width-10-szxx/2)&&(posyy<D+100)&&(posyy>D)){
    
    posxx=width-10-szxx/2;
    velxx=-velxx*3/2;
  }
  if((posxx>width-10-szxx/2)||(posxx<10+szxx/2)){
  posxx=width/2;
  posyy=height/2;
  velxx=0;
  velyy=0;
  sortidasegona=0;
}
  if(sortidasegona==5){
    velxx=int(random(-3,3));
    velyy=int(random(-3,3));
}
  }
  
  if(segonaBola>15){
    segonaBola=0;
  }
  
  stroke(0);
  strokeWeight(10);
  line(10,E,10,E+100);
  line(width-10,D,width-10,D+100);
  
  posx=posx+velx;
  posy=posy+vely;
  

  
  
if(time==15){
  velx+=5;
  vely+=5;
  
 
}
if(time==30){
   velx+=5;
  vely+=5;
  
}
if(time==45){
 velx+=5;
  vely+=5;
   
}
  
  
  
  if(posy<10+szy/2){
    posy=10+szy/2;
    vely=-vely;
  }
  if(posy>height-10-szy/2){
    posy=height-10-szy/2;
    vely=-vely;
  }
  if((posx<10+szx/2)&&(posy<E+100)&&(posy>E)){
    posx=10+szx/2;
    velx=-velx*5/4;
  
  }
  if((posx>width-10-szx/2)&&(posy<D+100)&&(posy>D)){
    
    posx=width-10-szx/2;
    velx=-velx*5/4;
  }
  
 if(keyPressed){
    if(key=='a'){
      E=E-8;
      D=D+8;
    }
    if(key=='z'){
      E=E+8;
      D=D-8;
    }
  }
  if(E>height-100){
    E=height-100;
  }
  if(E<0){
    E=0;
  }
  if(D>height-100){
    D=height-100;}
  if(D<0){
    D=0;
  }
  
if((posx>width-10-szx/2)||(posx<10+szx/2)){
  posx=width/2;
  posy=height/2;
  velx=0;
  vely=0;
  sortida=0;
  time=0;
}
  if(sortida==5){
    time+=1;
    velx=int(random(-3,3));
    vely=int(random(-3,3));
}


if(time<15){
  fill(0);
  textSize(50);
  text("ROUND 1",width/3,height/2);
}
if((time>15)&&(time<30)){
  fill(0);
  textSize(50);
  text("ROUND 2",width/3,height/2);
}
if((time>30)&&(time<45)){
  fill(0);
  textSize(50);
  text("ROUND 3",width/3,height/2);
}
if((time>45)&&(time<60)){
  fill(0);
  textSize(50);
  text("ROUND 4",width/3,height/2);
}
if((time>60)&&(time<75)){
  fill(0);
  textSize(50);
  text("ROUND 5",width/3,height/2);
}


}
  
  
  




