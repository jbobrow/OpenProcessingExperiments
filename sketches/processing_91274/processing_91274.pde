
int snakes=10;
int[] x=new int[snakes];
int[] y=new int[snakes];
int[] xl=new int[snakes];
int[] yl=new int[snakes];
int[] dir=new int[snakes];
int[] sw=new int[snakes];
boolean[] ded=new boolean[snakes];
color[] c=new color[snakes];
int rand=20;
int[] check=new int[snakes];
int xt;
int yt;
float colide=0;
boolean spawn = false;
boolean len[]=new boolean[snakes];
float v=300;
float h=300;
float vo=v;
float ho=h;
float rad=75;
float orb=0;
boolean orbed=false;
int tensec=0;
int trans = 255;
float vs=random(-6,6)/200+0.4;
float hs=random(-6,6)/200+0.6;
int[] px=new int[snakes];
int[] py=new int[snakes];
int[] pt=new int[snakes];

void setup (){
background(0);
  size(600,600);
 for(int o=0;o<snakes;o++){
 x[o]=int(random(width));
  y[o]=int(random(height));
  len[o]=false;
  check[o]=0;
  c[o]=color(random(255),random(255),random(255),70);
 sw[o]=1;
 ded[o]=false;
 }
   frameRate(2000);
 if(vs==0)
vs=1;
if(hs==0)
hs=1;
  }
 
  
   
void draw(){
 for(int i=0;i<snakes;i++){
   if(ded[i]==false){
  if(len[i]==false){
  xl[i]=int(random(-rand,rand));
  
  yl[i]=int(random(-rand,rand));
  
  dir[i]=int(random(1,3));

  len[i]=true;
  }else if(dir[i]==1&&check[i]<abs(xl[i])){
  noStroke();
  fill(c[i]);
  if(xl[i]<0)
  x[i]-=1;
  if(xl[i]>0)
  x[i]+=1;
  rect(x[i],y[i],sw[i],sw[i]);
  check[i]++;
  
    } else if(dir[i]==2&&check[i]<abs(yl[i])){
   noStroke();
  fill(c[i]); 
  if(yl[i]<0)
  y[i]-=1;
  if(yl[i]>0)
  y[i]+=1;
   rect(x[i],y[i],sw[i],sw[i]);
  check[i]++;
     
    } else {
      len[i]=false;
      check[i]=0;
    }
    if(x[i]>width)
    x[i]=0;
    if(x[i]<0)
    x[i]=width;
    if(y[i]>height)
    y[i]=0;
    if(y[i]<0)
    y[i]=height;
 } else if(ded[i]==true&&orbed==false&&tensec<5000){
   vo=rad*sin(orb);
   ho=rad*cos(orb);
   noStroke();
   trans=255-(tensec/19);
   fill(trans,trans,trans,15);
   ellipse(ho+h,vo+v,10,10);
   orb+=.005;
   orbed=true;
   tensec++;
 }
 }
   for(int m=0;m<snakes;m++){
    for(int n=0;n<snakes;n++){
     if(m!=n&&x[m]==x[n]&&y[m]==y[n]){
     colide+=0.5;
     println(colide+" COLLISION "+m+" "+n);
     sw[m]++;
     sw[n]++;
      }
     }
    }
     if(spawn==true){
      noStroke();
     fill(1,1,1,10);
    ellipse(h,v,50,50);
      for(int q=0;q<snakes;q++){
    if(dist(h,v,x[q],y[q])<50&&ded[q]==false){
    ded[q]=true; 
   tensec=0; 
      println(q+" dead"); 
     }
   }
    h=h+hs;
    v=v+vs;
    if (h<=0){
  
   h=2;
   hs=-hs;
 }
 if (v<=0){
   v=2;
   vs=-vs;
 }
 if (h>=width){
   h=width-2;
   hs=-hs;
 }
 if (v>=height){
   v=height-2;
   vs=-vs;
 }

     }
     orbed=false;
}
   
void keyPressed(){
 if(spawn==false&&key==' '){
  
  
  spawn=true;
  println(vs+" "+hs);
 } 
  
}



