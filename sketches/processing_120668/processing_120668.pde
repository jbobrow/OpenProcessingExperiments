

Tent tip;
Tent body1;
Tent body2;
Tent body3;
Tent body4;
Tent body5;
Tent body6;
Tent body7;
Tent body8;
Tent body9;
Tent body10;
Tent body11;
Tent body12;
Tent body13;
Tent body14;
Tent body15;
Tent body16;


void setup() {
  size(640, 480); 
  noStroke();  
tip= new Tent();
tip.x=60;
tip.y=60;
tip.w=20;
tip.h=20;
body1= new Tent();
body1.x=60;
body1.y=60;
body1.w=25;
body1.h=25;
body2= new Tent();
body2.x=60;
body2.y=60;
body2.w=30;
body2.h=30;
body3= new Tent();
body3.x=60;
body3.y=60;
body3.w=35;
body3.h=35;
body4= new Tent();
body4.x=60;
body4.y=60;
body4.w=40;
body4.h=40;
body5= new Tent();
body5.x=60;
body5.y=60;
body5.w=45;
body5.h=45;
body6= new Tent();
body6.x=60;
body6.y=60;
body6.w=47.5;
body6.h=47.5;
body7= new Tent();
body7.x=60;
body7.y=60;
body7.w=50;
body7.h=50;
body8= new Tent();
body8.x=60;
body8.y=60;
body8.w=52.5;
body8.h=52.5;
body9= new Tent();
body9.x=60;
body9.y=60;
body9.w=55;
body9.h=55;
body10= new Tent();
body10.x=60;
body10.y=60;
body10.w=57.5;
body10.h=57.5;
body11= new Tent();
body11.x=60;
body11.y=60;
body11.w=60;
body11.h=60;
body12= new Tent();
body12.x=60;
body12.y=60;
body12.w=62.5;
body12.h=62.5;
body13= new Tent();
body13.x=60;
body13.y=60;
body13.w=65;
body13.h=65;
body14= new Tent();
body14.x=60;
body14.y=60;
body14.w=67.5;
body14.h=67.5;
body15= new Tent();
body15.x=60;
body15.y=60;
body15.w=70;
body15.h=70;
body16= new Tent();
body16.x=60;
body16.y=60;
body16.w=72.5;
body16.h=72.5;


}

void draw() { 
  background(51);
  tip.render();
  tip.ease();
  tip.ytarget=mouseY;
  tip.xtarget=mouseX;
  tip.ease2();
  tip.y2target=(body1.y*590)/600;
  tip.x2target=(body1.x*590)/600;
  body1.render();
  body1.ease();
  body1.ytarget=(tip.y*590)/600;
  body1.xtarget=(tip.x*590)/600;
  body1.ease2();
  body1.y2target=(body2.y*590)/600;
  body1.x2target=(body2.x*590)/600;
  body2.render();
  body2.ease();
  body2.ytarget=(body1.y*590)/600;
  body2.xtarget=(body1.x*590)/600;
  body2.ease2();
  body2.y2target=(body3.y*590)/600;
  body2.x2target=(body3.x*590)/600;
  body3.render();
  body3.ease();
  body3.ytarget=(body2.y*590)/600;
  body3.xtarget=(body2.x*590)/600;
  body3.ease2();
  body3.y2target=(body4.y*590)/600;
  body3.x2target=(body4.x*590)/600;
  body4.render();
  body4.ease();
  body4.ytarget=(body3.y*590)/600;
  body4.xtarget=(body3.x*590)/600;
  body4.ease2();
  body4.y2target=(body5.y*590)/600;
  body4.x2target=(body5.x*590)/600;
  body5.render();
  body5.ease();
  body5.ytarget=(body4.y*590)/600;
  body5.xtarget=(body4.x*590)/600;
  body5.ease2();
  body5.y2target=(body6.y*590)/600;
  body5.x2target=(body6.x*590)/600;
  body6.render();
  body6.ease();
  body6.ytarget=(body5.y*590)/600;
  body6.xtarget=(body5.x*590)/600;
  body6.ease2();
  body6.y2target=(body7.y*590)/600;
  body6.x2target=(body7.x*590)/600;
  body7.render();
  body7.ease();
  body7.ytarget=(body6.y*590)/600;
  body7.xtarget=(body6.x*590)/600;
  body7.ease2();
  body7.y2target=(body8.y*590)/600;
  body7.x2target=(body8.x*590)/600;
  body8.render();
  body8.ease();
  body8.ytarget=(body7.y*590)/600;
  body8.xtarget=(body7.x*590)/600;
  body8.ease2();
  body8.y2target=(body9.y*590)/600;
  body8.x2target=(body9.x*590)/600;
  body9.render();
  body9.ease();
  body9.ytarget=(body8.y*590)/600;
  body9.xtarget=(body8.x*590)/600;
  body9.ease2();
  body9.y2target=(body10.y*590)/600;
  body9.x2target=(body10.x*590)/600;
  body10.render();
  body10.ease();
  body10.ytarget=(body9.y*590)/600;
  body10.xtarget=(body9.x*590)/600;
  body10.ease2();
  body10.y2target=(body11.y*590)/600;
  body10.x2target=(body11.x*590)/600;
  body11.render();
  body11.ease();
  body11.ytarget=(body10.y*590)/600;
  body11.xtarget=(body10.x*590)/600;
  body11.ease2();
  body11.y2target=(body12.y*590)/600;
  body11.x2target=(body12.x*590)/600;
  body12.render();
  body12.ease();
  body12.ytarget=(body11.y*590)/600;
  body12.xtarget=(body11.x*590)/600;
  body12.ease2();
  body12.y2target=(body13.y*590)/600;
  body12.x2target=(body13.x*590)/600;
  body13.render();
  body13.ease();
  body13.ytarget=(body12.y*590)/600;
  body13.xtarget=(body12.x*590)/600;
  body13.ease2();
  body13.y2target=(body14.y*590)/600;
  body13.x2target=(body14.x*590)/600;
  body14.render();
  body14.ease();
  body14.ytarget=(body13.y*590)/600;
  body14.xtarget=(body13.x*590)/600;
  body14.ease2();
  body14.y2target=(body15.y*590)/600;
  body14.x2target=(body15.x*590)/600;
  body15.render();
  body15.ease();
  body15.ytarget=(body14.y*590)/600;
  body15.xtarget=(body14.x*590)/600;
  body15.ease2();
  body15.y2target=(body16.y*590)/600;
  body15.x2target=(body16.x*590)/600;
  body16.render();
  body16.ease();
  body16.ytarget=(body15.y*590)/600;
  body16.xtarget=(body15.x*590)/600;
  body16.ease2();
  body16.y2target=0;
  body16.x2target=0;
  
  if (tip.isOverlappingMouse() == true)
  {
    tip.x-=5;
    tip.y-=5;
  }


  }
  
  class Tent
{
float x;
float y;
float w;
float h;
float easing = 0.08;
float xtarget;
float ytarget;
float x2target;
float y2target;
float easing2= 0.03;
float rotation = 0.0;
float s = 1.0;


void ease()
{
  float targetX = xtarget;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = ytarget;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
    
   
  }
}
void ease2()
{
  float targetX2 = x2target;
  float dx2 = targetX2 - x;
  if(abs(dx2) > 1) {
    x += dx2 * easing2;
  }
  
  float targetY2 = y2target;
  float dy2 = targetY2 - y;
  if(abs(dy2) > 1) {
    y += dy2 * easing2;
    
   
  }
}
  boolean isOverlappingMouse()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s)) 
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }




void render()
{
  ellipse(this.x, this.y, this.w, this.h);
}

}



