
int x;
int y;

void setup (){
size (550,550);
}


void draw(){
background(36, 164, 167);

y = 0;

while(y < 600){
x = 0;
while (x < 600){
  
noLoop();
noStroke();
smooth();
fill(random (255), random (255), random (255), random(50));  
ellipse(x,y,20,20);
ellipse(x,y,70,20);
ellipse(x,y,20,20);
ellipse(x,y,90,20);
ellipse(x,y,30,30);
ellipse(x,y,60,60);

x = x + 50;
}
y = y + 30;
}
} 

