
// Rainbow explosion 
// inspired from Big Bang Theory releasing energy and particals from the center. represting in rainbow colors.


int n=7;
//rainbow colors
color[] palette=   {#8F00FF, #4B0082, #0000FF, #00FF00, #FFFF00, #FF7F00, #FF0000};
float[] cir=new float[n];
int x=0;
int y=0;
int i=30;
boolean pause=false;

void setup(){
 size(800,600);
 background(#000000); 
}

// draws the sketch
void draw(){
  if(pause){
    x=i;
    y=i;
    i++;
    drawRainbow();
    if(x>width)
      noLoop();
  }   
} 

//logic for explosion
void drawRainbow(){  
  background(#000000); 
  noFill();
  noStroke();
  float fx=x/7;
  float fy=y/7;
  float tx=0;
  float ty=0;
  float raddis=0;
  float max=0;
  float localx=0;
  float localy=0;
  int colorpal=0;
  int x1=(int)random(width);
  int y1=(int)random(height);
  int x2=(int)random(width);
  int y2=(int)random(height);
  for(int i=0;i<7;i++){
    tx+=(fx/3)*2;
    ty+=(fx/3)*2;
    raddis=(tx)*(tx)+(tx)*(tx);
    raddis=sqrt(raddis);
    cir[i]=raddis;
   // println(raddis);
  }
  max=raddis;
  float dist;
  for(int i=0;i<1000;i++){
    localx=random(width);
    localy=random(height);
    dist=(width-localx)*(width-localx)+(height-localy)*(height-localy);
    dist=sqrt(dist);
    if(dist>max){
      i--;
      continue;
    }
    if(dist<cir[0]){
      colorpal=0;
    }else if(dist<cir[1]){
      colorpal=1;
    }else if(dist<cir[2]){
      colorpal=2;
    }else if(dist<cir[3]){
      colorpal=3;
    }else if(dist<cir[4]){
      colorpal=4;
    }else if(dist<cir[5]){
      colorpal=5;
    }else if(dist<cir[6]){
      colorpal=6;
    }
    
    if(random(800)<200)
     {
       int sw = (int)random(2);
       strokeWeight(int(sw));    
       stroke(palette[colorpal]);     
       line(localx, localy, localx-(int)(random(20)), localy-(int)(random(20)));
     }else{
        fill(palette[colorpal],random(225));
        int size=(int)random(40);
        ellipse(localx,localy,size,size);
     }
    
    noStroke();
  }  
}

//upon mouse click it will pause and play
void mousePressed(){
  if(pause==false)
   pause=true;
  else
   pause=false;    
}


