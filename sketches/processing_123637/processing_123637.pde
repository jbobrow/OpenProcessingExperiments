
int num = 50;
float mx[] = new float[num];
float my[] = new float[num];
void setup() {
  size(400,400);
  background(0);
  stroke(5,5,5);
}  
void draw() {
   fill(0, 50);
  rect(0, 0, width, height);
    fill(255);
  ellipse(random(width), random(height), 3, 3);
fill(89,180,129);
rect(0,350,400,400);
fill(252,252,250);
strokeCap(SQUARE);

for (int y = 0; y <= height; y += 5) { 
  for (int x = 0; x <= width; x += 5) { 
    if (x % 20 == 0) { 
      line(x, y, x-3, y-3); 
    } 
    else { 
      line(x, y, x-3, y+3); 
    } 
  }
}
rect(50,200,320,150);
rect(10,250,300,100);
rect(280,180,80,20);
line(10,260,310,260);
line(10,265,310,265);
line(50,210,370,210);
fill(5,5,5);
rect(97,240,14,110);
rect(150,240,13,110);
rect(100,240,50,20);
fill(144,196,227);
for(int i=0; i<80;i=i+20){
  quad(220+i,280,220+i+10,280,220+i+10,290,220+i,290);
}
for(int i=0; i<80;i=i+20){
  quad(220+i,295,220+i+10,295,220+i+10,305,220+i,305);
}
fill(27,142,58);
line(350,250,350,350);
line(330,290,330,350);
ellipse(350,250,50,50);
ellipse(330,290,30,30);
fill(64,44,4);
rect(113,265,35,85);
fill(5,5,5);
rect(140,310,2,2);
fill(252,252,250);
arc(50,50,50,50,0,PI+TWO_PI);
fill(5,5,5);
arc(45,45,50,50,0,PI+TWO_PI);
fill(252,252,250);
}




