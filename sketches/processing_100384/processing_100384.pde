
int a = 0;
int b =0;
int c = 0;


void setup(){
size(200,200);

}
void draw(){
background(10,13,50);
fill(255);
ellipse(12+a,120,2,5);
ellipse(15+a,60,2,5);
ellipse(27+a,80,2,5);
ellipse(43+a,22,2,5);
ellipse(90+b,127,2,5);
ellipse(112+b,15,2,5);
ellipse(180+b,180,2,5);
ellipse(77+b,144,2,5);
ellipse(5+b,157,2,5);
ellipse(10+b,199,2,5);
ellipse(190+b,110,2,5);
ellipse(167+b,90,2,5);
ellipse(133+b,120,2,5);
ellipse(22+b,144,2,5);
ellipse(45+b,120,2,5);
ellipse(21+c,74,2,5);
ellipse(98+c,41,2,5);
ellipse(123+c,159,2,5);
ellipse(49+a,148,2,5);
ellipse(145+c,120,2,5);
ellipse(189+b,19,2,5);
ellipse(182+c,85,2,5);
ellipse(142+b,140 ,2,5);
ellipse(100+c,100,2,5);
ellipse(111+c,90,2,5);
ellipse(129+a,120,2,5);
ellipse(25+c,175,2,5);
if(mousePressed==true){
a = a+3;
b = b-2;
c = c+2;
}
}
