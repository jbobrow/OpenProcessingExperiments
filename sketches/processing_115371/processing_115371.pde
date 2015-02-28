
int x;
int y;

int margenXizq;
int margenXder;
 
int margenYarr;
int margenYabaj;


void setup(){
   size(300,600);
 smooth();
 x=30;
 y=500;
}

void draw(){
background(0,150,0);

fill(0,70,200);
ellipse(265,488,15,23);
rect(240,465,10,10);
rect(250,500,25,50);
rect(240,475,10,35);rect(275,500,10,35);
rect(250,550,12,40);rect(263,550,12,40);
y=y-3;
fill(255,0,0);

ellipse(x,y,30,50);

margenXizq=x-15;
margenXder=x+15;
margenYarr=y-25;
margenYabaj=y+25;

if(mouseX>=margenXizq &  mouseX <=margenXder & mouseY>=margenYarr & mouseY<=margenYabaj 
& mousePressed==true) { y=mouseY; x=mouseX;ellipse(mouseX,mouseY,30,50);
}
if (y<=20){y+=4;}

if (x>=230 & x<=245 & y>=450 & y<=480){x=245;y=460;}
println(x); 
 
 
}









