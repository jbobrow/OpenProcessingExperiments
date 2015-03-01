
/*
you can change the rotation speed 
by using the  UP / DOWN arrow keys

project by
Adriano Parracciani
*/



int FR=10;

void setup() {
size(580,580);
stroke(#CD853F);
frameRate(FR);

}

int x=290;
int y=290;
int radius1=140;
int radius2=70;
int radius3=30;
int radius4=15;


float angle1=0;
float angle2=0;
float angle3=0;
float angle4=0;

int alfa;



int step=10;
int s=0;


void draw() {
  smooth();
  background(50);
    strokeWeight(10); 
    point(x,y);
   
  strokeWeight(1); 
  noFill();
  ellipse(x,y,50,50);
  noStroke();
  fill(#CD853F,s);
 // fill(255,s);
  ellipse(x,y,50,50);
  s=s+step;

  if (s>255){
    step=-10;
  }
  if (s==0){
    step=10;
  }
  stroke(#CD853F);
  
  
 for (alfa=0; alfa<360; alfa=alfa+90) {
   
//planet1

float ty=radius1*sin(radians(angle1+alfa));
float tx=radius1*cos(radians(angle1+alfa));
float TX=x+tx;
float TY=y+ty;

  strokeWeight(30);
  point(TX,TY);
   strokeWeight(1);
  line(x,y,TX,TY);
  
  noFill();
   ellipse(TX,TY,50,50);

   
   //planet2
  
  float ty2=radius2*sin(radians(angle2+alfa));
  float tx2=radius2*cos(radians(angle2+alfa));
  //stroke( #CD853F);
  strokeWeight(15);
  float TX2=TX+tx2;
  float TY2=TY+ty2;
  point(TX2,TY2);
  strokeWeight(1);
  line(TX,TY, TX2,TY2);
  
  
      //planet3
  
  float ty3=radius3*sin(radians(angle3+alfa));
  float tx3=radius3*cos(radians(angle3+alfa));  
 // stroke(#CD853F);
  strokeWeight(5);    
  float TX3=TX2+tx3;
  float TY3=TY2+ty3;
  point(TX3,TY3); 
  strokeWeight(1);
  line(TX2,TY2, TX3,TY3);
  noFill();
   ellipse(TX3,TY3,10,10);
   
     
   
   //planet4
  
  float ty4=radius4*sin(radians(angle4+alfa));
  float tx4=radius4*cos(radians(angle4+alfa));  
 // stroke(#CD853F);
  strokeWeight(3);    
  float TX4=TX3+tx4;
  float TY4=TY3+ty4;
  point(TX4,TY4); 
  strokeWeight(1);
  line(TX3,TY3, TX4,TY4);
  noFill();
   ellipse(TX3,TY3,5,5);
   
   
   
}
     
angle1=angle1+1;
angle2=angle2+5;
angle3=angle3+15;
angle4=angle4+25;

}

void keyPressed() {
  if (keyCode==UP && FR<100){
    FR++;
  }
  if (keyCode==DOWN && FR>1){
    FR--;
  }
  
  frameRate(FR);
  }
