
void setup() {
  smooth();
  size(800,450);
  background(#555555);

}
int i=0;
 void mouseReleased() {
      background(#555555);
    }
void draw(){
  frameRate(30);
  int x=int(random(0,800));
  int y=int(random(0,450));
  int a=int(random(0,100));
  int b=int(random(0,100));  

    if (mousePressed && (mouseButton==LEFT)) {
      background(#555555);
      String l = "I love you.";
      fill(#FFFFFF);
      textSize(25);
      text(l,350,225);
    }
    else if (mousePressed && (mouseButton==RIGHT)){
      
      background(#000000);
      frameRate(60);
      String f = "I'M SORRY. I REALLY DON'T KNOW HOW I FEEL.";
      textSize(600);
      fill(#FFFFFF);
      text(f,i,450);
      i=i-30;
      if (x>=width)
      {x=0;
      }
    }
       else {
    fill(#CD0000,b);
    textSize(a);
    String h = "i hate you";
    text(h,x,y);
   
  }}

