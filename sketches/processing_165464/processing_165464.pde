
void setup(){
size(600, 600);
colorMode(RGB);
background(random(0,255), random(0,255), random(0,255));
}
float pos = 0;
float ps = 600;
void draw(){
noStroke();
fill(random(0,255), random(0,255), random(0,255));
//ellipse 1
ellipse(pos, pos, pos, pos);
fill(random(0,255), random(0,255), random(0,255));
//ellipse 2
ellipse(ps, pos, pos, pos);
fill(random(0,255), random(0,255), random(0,255));
//ellipse 3
ellipse(pos, ps, pos, pos);
fill(random(0,255), random(0,255), random(0,255));
//ellipse 4
ellipse(ps, ps, pos, pos);
fill(random(0,255), random(0,255), random(0,255));

pos++;
ps--;
}
