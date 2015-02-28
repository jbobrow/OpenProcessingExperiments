
int x = 0;
int y = 0;


void setup() {
size(500,500);
background(0,70,150);
noStroke();
frameRate(5);

smooth();
}
//rain

void draw (){
background(0,70,150);
  for(int i = 10; i <= width-10; i+=25) {
    fill(random(100),random(200),random(25));
    for(int j=20; j <= height-10; j+=5)
ellipse(20,y,20,20);
x++;
y+=1;

ellipse(60,y,20,20);
x++;
y-=1;

ellipse(80,y,20,20);
x++;
y+=1;

ellipse(100,y,20,20);
x++;
y-=1;

ellipse(120,y,20,20);
x++;
y+=1;

ellipse(180,y,20,20);
x++;
y-=1;

ellipse(200,y,20,20);
x++;
y+=1;
}
}

