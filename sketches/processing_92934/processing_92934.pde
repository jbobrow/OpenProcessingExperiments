
int[] wave = new int[5];
float[] ix=new float[20];
float[] iy=new float[20];
int[] ih=new int[20];
boolean[] id=new boolean[20];
boolean alldead=true;
boolean gameover=false;
int[] sx=new int[500];
int[] mx=new int[500];
int[] lx=new int[500];
int[] zx=new int[500];
int[] sy=new int[500];
int[] my=new int[500];
int[] ly=new int[500];
int[] zy=new int[500];
int[] sn=new int[500];
int[] mn=new int[500];
int[] ln=new int[500];
int[] zn=new int[500];
boolean[] soff= new boolean[500];
boolean[] moff= new boolean[500];
boolean[] loff= new boolean[500];
boolean[] zoff= new boolean[500];
int shipx=400;
int shipy=700;
boolean up=false;
boolean down=false;
boolean left=false;
boolean right=false;
boolean working=false;
boolean lazer=false;
PFont myfont;
int fuck=0;
int lw=0;
boolean flip=true;
int lh=shipy-31;
int ms=0;
int bar=500;
boolean dl=true;
void setup() {
frameRate(60);
  size(600,800,P2D);
 colorMode(RGB);
  background(0);
  rectMode(CENTER);
  myfont= createFont("Courier New Bold", 32);
 for(int z=0;z<500;z++){
   soff[z]=true;
moff[z]= true;
loff[z]= true;
zoff[z]= true;

     
 }
  textSize(30);
  for(int g=0;g<20;g++){
    id[g]=false;
    iy[g]=g*-30;
    ih[g]=50;
  }
}
  
void draw(){
  if(gameover==false){
  background(0);
  rectMode(CENTER);
  for(int i=0;i<500;i++){
    if(loff[i]==true){
   lx[i]=int(random((width-150)+30)-30);
   ly[i]=int(0-i*(random(510)));
   //ln[i]=int(random(0,2));
  loff[i]=false;  
  }
  if(loff[i]==false){
   noStroke();
  fill(22,77,4);
  text(int(random(0,2)),lx[i],ly[i]);
ly[i]+= 4;
  }
  if(ly[i]>height+40)
  loff[i]=true;
   if(zoff[i]==true){
   zx[i]=int(random((width-150)+30)-30);
   zy[i]=int(0-i*(random(400)));
   //zn[i]=int(random(0,2));
  zoff[i]=false;  
  }
  if(zoff[i]==false){
   noStroke();
  fill(47,159,9);
 text(int(random(0,2)),zx[i],zy[i]);
zy[i]+= 6;
  }
  if(zy[i]>height+40)
  zoff[i]=true;
  
  if(moff[i]==true){
   mx[i]=int(random((width-150)+30)-30);
   my[i]=int(0-(random(251)));
  // mn[i]=int(random(0,2));
  moff[i]=false;  
  }
  if(moff[i]==false){
   noStroke();
  fill(64,220,12);
  text(int(random(0,2)),mx[i],my[i]);
my[i]+= 10;
  }
  if(my[i]>height+40)
  moff[i]=true;
  
    
  if(soff[i]==true){
   sx[i]=int(random((width-150)+30)-30);
   sy[i]=int(0-(random(201)));
 //  sn[i]=int(random(0,2));
  soff[i]=false;  
  }
  if(soff[i]==false){
   noStroke();
  fill(148,248,114);
 text(int(random(0,2)),sx[i],sy[i]);
sy[i]+= 15;
  }
  if(sy[i]>height+40)
  soff[i]=true;
  
}
 
if(up==true&&shipy>10)
shipy-=5;
if(down==true&&shipy<height-10)
shipy+=5;
if(left==true&&shipx>25)
shipx-=5;
if(right==true&&shipx<(width-150)-25)
shipx+=5;
  
  
fill(0,0,255);
rect(shipx,shipy,50,20);


if(millis()/50>ms){
flip=!flip;
ms=millis()/50;
}

if(lazer==true&&dl==true){
 
 if(bar<600)
  bar+=2;
 
    
 if(flip==true){
  fill(251,134,4);
   
 } if(flip==false){
  fill(240,0,0);
 }
  triangle(shipx,shipy-10,shipx+lw,shipy-30,shipx-lw,shipy-30);
  quad(shipx-lw,shipy-30,shipx+lw,shipy-30,shipx+lw,lh,shipx-lw,lh);
  if(lw<=15)
  lw++;
  if(lh>0){
  lh-=75;
  } else
  lh=-1;
} 


 fill(150);
 quad(width-150,0,width,0,width,height,width-150,height);
 strokeWeight(2);
 stroke(251,134,4);
 rectMode(CORNERS);
 rect(510,600,540,500);
 fill(251,134,4);
 noStroke();
 rect(510,600,540,bar);
 if(bar>500&&dl==true)
 bar--;
 if(bar>=600)
 dl=false;
 println(bar);
   rectMode(CENTER);
 for(int q=0;q<20;q++){
   if(id[q]==false){
   ix[q]=sin(iy[q]/50)*225+225;
   iy[q]++;
   
   strokeWeight(5);
   stroke(random(255),random(255),random(255));
   if(q!=19)
  line(ix[q],iy[q],ix[q+1],iy[q+1]);
    
   }

   if(ix[q]>shipx-lw&&ix[q]<shipx+lw&&ix[q]>0&&ix[q]<shipy&&lazer==true&&dl==true)
   ih[q]-=10;
   if(ih[q]<=0)
   id[q]=true;
   if(q!=19||q!=20){
   if(id[q]==false&&iy[q]>height)
   gameover=true;
   }
 }
 
 
  }
}
 
void keyPressed(){
   
  if(key=='w')
  up=true;
  if(key=='s')
  down=true;
  if(key=='a')
  left=true;
  if(key=='d')
  right=true;
  if(key==' '){
  lazer=true;
   
  }
   
}
 
 void keyReleased(){
   
   if(key=='w')
  up=false;
  if(key=='s')
  down=false;
  if(key=='a')
  left=false;
  if(key=='d')
  right=false;
   if(key==' '){
  lazer=false;
  lw=0;
  lh=shipy-31; 
  dl=true;
  if(bar>599)
  bar=599;
 }
   
 }



