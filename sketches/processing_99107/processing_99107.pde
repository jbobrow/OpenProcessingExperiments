
PFont font;
void setup(){
size(400, 800);
frameRate(24);
font = loadFont("Chiller-Regular-48.vlw");
textFont(font);
}

void draw(){
  background(50);
  textSize(90);
text("CLICK", 110, 120);
//ground surface
strokeWeight(8);
line(0,650,400,650);

//earth
strokeWeight(2);
for (int i = -30; i < 400; i += 8) {
line(i, 650, i+30, 800);
}

//body
strokeWeight(8);
rect(150,450,110,110);
int x = 150; int y =490;
//limbs
line(x,y,x-40,y+40);
line(x+110,y,x+150,y+40);
line(x+20,560,x+20,650);
line(x+90,560,x+90,650);
//hand
ellipse(110,530,20,20);
ellipse(300,530,20,20);

//face
ellipse(200,370,150,150);
//eye
x = 200; y =350;
line(x-20,y,x-40,y);
line(x+20,y,x+40,y);
fill(0);
arc(x-30,y,20,30,0,PI);
arc(x+30,y,20,30,0,PI);
fill(255);

//string
line(110,530,mouseX,mouseY + 50);
//ballon
if (mousePressed){
  fill (255);
} else {
  fill(0);
}
ellipse(mouseX,mouseY,100,120);




}




