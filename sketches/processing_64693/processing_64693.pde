
int nosturiX = 460;
int nosturiY = 5;
int kaapeliX = 460;
int kaapeliY = 0;
int kaapeliLoppuX = 460;
int kaapeliLoppuY = 0;
int tukiY = 0;

void setup(){
  size(500,500);
}

void draw() {
nosturiX = mouseX - 25;
kaapeliX = nosturiX + 25;
tukiY = nosturiY + 20;
fill(220,220,220);
rect(-1,-1,501,501);
line(kaapeliX,nosturiY,mouseX,mouseY);
line(nosturiX,nosturiY,500,5);
line(nosturiX,tukiY,500,25);
fill(255,215,0);
rect(nosturiX,nosturiY,50,20);
}

