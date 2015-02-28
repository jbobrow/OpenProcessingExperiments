
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
PFont myfont;
int fuck=0;
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
textSize(30); 
    
 }
 
}
 
void draw(){
  background(0);
  for(int i=0;i<500;i++){
    if(loff[i]==true){
   lx[i]=int(random(width+30)-30);
   ly[i]=int(0-(random(510)));
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
   zx[i]=int(random(width+30)-30);
   zy[i]=int(0-(random(400)));
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
   mx[i]=int(random(width+30)-30);
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
   sx[i]=int(random(width+30)-30);
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
if(right==true&&shipx<width-25)
shipx+=5;
 
 
fill(0,0,255);
rect(shipx,shipy,50,20);

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
   println("fuck you "+fuck);
fuck++;
  
}


