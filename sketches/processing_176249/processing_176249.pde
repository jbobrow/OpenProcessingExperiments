
int first= 100;
int pie= 75;
int color=130;
void setup(){
size(400,200);
}

void draw (){
fill(59,198,235,43);
ellipse(first, pie, color, 50);
color=200;
first=75;
pie=100;
ellipse(first, pie, color, 50);
color=20;
first=50;
pie=70;
ellipse(first, pie, color, 50);
}
