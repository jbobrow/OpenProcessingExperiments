
void setup(){
size(400,400);

background(188,255,250);
fill(0);
ellipse(100,260,100,100);
ellipse(300,260,100,100);
fill(255,255,250);
ellipse(100,260,90,90);
ellipse(300,260,90,90);
ellipse(100,260,10,10);
ellipse(300,260,30,30);
ellipse(300,260,10,10);
ellipse(200,260,40,40);
stroke(222,7,7);
strokeWeight(3);
line(300,260,260,180);
line(260,180,200,260);
line(200,260,125,180);
line(125,180,100,260);
line(125,180,260,180);
line(300,260,200,260);
line(125,180,128.5,170);
line(260,180,262.5,177);
stroke(0);
line(200,280,300,275);
line(200,240,300,245);
fill(0);
rect(200,227.5,20,5);
stroke(222,7,7);
line(200,260,190,290);
line(200,260,210,230);
stroke(0);
rect(180,287.5,20,5);
ellipse(128.5,170,7,7);
rect(250,172,27,5);
strokeWeight(1);
}



float o=0;
int n=16;
float e=2*PI/n;
int x=300;
int y=260;
int r=45;
int ri=4;
int gi=129;
int bi=5;
int x1=100;
int y1=260;
void draw(){
  while(o<2*PI){
    stroke(ri,gi,bi);
    line(x,y,x+cos(o)*r,y+sin(o)*r);
    o=o+e;
    ri=ri+2;
    gi=gi+3;
    bi=bi+5;
  }
  o=0;
  
   while(o<2*PI){
    stroke(ri,gi,bi);
    line(x1,y1,x1+cos(o)*r,y1+sin(o)*r);
    o=o+e;
    ri=ri+2;
    gi=gi+4;
    bi=bi+6;
  }
  noLoop();
}



