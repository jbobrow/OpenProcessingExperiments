
int p1 = int(random(25,575));
int p2 = int(random(25,575));
int p3 = int(random(25,575));
int p4 = int(random(25,575));
int p5 = int(random(25,575));
int p6 = int(random(25,575));
int p7 = int(random(25,575));
int p8 = int(random(25,575));
int p9 = int(random(25,575));
int p10 = int(random(25,575));
int p11 = int(random(25,575));
int p12 = int(random(25,575));
int p13 = int(random(25,575));
int p14 = int(random(25,575));
int p15 = int(random(25,575));
int p16 = int(random(25,575));

DMirror m1 = new DMirror(0,50,50,0,1,'a'); 
DMirror m2 = new DMirror(400,450,0,50,-1,'a');
//VMirror m3 = new VMirror(300,0,1000);
//HMirror m4 = new HMirror(100,450,525);

DMirror m5 = new DMirror(p1-25,p1+25,p2-25,p2+25,-1,'1');
DMirror m6 = new DMirror(p3-25,p3+25,p4-25,p4+25,-1,'2');
DMirror m7 = new DMirror(p5-25,p5+25,p1-25,p1+25,-1,'3');
DMirror m8 = new DMirror(p6-25,p6+25,p7-25,p7+25,-1,'4');

DMirror m13 = new DMirror(p9-25,p9+25,p11-25,p11+25,-1,'a');
DMirror m14 = new DMirror(p6-25,p6+25,p12-25,p12+25,-1,'a');
DMirror m15 = new DMirror(p9-25,p9+25,p1-25,p1+25,-1,'a');
DMirror m16 = new DMirror(p8-25,p8+25,p4-25,p4+25,-1,'9');

DMirror m9 = new DMirror(p8-25,p8+25,p9+25,p9-25,1,'5');
DMirror m10 = new DMirror(p10-25,p10+25,p11+25,p11-25,1,'6');
DMirror m11 = new DMirror(p12-25,p12+25,p13+25,p13-25,1,'7');
DMirror m12 = new DMirror(p13-25,p13+25,p14+25,p14-25,1,'8');

//borders
HMirror m50 = new HMirror(0,1000,0);
HMirror m51 = new HMirror(0,1000,600);
VMirror m52 = new VMirror(0,0,1000);
VMirror m53 = new VMirror(600,0,1000);



void setup() {  // setup() runs once
  size(600, 600);
  frameRate(500);
}

int vx = 0;
int vy = 1;
int startx = 25;
int starty = 76;
int curx = startx;
int cury = starty;
int t;
float angle = 0;
int d1 = 8;
int a1;
int a2;
int b1;
int b2;
int i=0;
float j = 0;



void draw(){
background(200);

  curx = curx + vx;
  cury = cury + vy;
  set(curx,cury,#FFFFFF);
  point(curx, cury);
  i+=1;
m1.update(); 
m2.update();  
//m3.update();
//m4.update();
m5.update();
m6.update();
m7.update();
m8.update();
m9.update();
m10.update();
m11.update();
m12.update();
m13.update();
m14.update();
m15.update();
m16.update();


m50.update();
m51.update();
m52.update();
m53.update();

ellipse(curx + cos(angle+90)*10, cury + cos(angle)*10,d1,d1);
ellipse(curx + cos(angle-90)*10, cury + cos(angle)*10,d1,d1);

ellipse(curx + cos(angle+90)*20, cury - cos(angle)*20,d1,d1);
ellipse(curx + cos(angle-90)*20, cury - cos(angle)*20,d1,d1);

ellipse(curx - cos(angle+90)*10, cury - cos(angle)*10,d1,d1);
ellipse(curx - cos(angle-90)*10, cury - cos(angle)*10,d1,d1);

ellipse(curx - cos(angle+90)*20, cury + cos(angle)*20,d1,d1);
ellipse(curx - cos(angle-90)*20, cury + cos(angle)*20,d1,d1);

ellipse(curx + cos(angle)*10, cury + cos(angle+90)*10,d1,d1);
ellipse(curx + cos(angle)*20, cury + cos(angle-90)*20,d1,d1);

ellipse(curx - cos(angle)*30, cury - cos(angle+90)*30,d1,d1);
ellipse(curx - cos(angle)*40, cury - cos(angle-90)*40,d1,d1);

ellipse(curx + cos(angle)*50, cury - cos(angle+90)*50,d1,d1);
ellipse(curx + cos(angle)*60, cury - cos(angle-90)*60,d1,d1);

ellipse(curx - cos(angle)*70, cury + cos(angle+90)*70,d1,d1);
ellipse(curx - cos(angle)*80, cury + cos(angle-90)*80,d1,d1);

ellipse(curx, cury,d1+10,d1+10);

j+=0.5;
angle = j/50 * PI;
//if(j%2==1){angle+=1;}
//if(angle==360){angle=0;}

}

class DMirror 
{ 
  int xm1;
  int xm2;
  int ym1;
  int ym2; 
  int ms;
  char numkey;
  
  DMirror (int x1, int x2, int y1, int y2, int s, char num) 
    {  
    xm1 = x1;
    xm2 = x2;
    ym1 = y1;
    ym2 = y2;
    ms = s;
    numkey=num;
    } 
    
    
void update() 
    { 
    if(mousePressed && key==numkey){
      xm1 = mouseX - 25;
      xm2 = mouseX + 25;
      ym1 = mouseY + 25*ms;
      ym2 = mouseY - 25*ms;
    }
    if(cury==ym2+(ms*(xm2-curx)) && curx>xm1 && curx<xm2)
      {
        t=-ms*vx;
        vx=-ms*vy;
        vy=t;
      } 
      line(xm1, ym1, xm2, ym2); 
    }
}


class VMirror 
{ 
  int xm;
  int ym1;
  int ym2; 
  VMirror (int x1, int y1, int y2) 
    {  
    xm = x1;
    ym1 = y1;
    ym2 = y2;
    } 
  void update() 
    { 
    if(curx==xm && cury<ym2 && cury>ym1)
      {
 
        vx=-vx;
      } 
      line(xm, ym1, xm, ym2); 
    }
}

class HMirror 
{ 
  int xm1;
  int ym;
  int xm2; 
  HMirror (int x1, int x2, int y1) 
    {  
    xm1 = x1;
    xm2 = x2;
    ym = y1;
    } 
  void update() 
    { 
    if(cury==ym && curx<xm2 && curx>xm1)
      {
        vy=-vy;
      } 
      line(xm1, ym, xm2, ym); 
    }
}



void mouseClicked() {
  if(key=='0'){
  curx=mouseX;
  cury=mouseY;
  }
}




