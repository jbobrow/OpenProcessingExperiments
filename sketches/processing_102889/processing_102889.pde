
Maxim maxim;
AudioPlayer player;
int[] rarray = new int[512*512];
int[] garray = new int[512*512];
int[] barray = new int[512*512];
int[] xarray = new int[512*512];
int[] yarray = new int[512*512];
int[] segment = new int[512*512];

int mouseS=1;
int mouseD=0;

PImage img;
int ctr = 0;
int ctn = 0;

int buttonP = 0;

long timeToWait = 200;// in miliseconds
long lastTime;

void setup()
{
  size(1200,960); 
  maxim = new Maxim(this);  
  background(0);   
  img = createImage(512,512,RGB);    
  player = maxim.loadFile("beat1.wav");
  player.setLooping(true);  
}  
void draw(){  
  background(0);   
  if(buttonP==0){
    udisp();
  }
  else{      
    ustate();
  }    
  
  fill(128,128,128);  
  rect(width-55,55,44,44);
  fill(222,222,222);  
  text("Start",width-46,77);
  fill(128,128,128);   
  rect(width-55,123,44,44);
  fill(222,222,222);  
  text("Stop",width-46,146);  
  fill(128,128,128);  
  rect(width-55,192,44,44);
  fill(222,222,222);  
  text("Clear",width-46,214);
  noFill();    
}
void mousePressed(){
  if((mouseX>=(width-55) & mouseX<=width-11 & mouseY>=55 & mouseY<=99)){
    buttonP=1;
    lastTime = millis();    
    player.play();    
  System.out.println(buttonP);  
  }    
  if((mouseX>=(width-55) & mouseX<=width-11 & mouseY>=123 & mouseY<=167)){
    buttonP=0;
    player.stop();
  System.out.println(buttonP);  
  }     
  if((mouseX>=(width-55) & mouseX<=width-11 & mouseY>=192 & mouseY<=236)){
    buttonP=0;
    player.stop();    
rarray = new int[512*512];
garray = new int[512*512];
barray = new int[512*512];
xarray = new int[512*512];
yarray = new int[512*512];
segment = new int[512*512];
ctr = 0;
ctn = 0;
  System.out.println(buttonP);  
  }  
}  
void mouseDragged(){
            
 if(buttonP==0){     
 mouseD=1;   
 xarray[ctr] = mouseX;
 yarray[ctr] = mouseY;      
  int select = (int)random(3);
  int red = 0;  
  int green = 0;
  int blue = 0;  
  if(select==0){
    red = 255;
    green = 0;
    blue = 0;}
  else if(select==1){    
    red = 0;
    green = 255;
    blue = 0;}
  else if(select==2){      
    red = 0;
    green = 0;
    blue = 255;} 
  rarray[ctr] = red;
  garray[ctr] = green;
  barray[ctr] = blue;
  
//  System.out.println(rarray[ctr]);   
 ctr+=1;
 if(ctr>=width*height){
    ctr = width*height;
 }
 } 
 else if(buttonP==1){   
  player.speed(0.5+(float) mouseY/height/2); 
  player.volume(0.5+2*(float) mouseX/width/2); 
  timeToWait = height-(55+mouseY);
  System.out.println(timeToWait);  
 }   
}
void mouseReleased(){
  if(mouseD==1){  
  segment[ctn] =ctr;
  ctn+=1;
  mouseD=0;
  }  
}  
void udisp(){    
  int tmp=0;  
  for(int temp=1;temp<=ctr-1;temp++){
//    color clr = color(rarray[temp],garray[temp],barray[temp]);
    stroke(rarray[temp],garray[temp],barray[temp], 255);    
    strokeWeight(11);    
    int tp = segment[tmp];
    if(temp==tp){    
      line(xarray[temp],yarray[temp],xarray[temp],yarray[temp]);   
      tmp+=1;
    }
    else{    
      line(xarray[temp-1],yarray[temp-1],xarray[temp],yarray[temp]); 
    }      
//    System.out.println();    
  }  
}  
void ustate(){
  if(millis()-lastTime>=timeToWait){  
  int tmp=0;  
  for(int temp=1;temp<=ctr-1;temp++){
//    color clr = color(rarray[temp],garray[temp],barray[temp]);
    int rtp = rarray[temp];
    rarray[temp] = garray[temp];
    garray[temp] = barray[temp];   
    barray[temp] = rtp;    
    stroke(rarray[temp],garray[temp],barray[temp], 255);    
    strokeWeight(11);    
    int tp = segment[tmp];
    if(temp==tp){    
      line(xarray[temp],yarray[temp],xarray[temp],yarray[temp]);   
      tmp+=1;
    }
    else{    
      line(xarray[temp-1],yarray[temp-1],xarray[temp],yarray[temp]); 
    }
    
//    System.out.println();    
  }    
  lastTime=millis();  
  }
  else{
  int tmp=0;  
  for(int temp=1;temp<=ctr-1;temp++){
//    color clr = color(rarray[temp],garray[temp],barray[temp]);  
    stroke(rarray[temp],garray[temp],barray[temp], 255);    
    strokeWeight(11);    
    int tp = segment[tmp];
    if(temp==tp){    
      line(xarray[temp],yarray[temp],xarray[temp],yarray[temp]);   
      tmp+=1;
    }
    else{    
      line(xarray[temp-1],yarray[temp-1],xarray[temp],yarray[temp]); 
    }
    
//    System.out.println();    
  }
  }    
}  





