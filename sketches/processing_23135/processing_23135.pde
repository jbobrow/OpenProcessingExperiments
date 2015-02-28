


float i=0;
void setup (){
size(600,400,P3D);
background (86,8,88);}

void draw (){
/*for(int i = 0; i<10; i=i+10) {
for(int e = 0; e<=width; e=e+10)
noStroke( );
lights( );
translate(100, 100, 0);
rotateY(1);
box(50);}*/

while (i<=3000){ 
/*rep (int (random(0,20)),int (random(0,25)), int(random(0,200)));
 i = i+random(1,10);*/
 rep (int (random(0,20*2)),int (random(0,25)), int(random(0,200)));
 i = i+random(1,10);
}}
void rep (int a,int b, int c){
//stroke(a,b,c );
//lights( );
fill (a,b*2,c);
translate(a, b, c);
rotateY(c);
box(50);
//translate(a+2, b*2, c);
//rotateY(b);
//box (30);
noLoop();
}
void mousePressed (){
  saveFrame ("1.png");}

