
void setup ()
{
  smooth();
 // background(255);
  size(500,500);
}

void draw(){
 int m = minute();
 textSize(100);
 fill(0);
 background(255);
 text(m, 300,380);


pushMatrix();{
{translate(35,420);
}
////////
translate(22.5,-50);
for (int i=0; i<400; i+=35) {
fill(255);
ellipse(i, -150, 30, 30);
}
//stunden
float h = map(hour(),0,12,0,12);
 
translate(0,-150);
if (h>=1) {fill (255,209,152);
ellipse (-35,0,30,30);}
  if(h >=2){
   fill(255,209,152);
   ellipse(0,0,30,30); }
 if(h>=3){
   fill(255,209,152);
 ellipse(35,0,30,30);}
 if(h>=4){
  fill(255,209,152);
 ellipse(70,0,30,30);}
 if(h>=5){
  fill(255,209,152);
 ellipse(105,0,30,30); }
 if(h>=6){
   fill(255,209,152);
 ellipse(140,0,30,30); }
  
  
 if(h>=7){
   fill(255,209,152);
 ellipse(175,0,30,30); }
 if(h>=8){
   fill(255,209,152);
 ellipse(210,0,30,30); }
  if(h>=9){
   fill(255,209,152);
   ellipse(245,0,30,30); }
    if(h>=10){
   fill(255,209,152);
 ellipse(280,0,30,30); }
 if(h>=11){
   fill(255,209,152);
   ellipse(315,0,30,30);}
    if(h>=12){
   fill(255,209,152);
 ellipse(340,0,30,30);
    }
    
popMatrix();///// sek 
translate(359,350);
float sec = map(second(), 0, 60, 0, 360);
fill(0);
  noStroke();
for(int is=0;is<360;is+=2)
{
 pushMatrix();
 rotate(radians(sec));
 
  popMatrix();
}
   

pushMatrix();
  rotate(radians(sec)); // um i rotieren
  translate(0,80);
frameRate(1);
fill(0);
ellipse(0, 0, 15, 15);
  popMatrix();
  fill(255,209,152);
ellipse (0,100,20,20);
  
}}
