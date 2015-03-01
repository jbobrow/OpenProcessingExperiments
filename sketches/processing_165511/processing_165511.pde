
void setup(){
size(600, 600);
colorMode(RGB);
background(random(0,255), random(0,255), random(0,255));
}
float pos = 0;
float ps = 600;
void draw(){
fill(random(0,255), random(0,255), random(0,255));
noStroke();

//ellipse 1
ellipse(pos, pos, pos, pos);

//ellipse 2
ellipse(ps, pos, pos, pos);
//ellipse 3
ellipse(pos, ps, pos, pos);
//ellipse 4
ellipse(ps, ps, pos, pos);

pos++;
ps--;
}
