
int x;
int y;

void setup (){
size (500,500);
smooth();
}


void draw(){
background(255);

y = 0;

while(y < 600){
x = 0;
while (x < 600){
 
noStroke();
ellipse(x+10,y+25,50,100);
fill(34,255,random(255),50);
ellipse(x-4,y+10,50,50);  
fill(50,255,255,75);
ellipse(x+5,y+5,50,50);
fill(25,100,150,100);
x = x + 20;}
y = y + 30;}
}

