
boolean q = false;
boolean a = false;
boolean p = false;
boolean l = false;

int p1=0,p2=0;
float x=350,y=250,xv=random(3,6),yv=random(2,6),wh=26,h1=210,h2=210, r=random(10);

void setup(){
  size(700,500);
  frameRate(60);
  if(r<=5) yv*=(-1);
}
void draw(){
 background(0);
 stroke(255);
 line(350,0,350,500);
 noFill();
 ellipse(350,250,150,150);
 fill(255);
 noStroke();
 ellipse(x,y,wh,wh);
 x+=xv;y+=yv;
 if((y>=487)||(y<=13)) yv*=(-1);
 rect(5,h1,15,80);
 rect(680,h2,15,80);
 if(q==true){
   h1+=-6;
 }
 if(a==true){
   h1+=6;
 }
 if(p==true){
   h2+=-6;
 }
 if(l==true){
   h2+=6;
 }
 if((x>17)&&(x<23)&&(y>h1)&&(y<(h1+80))){
   xv*=(-1);
 }
 if((x>677)&&(x<683)&&(y>h2)&&(y<(h2+80))){
   xv*=(-1);
 }
 if(x<-50){
   x=350;y=250;
   xv=random(3,6);yv=random(2,6);
   r=int(random(0,1));
   if(r==0)yv=-yv;
   p2+=1;
 }
 if(x>750){
   x=350;y=250;
   xv=random(3,6);yv=random(2,6);
   r=int(random(0,1));
   if(r==0)yv=-yv;
   xv*=(-1);
   p1+=1;
 }
 if(p1>=1)rect(330,5,15,15);
 if(p1>=2)rect(310,5,15,15);
 if(p1>=3)rect(290,5,15,15);
 if(p1>=4)rect(270,5,15,15);
 if(p1>=5)rect(250,5,15,15);
 if(p1>=6)rect(230,5,15,15);
 if(p1>=7)rect(210,5,15,15);
 if(p1>=8)rect(190,5,15,15);
 if(p1>=9)rect(170,5,15,15);
 if(p1>=10)rect(150,5,15,15);
 
 if(p2>=1)rect(355,5,15,15);
 if(p2>=2)rect(375,5,15,15);
 if(p2>=3)rect(395,5,15,15);
 if(p2>=4)rect(415,5,15,15);
 if(p2>=5)rect(435,5,15,15);
 if(p2>=6)rect(455,5,15,15);
 if(p2>=7)rect(475,5,15,15);
 if(p2>=8)rect(495,5,15,15);
 if(p2>=9)rect(515,5,15,15);
 if(p2>=10)rect(535,5,15,15);

 if((keyPressed==true)&&(key=='r')){
  h1=210;h2=210;x=350;y=250;
  xv=random(3,6);yv=random(2,6);
   r=int(random(-0.4,1.4));
   if(r==0)  yv=-yv;
   r=int(random(-0.4,1.4));
   if(r==0) xv=-xv;
   p1=0;p2=0;
 }
 
}
void keyPressed() {
    if (key == 'q') q = true; 
    if (key == 'a') a = true; 
    if (key == 'p') p = true; 
    if (key == 'l') l = true;
}

void keyReleased() {
    if (key == 'q') q = false; 
    if (key == 'a') a = false; 
    if (key == 'p') p = false; 
    if (key == 'l') l = false;
}

