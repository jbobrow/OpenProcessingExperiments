
float inc=0.0;
float inc2=0.0;
float inc3=0.0;
float inc4=0.0;
float inc5=0.0;
void setup(){
  size(600,600);
  smooth();
}

void draw(){
  background(255);
  int [] x={285,435,340,50,-260,-410,-310,-25};
  int [] y={310,20,-295,-445,-345,-60,250,405};
  for(int m=0;m<x.length;m++){
    flower1(x[m],y[m],1,0.003);
    }
  int [] a={105,443,525,305,-85,-420,-500,-285};
  int [] b={500,280,-120,-455,-533,-315,75,415};
  for(int w=0;w<x.length;w++){
    flower2(a[w],b[w],1,0.003);
  }
  int [] d={500,650,425,-44,-480,-630,-405,63};
  int [] e={400,-70,-517,-668,-435,32,470,620};
  for(int f=0;f<x.length;f++){
    flower3(d[f],e[f],1,0.003);
    }
  int [] g={150,225,175,27,-128,-198,-145,0};
  int [] h={140,-8,-163,-235,-178,-37,115,190};
  for(int j=0;j<x.length;j++){
    flower4(g[j],h[j],1,0.003);
    }
  int [] k={463,410,128,-227,-443,-390,-100,250};
  int [] l={96,-260,-475,-425,-135,218,433,380};
  for(int n=0;n<x.length;n++){
    flower5(k[n],l[n],1,0.003);
    }
}
  
  void flower1(int x,int y,int segmentLength,float increment){
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

void flower2(int a,int b,int segmentLength,float increment){
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
 
  void flower3(int d,int e,int segmentLength,float increment){
    if((mouseX>=400)&&(mouseX<=600)&&(mouseY>=300)&&(mouseY<=500)){
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
 
  void flower4(int g,int h,int segmentLength,float increment){
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
 
  void flower5(int k,int l,int segmentLength,float increment){
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

