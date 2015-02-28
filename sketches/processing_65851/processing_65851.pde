
int x=300 ;
int y=300 ;
int a=159 ;
int b=100 ;
void setup(){
size(700,700);
  }
void draw(){
scale(1.5);
if(keyPressed){
background(96,193,64);
fill(0);
text("Squeakels",100,150);
    //sky
stroke(38,220,234);
fill(38,220,234);
rect(0,0,700,85);
fill(167,178,168);
stroke(167,178,168);
 //body
ellipse(a,b,100,40);
 //legs
rect(195,108,10,20);
rect(115,108,10,20);
 //head
triangle(110,60,120,90,80,86);

stroke(0);
noFill();
 
 //tail
stroke(245,101,156);
bezier(210,100,289,120,290,115,270,105);
fill(245,101,156);
ellipse(82,85,3,3);
 //eye
stroke(167,178,169);
fill(0);
ellipse(103,71,5,5);
fill(234,202,38);
//cheese
stroke(234,202,38);
triangle(50,110,78,95,42,90);
  }else{
background(96,193,64);
fill(250,173,58);
stroke(250,173,58);
 //body
ellipse(x,y,200,60);
//head
triangle(220,215,225,238,210,240);
ellipse(215,263,60,50);
fill(0);
//eye
ellipse(205,255,10,10);

//legs
fill(250,173,58);
rect(230,320,30,40);
rect(351,320,30,40);
//tail
quad(380,280,450,240,450,250,380,290);
stroke(255,50,30);
//ball
fill(255,50,30);
ellipse(100,400,90,90);
//sky
stroke(98,227,92);
fill(38,220,234);
rect(0,0,700,85);
fill(0);
text("Ginger",300,240);
 }
  
}

//450,250450,240


