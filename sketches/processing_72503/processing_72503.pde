
void setup() {
size(700, 700);
background(245, 236, 213);
}

void draw() {
smooth();



//GRID 
// for(int d = 0; d<=width; d+=50){
// for(int t = 0; t<=height; t+=50){
// fill(255);
// rect(d,t,50,50);
// }
// }

for (int y = 25; y <= height; y += 50) {
for (int x = 25; x <= width; x += 50) {
if (y <50 || x < 50 || y>650 || x> 650){
fill(255,0,0);
}else if (y <100||x<100||y>600||x>600) {
fill(255,145,0);
}else if (y <150||x<150||y>550||x>550) {
fill(255,247,0);
}else if (y <200||x<200||y>500||x>500) {
fill(0,255,0);
}else if (y <250||x<250||y>450||x>450) {
fill(0,0,255);
}else if (y <300||x<300||y>400||x>400) {
fill(68,17,80);
}else if (y <350||x<350||y>350||x>350) {
fill(211,11,188);
}
ellipse(x, y, 20, 20);

    }
  }

}

