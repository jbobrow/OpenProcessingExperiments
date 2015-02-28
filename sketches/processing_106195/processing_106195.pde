
int x = 40;
int y = 40;
void setup(){
size(500,500);
background(255);
}

void draw(){
smooth();
for (int t = 0; t < 5; t = t+1){
line(x,y,250,100);
x = x +10;
y = y +10;
}
}


