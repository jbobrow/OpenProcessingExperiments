
PGraphics clock, masker, dasoku;
color w, b, cordinater;
int count;
boolean flag, getframe;
void setup() {
  size(400, 400, P3D);
  smooth();
  clock=createGraphics(300, 300, P3D);
  masker=createGraphics(300, 300, P3D);
  dasoku=createGraphics(200, 200, P3D);
  w=color(255);
  b=color(0);
  imageMode(CENTER);
}
void draw() {
  background(b, 1);
  int s=(int)map(second(), 0, 60, 0, 360);
  /*--        clock       --*/
  clock.beginDraw();
  clock.background(b, 1);
  clock.stroke(w, 1);
  clock.translate(clock.width/2, clock.height/2);
  clock.arc(0, 0, 450, 450, -HALF_PI, radians(s)-HALF_PI);
  if(s!=0)flag=false;
  if (s==0){
    cordinate();
  }
  clock.endDraw();
  /*--        masker       --*/
  masker.beginDraw();
  masker.background(b, 1);
  masker.fill(w);
  masker.textSize(48);
  masker.textAlign(CENTER, CENTER);
  masker.pushStyle();
  masker.translate(masker.width/2, masker.height/2);
  for (int i=0; i<60; i++) {
    int lnh;
    if (i%5==0)lnh=40;
    else lnh=25;
    masker.rectMode(CENTER);
    masker.stroke(w);
    masker.line(110, 0, 110+lnh, 0); 
    masker.rotate(radians(6));
  }
  masker.popStyle();
  /*無理矢理気味*/
  String sh, sm, ss;
  if(this.hour()<=9)sh="0"+str(this.hour()%10);
  else sh=str(this.hour());
  if(this.minute()<=9)sm="0"+str(this.minute()%10);
  else sm=str(this.minute());
  if(this.second()<=9)ss="0"+str(this.second()%10);
  else ss=str(this.second());
  masker.text(sh+" :" + sm +" :"+ss, 0, 0);
  masker.endDraw();
  
  dasoku.beginDraw();
  dasoku.background(b,1);
  dasoku.noFill();
  dasoku.strokeWeight(.1);
  dasoku.stroke(w);               //なぜかここが味噌らしい　stroke(b, 1)とかにするとできない
  dasoku.pushMatrix();
  dasoku.translate(dasoku.width/2, dasoku.height/2, 0);
  dasoku.rotateX(radians(frameCount*.1));
  dasoku.sphere(130);
  dasoku.popMatrix();
  dasoku.endDraw();
  image(masker, width/2, height/2);
  blend(dasoku, 0, 0, dasoku.width, dasoku.height, 0, 0, width, height, EXCLUSION);
  blend(clock, 0, 0, clock.width, clock.height, 0, 0, width, height, EXCLUSION);
  if(getframe){
  if(count<200)saveFrame("data/pnpn-####.tif");
  count++;
  }
}
/*--      color cordinate      --*/
void cordinate(){
  if(!flag){
    cordinater=w;
    w=b;
    b=cordinater;
  }
  flag=true;
}
/*--    saveFrame   --*/
/*
void mousePressed(){
  getframe=true;
}
*/

