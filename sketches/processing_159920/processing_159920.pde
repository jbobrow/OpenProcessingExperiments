
void setup() {
size(870, 700);
background(0);

}

void draw() {
  
float xoffset = 0;
float yoffset = 60;

background(255,255,255);



stroke(255,255,255);
strokeWeight(10);
fill(random(255),random(255),random(255));

int i = 0;
while (i < 6){
rect(0+xoffset*i, 10+yoffset*i, 200, 50);
i = i + 1; 

rect(210+xoffset*i, -50+yoffset*i, 200, 50);
rect(420+xoffset*i, -50+yoffset*i, 200, 50);
rect(630+xoffset*i, -50+yoffset*i, 200, 50);
rect(630+xoffset*i, 310 +yoffset*i, 200, 50);
rect(420+xoffset*i, 310 +yoffset*i, 200, 50);
rect(210+xoffset*i, 310 +yoffset*i, 200, 50);
rect(0+xoffset*i, 310 +yoffset*i, 200, 50);

while (i < 6){
rect(0+xoffset*i, 10+yoffset*i, 50, 50);
i = i + 1;

ellipse(50+xoffset*i, -50+yoffset*i, 50, 50);
rect(100+xoffset*i, -50+yoffset*i, 50, 50);
ellipse(150+xoffset*i, -50+yoffset*i, 50, 50);
rect(200+xoffset*i, -50+yoffset*i, 50, 50);
ellipse(250+xoffset*i, -50+yoffset*i, 50, 50);
rect(300+xoffset*i, -50+yoffset*i, 50, 50);
ellipse(350+xoffset*i, -50+yoffset*i, 50, 50);
rect(400+xoffset*i, -50+yoffset*i, 50, 50);
ellipse(450+xoffset*i, -50+yoffset*i, 50, 50);
rect(500+xoffset*i, -50+yoffset*i, 50, 50);
ellipse(550+xoffset*i, -50+yoffset*i, 50, 50);
rect(600+xoffset*i, -50+yoffset*i, 50, 50);
ellipse(650+xoffset*i, -50+yoffset*i, 50, 50);
rect(700+xoffset*i, -50+yoffset*i, 50, 50);
ellipse(750+xoffset*i, -50+yoffset*i, 50, 50);
rect(800+xoffset*i, -50+yoffset*i, 50, 50);
ellipse(850+xoffset*i, -50+yoffset*i, 50, 50);

rect(0+xoffset*i, 310+yoffset*i, 50, 50);
ellipse(50+xoffset*i, 310+yoffset*i, 50, 50);
rect(100+xoffset*i, 310+yoffset*i, 50, 50);
ellipse(150+xoffset*i, 310+yoffset*i, 50, 50);
rect(200+xoffset*i, 310+yoffset*i, 50, 50);
ellipse(250+xoffset*i, 310+yoffset*i, 50, 50);
rect(300+xoffset*i, 310+yoffset*i, 50, 50);
ellipse(350+xoffset*i, 310+yoffset*i, 50, 50);
rect(400+xoffset*i, 310+yoffset*i, 50, 50);
ellipse(450+xoffset*i, 310+yoffset*i, 50, 50);
rect(500+xoffset*i, 310+yoffset*i, 50, 50);
ellipse(550+xoffset*i, 310+yoffset*i, 50, 50);
rect(600+xoffset*i, 310+yoffset*i, 50, 50);
ellipse(650+xoffset*i, 310+yoffset*i, 50, 50);
rect(700+xoffset*i, 310+yoffset*i, 50, 50);
ellipse(750+xoffset*i, 310+yoffset*i, 50, 50);
rect(800+xoffset*i, 310+yoffset*i, 50, 50);
ellipse(850+xoffset*i, 310+yoffset*i, 50, 50);
}

fill(0);
ellipse(mouseX,mouseX,50,50);
fill(255,255,255);
ellipse(mouseY,mouseY,50,50);
fill(0,45);
ellipse(mouseY,mouseX,50,50);

textSize(32);
fill(255,0,0);
text("+",mouseX,mouseY);
fill(255,255,255);
text("*",mouseX,mouseX);
fill(0,0,0);
text("*",mouseY,mouseY);

}
}

