
int y = 0;

void setup() {
  size(150, 300);
 smooth();
}

void draw() {
background(255);
if(mousePressed){
   line(0, y, width, y);
   line(0, y+4, width, y+4);
   line(0, y+10, width, y+10);
   line(0, y+20, width, y+20);
   line(0, y+35, width, y+35);
   line(0, y+55, width, y+55);
   line(0, y+80, width, y+80);
   line(0, y+110, width, y+110);
   line(0, y+150, width, y+150);
   line(0, y+200, width, y+200);
   line(0, y+260, width, y+260);




  y = y - 1;
  if (y > height) {
y = 0;
 }
}
else{ 
   line(0, y, width, y);
   line(0, y-4, width, y-4);
   line(0, y-8, width, y-8);
   line(0, y-12, width, y-12);
   line(0, y-16, width, y-16);
   line(0, y-20, width, y-20);
   line(0, y-24, width, y-24);
   line(0, y-28, width, y-28);
   line(0, y-32, width, y-32);
   line(0, y-36, width, y-36);
   line(0, y-40, width, y-40);
   line(0, y-44, width, y-44);
   line(0, y-48, width, y-48);
   line(0, y-52, width, y-52);
   line(0, y-56, width, y-56);
  y = y + 1;
}
}

