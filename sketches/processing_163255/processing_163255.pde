
void setup() {
  size(500,500);
  smooth();
  strokeWeight(3);
}

void draw() {
  background(255);
  scrub(250, 200);  
}

void scrub(int x, int y) {

//top
strokeWeight(1);
line(x - 21, y - 20, x - 21, y - 27);
strokeWeight(3);
line(x - 21, y - 27, x - 21, y - 35);
strokeWeight(1);
line(x - 10, y - 20, x - 16, y - 27);
strokeWeight(3);
line(x - 16, y - 27, x - 21, y - 45);
strokeWeight(2);
fill(65,25,3);
rect(x - 20, y, 40, 20);
arc(x, y, 100, 54, PI, PI*2);
arc(x, y, 100, 25, 0, PI);
fill(0);
line(x - 50, y, x + 50, y);
ellipse(x - 20, y, 15, 18);
ellipse(x + 25, y - 2, 15, 18);
ellipse(x + 38, y - 10, 3, 5);
ellipse(x + 35, y + 5, 5, 5);
ellipse(x - 35, y - 8, 5, 5);
ellipse(x - 37, y + 4, 5, 5);
ellipse(x + 45, y + 2, 14, 15);
arc(x - 43, y-2, 18, 18, PI/2, PI * 1.5);
strokeWeight(2);
fill(48,19,2);
line(x-10,y,x-15,y-25);
line(x-30,y,x-15,y-25);
line(x-43,y,x-40,y-13);
line(x,y,x,y - 27);
line(x+16,y,x+18,y - 17);
line(x+30,y-17,x+18,y - 17);
line(x+35,y,x+30,y - 17);

 
//torso 
fill(48,19,2);
rect(x - 50, y + 20,100, 15);
arc(x, y + 25, 115, 18, PI, PI*2);
quad(x - 58, y + 28, x + 58, y + 28, x + 55, y + 55, x - 55, y + 55);
line(x-48,y+28,x-44,y+55);
line(x-38,y+28,x-34,y+55);
line(x-12,y+28,x-8,y+55);
line(x-25,y+28,x-19,y+55);
line(x-1,y+28,x-1,y+55);
line(x+13,y+28,x+10,y+55);
line(x+23,y+28,x+20,y+55);
line(x+33,y+28,x+30,y+55);
line(x+33,y+28,x+30,y+55);
line(x+45,y+28,x+43,y+55);
line(x+45,y+28,x+43,y+55);





//dangly bits
fill(48,19,2);
strokeWeight(8);
line(x-40, y+57, x-45, y+65);
line(x-45, y+65, x-45, y+100);

line(x+30, y+55, x+30, y+65);
line(x+30, y+65, x + 60, y + 75);

line(x-40,y+57,x-45,y+65);
line(x-45,y+65, x-20, y+75);

strokeWeight(5);
line(x-20, y+75, x-20,y+105);
line(x-45, y+100, x-40,y+135);
line(x+60, y+75, x+55, y+100);

strokeWeight(10);
line(x, y+57, x+10, y+95);
line(x+10, y+95, x-10,y+120);
line(x-10,y+120, x+20,y+130);
}



