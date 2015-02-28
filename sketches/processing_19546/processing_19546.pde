
void setup()
{
size(250,250);
background(#ffff46);
frameRate(120);
smooth();   
}
float x1,y1,rad1;
int deg=0;
float a=25;
void draw()
{
 
if (a<180)
{a+=0.5;}
else{a-=120;}
  deg+=15;
  rad1=(PI/180)*deg;//converting degrees to radians
  x1=sin(rad1)*50+a;//x1+the center point=> making the circular path
  y1=cos(rad1)*50+a;
  
 background(#ffff46);//backgrong circles and also repeats background
 for(int m=0;m<400;m+=10){
  stroke(255);
  strokeWeight(0.3);
  fill(#ff661c,20);
  ellipse(width/2,height/2,300-m,300-m);
  }
      
 stroke(HSB,200);//handle
 smooth();
 strokeWeight(3);
 line(x1,y1,0,0);
  
 for(int o=0;o<3900;o+=10){//moving circles
   noFill();
   stroke(HSB);
   strokeWeight(1);
   ellipse(random(x1-10,x1+80),random(y1-10,y1+80),random(0.1,7),random(0.2,7));  
}
}


