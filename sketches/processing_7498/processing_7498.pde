
tier t1;
tier t2;

int zahl=0;

void setup() {
  size (600,600);
  colorMode(HSB);
  strokeCap(SQUARE);
  background(0);

  t1=new tier(80+random(20),100+random(50),0.5*random(-1,1),0.5*random(-1,1));
  t2=new tier(500+random(20),500+random(20),0.5*random(-1,1),0.5*random(-1,1));
}
void draw() {
  float energ;
  zahl=(zahl+1)%10000;

  t1.move();
  t1.display();
  t2.move();
  t2.display();

  energ=6/sqrt(t1.xspeed*t1.xspeed+t1.yspeed*t1.yspeed+t2.xspeed*t2.xspeed+t2.yspeed*t2.yspeed);
  t1.xspeed=t1.xspeed*energ;
  t1.yspeed=t1.yspeed*energ;
  t2.xspeed=t2.xspeed*energ;
  t2.yspeed=t2.yspeed*energ;

}

void mouseReleased(){
  background(10+random(-10,20),180,160+random(-30,10));
  t1.xspeed=random(-1,1);
  t1.yspeed=random(-1,1);
  t2.xspeed=random(-1,1);
  t2.yspeed=random(-1,1);

}
// definition der kreiseigenschaften
class tier{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float farbe;

  tier(float txpos,float typos,float txspeed, float tyspeed){

    xpos=txpos;
    ypos=typos;
    xspeed=txspeed;
    yspeed=tyspeed;
   

  }
  void display(){
     farbe=20*(abs(xspeed)+abs(yspeed));

    float breit=dist(xpos,ypos,xspeed,yspeed)*0.2;
    stroke(85+20*noise(0.1*zahl)+(5*xspeed+abs(height/2-ypos)/5)%225,  55+14*farbe%200,   80+100*noise(zahl)+5*yspeed+5*xspeed,   250/breit);

    strokeWeight(breit);
    line(t1.xpos,t1.ypos,t2.xpos,t2.ypos);
    line(t1.xpos,t2.ypos,t1.ypos,t2.xpos);
    line(abs(t1.xpos-t2.xpos+t2.ypos-t1.ypos),t2.xpos,t2.ypos,t1.xpos);
  }
  void move(){
    float ex;
    float ey;
    float vzx;
    float vzy;
    float vzx_fremd;
    float vzy_fremd;
    float vpx;
    float vpy;
    float vpx_fremd;
    float vpy_fremd;
    float abst;
    float v;
    float vneu;
    float px;
    float py;

    v=sqrt(xspeed*xspeed+yspeed*yspeed);

    //collisioncheck
    abst=dist(t1.xpos,t1.ypos,t2.xpos,t2.ypos);
    if((xpos!=t2.xpos) && (abst<80)) {
      //t1 ist am zug und collidiert t2

      ex=(t2.xpos-xpos)/abst;
      ey=(t2.ypos-ypos)/abst;
      vzx=ex*(xspeed*ex+yspeed*ey);//geändert
      vzy=ey*(xspeed*ex+yspeed*ey);
      vpx=xspeed-vzx;
      vpy=yspeed-vzy;//bis hier die zentral- und parallesgeschw. des eigenen objekts vor stoß
      //nun die parallel- und zentralgeschw. des anderen objekts
      vzx_fremd=ex*(t2.xspeed*ex+t2.yspeed*ey);
      vzy_fremd=ey*(t2.yspeed*ey+t2.xspeed*ex);
      vpx_fremd=t2.xspeed-vzx_fremd;
      vpy_fremd=t2.yspeed-vzy_fremd; //das war die zerlegung der anderen geschw.
      //stoß: die parallelgeschw. bleiben erhalten, die zentralen werden getauscht
      xspeed=vzx_fremd+vpx;
      yspeed=vzy_fremd+vpy;
      t2.xspeed=vzx+vpx_fremd;
      t2.yspeed=vzy+vpy_fremd;
      xpos=t2.xpos-ex*81;//die kollidierende kugel wird außerhalb der kollidierten kugel zurückversetzt
      ypos=t2.ypos-ey*81;

    }

    if((xpos!=t1.xpos) && (abst<80)) {
      //t2 ist am zug und collidiert t1
      ex=(t1.xpos-xpos)/abst;
      ey=(t1.ypos-ypos)/abst;

      vzx=ex*(xspeed*ex+yspeed*ey);

      vzy=ey*(xspeed*ex+yspeed*ey);
      vpx=xspeed-vzx;
      vpy=yspeed-vzy;//bis hier die zentral- und parallesgeschw. des eigenen objekts vor stoß
      //nun die parall- und zentralgeschw. des anderen objekts
      vzx_fremd=ex*(t1.xspeed*ex+t1.yspeed*ey);
      vzy_fremd=ey*(t1.yspeed*ey+t1.xspeed*ex);
      vpx_fremd=t1.xspeed-vzx_fremd;
      vpy_fremd=t1.yspeed-vzy_fremd; //das wird die zerlegung der anderen geschw.
      //stoß: die parallelgeschw. bleiben erhalten, die zentralen werden getauscht
      xspeed=vzx_fremd+vpx;
      yspeed=vzy_fremd*vpy;
      t1.xspeed=vzx+vpx_fremd;
      t1.yspeed=vzy+vpy_fremd;
      xpos=t1.xpos-ex*81;//die kollidierende kugel wird außerhalb der kollidierten kugel zurückversetzt
      ypos=t1.ypos-ey*81;
    }
    // nun folgend die wandreflektionen

    if(xpos<40){
      xpos=40;
      xspeed=-xspeed;
    }
    if(xpos>width-40){
      xpos=width-40;
      xspeed=-xspeed;
    }
    if (ypos<40){
      ypos=40;
      yspeed=-yspeed;
    }
    if (ypos>height-40){
      ypos=height-40;
      yspeed=-yspeed;
    }

    if (mag(xpos-200,ypos-200)<70){// 70 ist die summe der beiden radien - 30 der rote kreis, 40 die bewegten kreise
      ex=(200-xpos)/dist(200,200,xpos,ypos);
      ey=(200-ypos)/dist(200,200,xpos,ypos);

      xspeed=xspeed+2*(xpos-200)/70;
      yspeed=yspeed+2*(ypos-200)/70;   //reflektion an dem roten kreis 
      //korrektur der geschwindigkeit
      vneu=sqrt(xspeed*xspeed+yspeed*yspeed);
      xspeed=xspeed*v/vneu;
      yspeed=yspeed*v/vneu;


      xpos=200-ex*71;//die kollidierende kugel wird außerhalb der kollidierten kugel zurückversetzt
      ypos=200-ey*71;

    }
    if (mag(xpos-400,ypos-400)<70){
      ex=(400-xpos)/dist(400,400,xpos,ypos);
      ey=(400-ypos)/dist(400,400,xpos,ypos);
      xspeed=xspeed+2*(xpos-400)/dist(400,400,xpos,ypos);
      yspeed=yspeed+2*(ypos-400)/dist(400,400,xpos,ypos);
      xpos=400-ex*71;//die kollidierende kugel wird außerhalb der kollidierten kugel zurückversetzt
      ypos=400-ey*71;
      vneu=sqrt(xspeed*xspeed+yspeed*yspeed);
      xspeed=xspeed*v/vneu;
      yspeed=yspeed*v/vneu;
    }
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;  

  }

}













