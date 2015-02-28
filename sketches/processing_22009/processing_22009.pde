
float p=50,inc,x,y,cx=1,cy=1,c,cf1=191,cf2=150;
float[] a=new float[12];
int[][] dra,col;int i,mode=2,zoo=300,points;
PFont font;
void setup(){
  size(600,600,P2D);
  font=loadFont("Times-Roman-20.vlw");
  textFont(font);
  points=360000;
  inc=float(2)/float(600);
  dra=new int[width][height];
  col=new int[width][height];
  background(0);
  colorMode(HSB);
 for(int k=0;k<12;k++){
   a[k]=random(-1,1);
 }x=random(-1,1);y=random(-1,1);c=random(255);
}
void draw(){
  if(i<points){
    int n=i+10000;
    while(i<n){
     if(random(100)<p){
       float px=x;
       x=a[0]*x+a[1]*y+a[2];
       y=a[3]*px+a[4]*y+a[5];
       c=(c+cf1)/2;
     }else{
       float px=x;
       x=a[6]*x+a[7]*y+a[8];
       y=a[9]*px+a[10]*y+a[11];
       c=(c+cf2)/2;
     }if(i>20){int ex=constrain(int((x+cx)*zoo),0,599);
     int wy=constrain(int((y+cy)*zoo),0,599);
       dra[ex][wy]++;
       col[ex][wy]=int(c);
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
  dra=new int[width][height];
  }else{
  cx+=map(mouseX-pmouseX,-600,600,-1,1);
  cy+=map(mouseY-pmouseY,-600,600,-1,1);
  i=0;
  dra=new int[width][height];
  }
}
void keyPressed(){
  if(key==' '){
  dra=new int[width][height];
  col=new int[width][height];
  background(0);
 for(int k=0;k<12;k++){
   a[k]=random(-1,1);
 }x=random(-1,1);y=random(-1,1);
 i=0;
  }else if(key=='m'){
    mode=(mode+1)%3;
    disp();
  }else if(key=='a'){
    for(int o=0;o<12;o++){
      println(a[o]);
    }
  }else if(key=='d'){
    zoo=300;cx=1;cy=1;p=50;
  }else if(key=='c'){
    cf1=random(255);cf2=random(255);i=0;
  col=new int[width][height];
  }else if(key=='p'){
    p=random(100);i=0;
  dra=new int[width][height];
  }
}
void opts(){
  if(mouseX>50&&mouseY>height-50){
    fill(0);
    rect(0,height-100,150,height);
    fill(255);
    text("points="+str(points),25,height-25);
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
  }
}
void disp(){
  
    loadPixels();
    switch(mode){
      case 0:
    for(int z=0;z<width;z++){
      for(int j=0;j<height;j++){
        pixels[z+j*width]=color(col[z][j],255,map(log(dra[z][j]),0,7,0,255));
      }
    }
    break;
    case 1:
    for(int z=0;z<width;z++){
      for(int j=0;j<height;j++){
        pixels[z+j*width]=color(col[z][j],255,dra[z][j]);
      }
    }
    break;
    case 2:
    
    for(int z=0;z<width;z++){
      for(int j=0;j<height;j++){
        pixels[z+j*width]=color(col[z][j],255,(dra[z][j]>0)? 255:0);
      }
    }
    break;
    }
    updatePixels();
}
       
       

