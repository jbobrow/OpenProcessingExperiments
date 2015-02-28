
void setup (){
 size (600,380);
 smooth();
}
void draw () {
background (255);
strokeWeight(3);
line(0,0,600,0);
line(0,10,600,10);
line(0,20,600,20);
line(0,30,600,30);
line(0,40,600,40);
line (0,50,600,50);
line(0,60,600,60);
line (0,70,600,70);
line(0,80,600,80);
line(0,90,600,90);
strokeWeight(6);
line(0,100,600,100);
line (0,110,600,110);
line (0,120,600,120);
line(0,130,600,130);
line(0,140,600,140);
strokeWeight(12);
line(0,150,600,150);
line(0,163,600,163);
line(0,170,600,170);
line(0,183,600,183);
strokeWeight(24);
line(0,189,600,189);
strokeWeight(12);
line(0,208,600,208);
line(0,221,600,221);
strokeWeight(6);
line(0,231,600,231);
line(0,241,600,241);
line(0,251,600,251);
line(0,261,600,261);
line(0,271,600,271);
strokeWeight(3);
line(0,281,600,281);
line(0,291,600,291);
line(0,301,600,301);
line(0,311,600,311);
line(0,321,600,321);
line(0,331,600,331);
line(0,341,600,341);
line(0,351,600,351);
line(0,361,600,361);
line(0,371,600,371);
//vertical lines
int x = 0;
strokeWeight(3);
line(x,0,x,390);
while(x < 150){
  line(x,0,x,390);
  x=x+10;
  }
  x=150;
  while(x < 230) {
    strokeWeight(6);
    line(x,0,x,390);
    x=x+10;
  }
  x=230;
  while(x<290) {
    strokeWeight(12);
    line(x,0,x,390);
    x=x+13;
  }
  x=290;
  while(x<310){
    strokeWeight(24);
    line(x,0,x,390);
    x=x+25;
  }
  
}



