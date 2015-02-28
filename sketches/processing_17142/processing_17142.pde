
float x=-1000000;
float y=-1000000;
float sens;
float sens2;
float bary=250;
float bary2=250;
float V=1.8;
int j1;
int j2;
int time=0;
float al;

  
void setup() {
  j1=0;
  j2=0;
  sens =2;
  sens2 =2;
  size (600,600);

}

void draw() {
  noCursor();
  V=V+0.000001;
  bary2=mouseY-50;
  al=random(20);
  time=time+1;
  frameRate(200);
  x = x + sens;
  y = y + sens2;
  background(255);

  if (time<100) {
    fill(0);
    textSize (150);
    text ('3', 250,200);
  }
  if ((time<200)&&(time>100)) {
    fill(0);
    textSize (150);
    text ('2', 250,200);
  }
  if ((time<300)&&(time>200)) {
    fill(0);
    textSize (150);
    text ('1', 250,200);
  }
  if (time==350) {
    y=300;
    x=300;
  }
  if (y<=10) {
    sens2= 2*V;
  }
  if (y>=590) {
    sens2 = -2*V;
  }

  if ((x<40)&&(x>20)&&(y>bary)&&(y<bary+20)) {
    sens= V;
  }
  if ((x<40)&&(x>20)&&(y>bary+20)&&(y<bary+40)) {
    sens= 2*V;
  }
  if ((x<40)&&(x>20)&&(y>bary+40)&&(y<bary+60)) {
    sens= 3*V;
  }
  if ((x<40)&&(x>20)&&(y>bary+60)&&(y<bary+80)) {
    sens= 2*V;
  }
  if ((x<40)&&(x>20)&&(y>bary+80)&&(y<bary+100)) {
    sens= 1*V;
  }


  if ((x>560)&&(x<580)&&(y>bary2)&&(y<bary2+20)) {
    sens= -1*V;
  }
  if ((x>560)&&(x<580)&&(y>bary2+20)&&(y<bary2+40)) {
    sens= -2*V;
  }
  if ((x>560)&&(x<580)&&(y>bary2+40)&&(y<bary2+60)) {
    sens= -3*V;
  }
  if ((x>560)&&(x<580)&&(y>bary2+60)&&(y<bary2+80)) {
    sens= -2*V;
  }
  if ((x>560)&&(x<580)&&(y>bary2+80)&&(y<bary2+100)) {
    sens= -1*V;
  }

  if( bary<0) {
    bary=0;
  }
  if( bary>500) {
    bary=500;
  }

  if( bary2<0) {
    bary2=0;
  }
  if( bary2>500) {
    bary2=500;
  }

  if((x<0)&&(x>-1)) {
    j2=j2+1;
    time=0;
    V=1.8;
  }

  if((x>600)&&(x<601)) {
    j1=j1+1;
    time=0;
    V=1.8;
  }

  if(j1>20) {
    background(20);
    fill(255);
    textSize(30);
    text ("GAME OVER", 150,200);
    textSize(10);
    text ("(appuyez sur ESPACE pour recommencer)", 150,300);
  }
  if(j2>20) {
    background(0);
    fill(255);
    textSize(30);
    text ("GAGNÉ !", 150,200);
    textSize(10);
    text ("(appuyez sur ESPACE pour recommencer)", 150,300);
  }

  if (time>300) {
    if((x>0)&&(x<600)) {
      if((sens2>0)&&(bary+50<y)&&(al>15.7)) {
        bary=bary+13;
      }

      if((sens2<0)&&(bary+50>y)&&(al>15.7)) {
        bary=bary-13;
      }
    }
  }

  smooth();
  noStroke();
  fill(250,80,80);
  ellipse (x,y,20,20);

  fill(0);
  ellipse (30,bary,20,20);
  ellipse (30,bary+100,20,20);
  rect (20,bary,20,100);
  ellipse (570,bary2,20,20);
  ellipse (570,bary2+100,20,20);
  rect (560,bary2,20,100);

  fill(0);
  textSize(40);
  text (j1, 100,500);
  text (j2, 450,500);
}

void keyPressed() {
  if ((keyCode==' ')&&(j1>20)) {
    time=0;
    j1=0;
    j2=0;
    background (255);
  
  }
  if ((keyCode==' ')&&(j2>20)){
    time=0;
    j1=0;
    j2=0;
    background (255);
  }
  if ((keyCode==' ')&&(x<0)) {
    j2=j2+1;
    time=0;
  }
  if ((keyCode==' ')&&(x>600)) {
    j1=j1+1;
    time=0;
  }

}
                                                                                
