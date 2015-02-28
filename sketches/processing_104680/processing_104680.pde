
size(200,200);

int x;
int y;
int kankaku;
kankaku=10;
for(x=5;x<=200;x=x+kankaku){
  for(y=5;y<=200;y=y+kankaku){
    fill(random(255),random(255),random(255));
    ellipse(x,y,kankaku,kankaku);}
}
fill(255,255,255);
rect(30,80,20,40);
triangle(30,80,45,50,50,80);
triangle(30,120,50,120,45,150);
triangle(45,50,50,80,60,60);
triangle(50,120,45,150,60,140);
triangle(45,50,75,50,60,60);
triangle(45,150,60,140,75,150);
triangle(45,50,75,50,60,35);
triangle(45,150,75,150,60,165);
triangle(60,35,75,50,95,30);
triangle(60,165,75,150,95,170);
triangle(75,50,95,30,115,45);
triangle(75,150,95,170,115,155);
triangle(95,30,115,45,130,30);
triangle(95,170,115,155,130,170);
triangle(115,45,130,30,150,50);
triangle(115,155,130,170,150,150);


text("            By Shunya ISONO",10,190);
save("sougou2-C.jpg");



