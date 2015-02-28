
float p=33,inc,x,y,z,cx=1,cy=1,c,cz=1,cf1=191,cf2=150,cf3=100,rx,ry;
float[] a=new float[36];
int[][][] dra,col;int i,mode=2,zoo=50,points,xpos,ypos,zpos=-600;
PFont font;
void setup(){
  size(600,600,P3D);
  font=loadFont("Times-Roman-20.vlw");
  textFont(font);
  points=310000;
  inc=float(2)/float(100);
  dra=new int[100][100][100];
  col=new int[100][100][100];
  background(0);
  colorMode(HSB);
 for(int k=0;k<36;k++){
   a[k]=random(-1,1);
 }x=random(-1,1);y=random(-1,1);z=random(-1,1);c=random(255);
}
void draw(){
  if(i<points){
    int n=i+10000;
    while(i<n){
     if(random(100)<p){
       float px=x,py=y;
       x=a[0]*x+a[1]*y+a[2]*z+a[3];
       y=a[4]*px+a[5]*y+a[6]*z+a[7];
       z=a[8]*px+a[9]*py+a[10]*z+a[11];
       c=(c+cf1)/2;
     }else{
       if(random(p,100)<100-p/2){
       float px=x,py=y;
       x=a[12]*x+a[13]*y+a[14]*z+a[15];
       y=a[16]*px+a[17]*y+a[18]*z+a[19];
       z=a[20]*px+a[21]*py+a[22]*z+a[23];
       c=(c+cf2)/2;
       }else{
       float px=x,py=y;
       x=a[24]*x+a[25]*y+a[26]*z+a[27];
       y=a[28]*px+a[29]*y+a[30]*z+a[31];
       z=a[32]*px+a[33]*py+a[34]*z+a[35];
       c=(c+cf3)/2;
       }
     }if(i>20){int ex=constrain(int((x+cx)*zoo),0,99);
     int wy=constrain(int((y+cy)*zoo),0,99);
     int zee=constrain(int((z+cz)*zoo),0,99);
       dra[ex][wy][zee]++;
       col[ex][wy][zee]=int(c);
     }
     i++;
    }
    disp();
  }
  opts();
}
void mouseDragged(){
  if(keyPressed&&key=='z'){
    zoo+=int(mouseX-pmouseX);
  i=0;
  dra=new int[100][100][100];
  }else{
    ry+=map(mouseX-pmouseX,-100,100,-TWO_PI,TWO_PI);
    rx+=map(mouseY-pmouseY,-100,100,-TWO_PI,TWO_PI);
    disp();
  }
}
void keyPressed(){
  if(key==' '){
  dra=new int[100][100][100];
  col=new int[100][100][100];
  background(0);
 for(int k=0;k<36;k++){
   a[k]=random(-1,1);
 }x=random(-1,1);y=random(-1,1);z=random(-1,1);
 i=0;
  }else if(key=='m'){
    mode=(mode+1)%3;
    disp();
  }else if(key=='l'){
    for(int o=0;o<36;o++){
      println(a[o]);
    }
  }else if(key=='n'){
    zoo=50;cx=1;cy=1;p=50;
  }else if(key=='c'){
    cf1=random(255);cf2=random(255);i=0;cf3=random(255);
  col=new int[100][100][100];
  }else if(key=='p'){
    p=random(100);i=0;
  dra=new int[100][100][100];
  }else if(key=='w'){
    ypos+=10;
    disp();
  }else if(key=='s'){
    ypos-=10;
    disp();
  }else if(key=='a'){
    xpos-=10;
    disp();
  }else if(key=='d'){
    xpos+=10;
    disp();
  }else if(key=='e'){
    zpos+=10;
    disp();
  }else if(key=='q'){
    zpos-=10;
    disp();
  }else if(key=='t'){
    cy+=1;
    i=0;
  dra=new int[100][100][100];
  col=new int[100][100][100];
  }else if(key=='g'){
    cy-=1;
    i=0;
  dra=new int[100][100][100];
  col=new int[100][100][100];
  }else if(key=='f'){
    cx-=1;
    i=0;
  dra=new int[100][100][100];
  col=new int[100][100][100];
  }else if(key=='h'){
    cx+=1;
    i=0;
  dra=new int[100][100][100];
  col=new int[100][100][100];
  }else if(key=='r'){
    cz-=1;
    i=0;
  dra=new int[100][100][100];
  col=new int[100][100][100];
  }else if(key=='y'){
    cz+=1;
    i=0;
  dra=new int[100][100][100];
  col=new int[100][100][100];
  }
}
void opts(){
  /*if(mouseX>50&&mouseY>100-50){
    fill(0);
    rect(0,100-100,150,100);
    fill(255);
    text("points="+str(points),25,100-25);
    if(keyPressed){
      if(key==BACKSPACE){
        if(points>10){
        points=int(points/10);
        }else{
          points=0;
        }
      }else{
        if(int(key)>47 &&int(key)<58){
          if(points==0){
            points=int(key)-48;
          }else{
          points=points*10+int(key)-48;
          }
        }
      }
      delay(100);
    }
  }*/
}
void disp(){
   background(0);
   pushMatrix();
   translate(300+xpos,300+ypos,300+zpos);
   rotateX(rx);
   rotateY(ry);
   translate(-300,-300,-300);
    
    for(int r=0;r<100;r++){
      for(int j=0;j<100;j++){
        for(int w=0;w<100;w++){
          if(dra[r][j][w]!=0){
            stroke(col[r][j][w],255,255);
            point(r*6,j*6,w*6);
          }
        }
      }
    }
    popMatrix();
}
       
       

