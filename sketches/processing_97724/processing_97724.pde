
size(300,300);
background(240,255,240,100);
int a;
a=100;
int b;
b=25;
if((a>50)&&(b<75)){
noFill();
strokeWeight(5);
stroke(218,165,32);
ellipse(3*b,a-25,50,50);
}
if(a<b){
ellipse(100,200,50,50);
}
else{
stroke(32,178,170);
line(235,85,275,125);
line(85,235,125,275);
line(160,160,200,200);
stroke(32,178,170,150);
line(142.5,222.5,182.5,262.5);
line(222.5,142.5,262.5,182.5);
}
if(a!=b){
strokeWeight(10);
stroke(220,20,60);
line(300,0,0,300);
}
