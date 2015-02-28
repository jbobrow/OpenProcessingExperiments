
int x = 0;
int y = 0;

void setup() {
  size(400,400);
  
 
}

void draw() {
  background(280,140,141);
  strokeWeight(2);
 fill(163,234,229);
 rect(x + 95, y + 140,30,100);
 line(x + 95,y + 180,x + 75,y + 210);
 line(x + 125,y + 180,x + 145,y + 210);
 line(x + 95,y + 240,x + 70,y + 280);
line(x+ 125,y + 240,x + 160,y + 280);
 fill(177,201,203);
ellipse(x + 110,y + 110,120,120);
fill(random(0,250));
ellipse(x + 80,y + 110,30,50);
ellipse(x + 140,y + 110,30,50);

x = x + 1;
y = y + 1;


}


