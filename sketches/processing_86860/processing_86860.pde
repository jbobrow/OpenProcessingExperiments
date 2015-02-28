
class jellyfish{
  float[][] poly=new float[5][3];
  float[][] bp=new float[5][3];
  float[][] b2=new float[10][3];
  float[][] b3=new float[5][3];
  float a=36.0;
  float c=0.0;
  float xc,yc,zc,s,t;
  float r=0;
  float inc;
  float dz=0.0;
  color co;
  PImage pm;
  float offx;
  jellyfish(){
  }
  void init(){
    co=color(random(255),random(255),random(255));
    xc=350+random(0,50);
    yc=550+random(0,50);
    offx=100-random(200);
    //pm=loadImage("mask.gif");
    zc=0;
    //pix.mask(pm);
    s=random(10,60);
    inc=TWO_PI/360.0;
    c=random(1)*PI;
    t=(s/60)*30;
    for(int i=0;i<5;i++){
      poly[i][0]=xc+s*cos((a/180)*PI);
      poly[i][1]=yc+s*sin((a/180)*PI);
      poly[i][2]=zc;
      bp[i][0]=xc+s*cos(((a+36)/180)*PI);
      bp[i][1]=yc+s*sin(((a+36)/180)*PI);
      bp[i][2]=zc-t;
      b3[i][0]=xc+s*1.3*cos((a/180)*PI);
      b3[i][1]=yc+s*1.3*sin((a/180)*PI);
      b3[i][2]=zc+t*2;
      a+=72;
    }
    a=18;
    for(int i=0;i<10;i++){
      b2[i][0]=xc+s*.7*cos((a/180)*PI);
      b2[i][1]=yc+s*.7*sin((a/180)*PI);
      b2[i][2]=12;
      a+=36;
    }
  }
  void update(){
    dz+=1;
    if(dz>1800){
      dz=0;
    }
    a=0.0;
    float rs=s*sin(r);
    float ts=t*cos(r+PI/2)*3;
    float pa=sin(r)*10;
    for(int i=0;i<5;i++){
      bp[i][0]=xc+rs*cos(((a+36)/180)*PI);
      bp[i][1]=yc+rs*sin(((a+36)/180)*PI);
      bp[i][2]=ts-10;
      a+=72;
    }
    r+=inc;
    if(r>PI){
      r=0.0;
    }
  }
  void draw(){
    update();
    pushMatrix();
    c += 0.008;
    translate(xc+offx,yc);
    rotateX(PI/2+0.1*sin(c));
    pushMatrix();
    translate(0,0,dz+3*s);
    rotateX(-PI/2);
    popMatrix();
    //stroke(co,80);
    noStroke();
    fill(co,120);
    beginShape();
    for(int i=0;i<5;i++){
      vertex(b3[i][0]-xc+offx,b3[i][1]-yc,b3[i][2]+dz);
    }
    endShape();
    beginShape();
    for(int i=0;i<5;i++){
      vertex(b3[i][0]-xc+offx,b3[i][1]-yc,b3[i][2]+dz);
    }
    for(int i=0;i<5;i++){
      int k=4-i;
      vertex(poly[k][0]-xc+offx,poly[k][1]-yc,poly[k][2]+dz);
    }
    endShape();
    beginShape();
    vertex(b3[4][0]-xc+offx,b3[4][1]-yc,b3[4][2]+dz);
    vertex(b3[0][0]-xc+offx,b3[0][1]-yc,b3[0][2]+dz);
    vertex(poly[0][0]-xc+offx,poly[0][1]-yc,poly[0][2]+dz);
    vertex(poly[4][0]-xc+offx,poly[4][1]-yc,poly[4][2]+dz);
    endShape();
    beginShape(TRIANGLES);
    for(int i=0;i<5;i++){
      vertex(bp[i][0]-xc+offx,bp[i][1]-yc,bp[i][2]+dz);
      vertex(b2[i*2][0]-xc+offx,b2[i*2][1]-yc,b2[i*2][2]+dz);
      vertex(b2[i*2+1][0]-xc+offx,b2[i*2+1][1]-yc,b2[i*2+1][2]+dz);
    }
    endShape();
    popMatrix();
  } 
}

