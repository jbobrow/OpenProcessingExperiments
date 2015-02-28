
float inc=0.0;
float inc2=0.0;
float inc3=0.0;
float inc4=0.0;
float inc5=0.0;
float inc6=0.0;
float inc7=0.0;
float inc8=0.0;
float inc9=0.0;

void setup(){
  size(600,600);
  smooth();
}

void draw(){
  background(255);
  int [] x={285,435,340,50,-260,-410,-310,-25};
  int [] y={310,20,-295,-445,-345,-60,250,405};
  for(int m=0;m<x.length;m++){
    redflower1(x[m],y[m],1,0.003);
    }
  int [] a={105,443,525,305,-85,-420,-500,-285};
  int [] b={500,280,-120,-455,-533,-315,75,415};
  for(int w=0;w<a.length;w++){
    redflower2(a[w],b[w],1,0.003);
  }
  int [] d={500,705,505,13,-478,-680,-478,7};
  int [] e={480,-13,-512,-713,-510,-20,470,675};
  for(int f=0;f<d.length;f++){
    redflower3(d[f],e[f],1,0.003);
    }
  int [] g={150,225,175,27,-128,-198,-145,0};
  int [] h={140,-8,-163,-235,-178,-37,115,190};
  for(int j=0;j<g.length;j++){
    redflower4(g[j],h[j],1,0.003);
    }
  int [] k={463,410,128,-227,-443,-390,-100,250};
  int [] l={96,-260,-475,-425,-135,218,433,380};
  for(int n=0;n<k.length;n++){
    redflower5(k[n],l[n],1,0.003);
    }
  int [] o={330,340,298,212,93,-40,-167,-268,-330,-340,-297,-212,-93,43,170,269};
  int [] p={100,-35,-160,-263,-320,-330,-290,-205,-85,50,177,277,340,350,305,220};
  for (int q=0;q<o.length;q++){
    blueflower1(o[q],p[q],2,0.005);
  }
  int [] r={70,195,290,340,340,287,190,65,-70,-195,-290,-340,-340,-287,-190,-65};
  int [] s={350,298,200,78,-60,-185,-280,-330,-330,-280,-178,-55,80,210,305,350};
  for (int t=0;t<r.length;t++){
    blueflower2(r[t],s[t],2,0.005);
  }
  int [] u={250,426,537,567,510,375,184,-35,-250,-425,-535,-565,-510,-375,-183,36};
  int [] v={520,385,195,-25,-237,-413,-525,-550,-495,-360,-175,45,260,440,550,575};
  for (int w=0;w<u.length;w++){
    blueflower3(u[w],v[w],2,0.005);
  }
  /*int [] z={520,426,537,567,510,375,184,-35,-250,-425,-535,-565,-510,-375,-183,36};
  int [] aa={300,385,195,-25,-237,-413,-525,-550,-495,-360,-175,45,260,440,550,575};
  for (int bb=0;bb<z.length;bb++){
    purpleflower1(z[bb],aa[bb],2,0.005);
  }*/
}

void redflower1(int x,int y,int segmentLength,float increment){
    if((mouseX>=200)&&(mouseX<=350)&&(mouseY>=230)&&(mouseY<=420)){
      inc+=increment;
    }else{
      inc=inc;
    }
    float angle=sin(inc)/20;
    pushMatrix();
    translate(x,y);
    for(int i=6;i>0;i-=2.5){
      for(int c=-50;c<=255;c+=5){
      stroke(255,64,64,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/4);
}

void redflower2(int a,int b,int segmentLength,float increment){
    if((mouseX>=0)&&(mouseX<=200)&&(mouseY>=400)&&(mouseY<=600)){
      inc2+=increment;
    }else{
      inc2=inc2;
    }
    float angle=sin(inc2)/20;
    pushMatrix();
    translate(a,b);
    for(int i=6;i>0;i-=2.5){
      for(int c=-50;c<=255;c+=5){
      stroke(255,64,64,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/4);
}
 
  void redflower3(int d,int e,int segmentLength,float increment){
    if((mouseX>=440)&&(mouseX<=570)&&(mouseY>=400)&&(mouseY<=600)){
      inc3+=increment;
    }else{
      inc3=inc3;
    }
    float angle=sin(inc3)/20;
    pushMatrix();
    translate(d,e);
    for(int i=6;i>0;i-=2.5){
      for(int c=-50;c<=255;c+=5){
      stroke(255,64,64,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/4);
}
 
  void redflower4(int g,int h,int segmentLength,float increment){
    if((mouseX>=60)&&(mouseX<=200)&&(mouseY>=60)&&(mouseY<=200)){
      inc4+=increment;
    }else{
      inc4=inc4;
    }
    float angle=sin(inc4)/20;
    pushMatrix();
    translate(g,h);
    for(int i=6;i>0;i-=2.5){
      for(int c=-50;c<=255;c+=5){
      stroke(255,64,64,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/4);
}
 
  void redflower5(int k,int l,int segmentLength,float increment){
    if((mouseX>=340)&&(mouseX<=550)&&(mouseY>=0)&&(mouseY<=200)){
      inc5+=increment;
    }else{
      inc5=inc5;
    }
    float angle=sin(inc5)/20;
    pushMatrix();
    translate(k,l);
    for(int i=6;i>0;i-=2.5){
      for(int c=-50;c<=255;c+=5){
      stroke(255,64,64,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/4);
}
void blueflower1(int o,int p,int segmentLength,float increment){
    if((mouseX>=245)&&(mouseX<=425)&&(mouseY>=0)&&(mouseY<=175)){
      println(mouseY);
      inc6+=increment;
    }else{
      inc6=inc6;
    }
    float angle=sin(inc6)/15;
    pushMatrix();
    translate(o,p);
    for(int i=6;i>0;i-=2.5){
      for(int c=-20;c<=255;c+=5){
      stroke(100,149,237,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/8);
}

void blueflower2(int o,int p,int segmentLength,float increment){
    if((mouseX>=0)&&(mouseX<=155)&&(mouseY>=270)&&(mouseY<=400)){
      inc7+=increment;
    }else{
      inc7=inc7;
    }
    float angle=sin(inc7)/15;
    pushMatrix();
    translate(o,p);
    for(int i=6;i>0;i-=2.5){
      for(int c=-20;c<=255;c+=5){
      stroke(100,149,237,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/8);
}

void blueflower3(int u,int v,int segmentLength,float increment){
    if((mouseX>=170)&&(mouseX<=350)&&(mouseY>=410)&&(mouseY<=600)){
      println(mouseY);
      inc8+=increment;
    }else{
      inc8=inc8;
    }
    float angle=sin(inc8)/15;
    pushMatrix();
    translate(u,v);
    for(int i=6;i>0;i-=2.5){
      for(int c=-20;c<=255;c+=5){
      stroke(100,149,237,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/8);
}
/*
void purpleflower1(int z,int aa,int segmentLength,float increment){
    if((mouseX>=170)&&(mouseX<=350)&&(mouseY>=410)&&(mouseY<=600)){
      println(mouseY);
      inc9+=increment;
    }else{
      inc9=inc9;
    }
    float angle=sin(inc9)/15;
    pushMatrix();
    translate(z,aa);
    for(int i=6;i>0;i-=2.5){
      for(int c=-20;c<=255;c+=5){
      stroke(100,149,237,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/8);
}*/

