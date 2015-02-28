
class BGStar{
 float x,y,s,m;
 int divtime;
 float zoomscale=(width/3)/zoom;
boolean ihavedivided;
boolean ihavereallydivided;  
  
  BGStar(float xpos,float ypos,float speed,float magnit){
    x=xpos;
    y=ypos;
    s=speed;
    m=magnit;
    
    
  }
  void display(){
    noStroke();
    fill(255);
    ellipse(x,y,m/2,m);
  }
    
  void update(){
    y-=1;
    if(y<=0){
      y=height;
      x=random(0,width);
    }
   if(divider==true){
     divtime+=1;
     x+=1;
     planetx+=.4;
     planet2x+=.2;
     planet3x+=.2;
     planet4x+=.2;
     planet5x+=.2;
     constposx+=.05;
     constposx2+=.05;
     constposx3+=.05;
     constposx4+=.05;
     constposx5+=.05;
     
     ihavedivided=true;
     if(divtime>=zoomscale){
       divtime=0;
       divider=false;
       
     }
   }else if(dividel==true){
     divtime+=1;
     x-=1;
     planetx-=.2;
     planet2x-=.2;
     planet3x-=.2;
     planet4x-=.2;
     planet5x-=.2;
     constposx-=.05;
     constposx2-=.05;
     constposx3-=.05;
     constposx4-=.05;
     constposx5-=.05;
     ihavedivided=true;
     if(divtime>=zoomscale){
       divtime=0;
       dividel=false;
       
     }
   }
   if(divider==false&&dividel==false){
     divtime=0;
   }
    
  }
}

