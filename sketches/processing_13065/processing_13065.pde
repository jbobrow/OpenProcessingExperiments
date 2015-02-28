
void setup() {
size(640,480);
strokeCap(SQUARE);
smooth();







color orange= color(255,79,8);
color teal= color(1,133,102);
color brown= color(93,54,42);
color yellow= color(245,184,0);
color rred= color(193,9,37);
color bleu=color(60,62,152);

background(225,210,178);

//black lines
line(240,315,297,337);
line(462,375,636,424);
line(602,379,606,474);
line(542,351,542,474);
line(462,319,462,457);
line(97,384,578,375);
line(237,299,378,240);
line(216,409,237,299);
line(228,222,233,479);
line(175,261,355,261);
line(157,380,194,201);
line(84,330,84,470);
line(0,270,152,368);
line(0,270,500,92);
line(0,176,43,194);
line(0,119,640,402);
line(256,119,347,161);
line(309,102,470,154);
line(372,85,618,125);
line(549,67,636,128);
line(446,0,446,102);
line(515,0,591,15);
line(378,4,127,102);
line(0,88,135,83);
strokeWeight(7);
line(0,19,297,148);
line(426,0,495,83);
line(0,299,261,479);

//cornersquare
fill(166,141,186,150);
noStroke();
rect(560,0,90,70);

//pink rect
noStroke();
fill(229,132,147,190);
beginShape();
vertex(14.5,120.1);
vertex(561.8,224.4);
vertex(561.841,398.053);
vertex(14.554,270.921);
endShape();

//brown lines
stroke(brown);
strokeWeight(10);
line(0,0,640,74);
line(0,368,526,474);
line(8,148,640,251);
strokeWeight(7);
stroke(194,149,86);
line(379,0,385,189);

//whiteshape
noStroke();
fill(255);
beginShape();
vertex(0,138.363 );
vertex(481.22,23.635);
vertex(615.328,42.24);
vertex(0,164.72);
endShape();

//orange triangle
fill(orange,220);
beginShape();
vertex(0,0);
vertex(295.9,0);
vertex(135.4,240);
vertex(0,53);
endShape();


//teal stuff
fill(teal);
float tt= 267.266;
float ll=307.664;
beginShape();
vertex(tt,275.571);
vertex(ll,275.571);
vertex(ll,479.76);
vertex(tt,479.76);
endShape();
beginShape();
vertex(tt+75.194,275.571);
vertex(ll+72.006,275.571);
vertex(ll+72.006,479.76);
vertex(tt+75.194,479.76);
endShape();



//blue circles
fill(bleu);
ellipse(352.348,60,60,60);
ellipse(70,201,60,60);
//red circle
fill(rred);
ellipse(319,132,45,45);

//teal bezier shape
fill(teal,200);
beginShape();
vertex(0,312);
vertex(198.274,228.411);
bezierVertex(230.526,350.104,-230.526,374.951, 0,345);
endShape();
beginShape();
vertex(208.353,224.411);
vertex(390.522,138.363 );
bezierVertex(388.923,178.673,359.516,200.828,374.244,188.75);
endShape();


//yellow stuff
noStroke();
fill(yellow);
beginShape();
vertex(0,404);
vertex(92,479);
vertex(0,480);
endShape();
ellipse(341,0,40,40);

//the star
//my for loop test. GET IT: 


//line(K446,l138,i528,l138);
//line(k>389,l>315,k446,l<315);
//k=x1  i=x2 l=y1&y2
stroke(0);
int l=138;
int k=446;
while(l<315 && k>389){
  for (int i = 528; i > 446; i = i-6) {
  strokeWeight(4);
    line(k, l, i, l);
  l=l+13;
  k=k-4;
  }}
  
//line(k398,l138,i528,l138);
//line(k>344,l>315,k446,l<315);

l=138;
int x=389;
while(l<315 && x>344){
  for (int i = 528; i > 446; i = i-6) {
  strokeWeight(1);
    line(x, l, i, l);
  l=l+13;
  x=x-4;
  }}

  
  //line(Xa,207,Xa2,207);
  //line(452,245,533,245
  
  int Xa=403; int Xa2=586;
  while(Xa<452 && Xa2>533){
    for(int i=207; i<245; i= i+9){
      strokeWeight(7);
      line(Xa,i,Xa2,i);
      Xa=Xa+12;
      Xa2=Xa2-12;
    }}      
  
  //line(355,207,Xa2,207);
  //line(398,245,533,245);
  
        Xa=355;  Xa2=586;
  while(Xa<398 && Xa2>533){
    for(int i=207; i<245; i= i+9){
      strokeWeight(5);
      line(Xa,i,Xa2,i);
      Xa=Xa+12;
      Xa2=Xa2-12;}}
      
   //line(309,207,Xa2,207);
  //line(360,245,533,245);    
      
         Xa=309;  Xa2=586;
  while(Xa<360 && Xa2>533){
    for(int i=207; i<245; i= i+9){
      strokeWeight(1);
      line(Xa,i,Xa2,i);
      Xa=Xa+12;
      Xa2=Xa2-12;}}
    
     //OK LETS JUST MKAKE THE ACTUAL STAR
      //3 main lines
        //top line: 489,140,490,140
     //center line:  452,245,533,245
    
      
        float a=489;  float a2=490;
  while(a>452 && a2<533){
    for(int i=140; i<245; i= i+6){
      strokeWeight(3);
      line(a,i,a2,i);
      a=a-3;
      a2=a2+3;
    
  
 }}
   
 //452,245,533,245
// 433,315,434,315
 
 float lll=452; float kk=533;
while(lll>440 && kk>441){
  for (int i = 245; i < 315; i = i+7) {
  strokeWeight(5);
    line(lll, i, kk, i);
  lll=lll-1.2;
  kk=kk-9.2;
  }}
//452,245,533,245
// 557,315,558,315

  lll=452;  kk=533;
while(lll<557 && kk<558){
  for (int i = 245; i < 315; i = i+7) {
  strokeWeight(5);
    line(lll, i, kk, i);
  lll=lll+10.5;
  kk=kk+2.5;
  }}
  
  //542,138,591,138
  //604,315,640,315
  
    lll=542;  kk=591;
while(lll<604 && kk<640){
  for (int i = 138; i < 315; i = i+10) {
  strokeWeight(5);
    line(lll, i, kk, i);
  lll=lll+7;
  kk=kk+1;
  }}


}
                
