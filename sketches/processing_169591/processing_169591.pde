
/*
By Adriano Parracciani
aka CyberParra
*/


float x;
float y;
int alpha=0;
int i;

void setup() {
size(500,500);
background(0);
stroke(255);
//frameRate(50);
}

void draw () {
 //stroke(random(255));
  for (int alfa=0; alfa<360; alfa++) {
     for (int i=300; i>0; i=i-10) {
     
  //cerchio
  noStroke();
  x=sin(alfa)*50+width/2;
  y=cos(alfa)*50+height/2;
  point(x,y);
  
  //turbolenza
      x=tan(alfa)*i+(width/2);
      stroke(255);
   point(x,y);
   }
     }
  }
  

