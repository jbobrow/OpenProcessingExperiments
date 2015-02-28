
size(220, 200);
background(10,114,247);
int y=100;
for (int x=15; x<130; x=x+13) {                     
  colorMode(RGB, 100);
  stroke(x-176); 
  line (x, y, x-15, y+7);
  strokeWeight(3);
  y=y-8;
}
for (int x=100; x<280; x=x+13) {
  strokeWeight(3);
  line (x, y, x+12, y+10);              
  y=y+9;
}
 
for (int x=15; x<130; x=x+13) {
colorMode(RGB, 100);
stroke(x-176);
line(10,100,10,200);
line(210,100,210,200);
rect(30,100,50,100,50,200,30,200);

if(mouseX > 100 && mouseY > 100){
fill(0);
rect(0,0,200,200);
}
}
