
//draw diagonal lines
void setup (){
size (600,200);
smooth();
background(100,100,255,150);
}
/* hard coded lines
void draw (){
strokeWeight(8);
stroke(100,250,50);
line (20,40,80,80);
line (80,40,140,80);
line (140,40,200,80);
line (200,40,260,80);
}
*/
void draw(){
strokeWeight(8);
stroke(random(0,10),random(0,10), random(0,10));
for(int i=20; i<500; i+=16) {
stroke(random(50,100),random(50,100), random(50,100));
line(i,40,i+i/2,80);
line(i+i/2,80,i,120);
}
}
