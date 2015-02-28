
int T;char C=char(int(random(256)));void setup(){size(500,500);fill(color(0,0,0,5));}void draw(){translate(250,250);scale(mouseX/sqrt(T),mouseY/sqrt(T++));rotate(T);text(C,0,0);if(T>200){T=0;}}

