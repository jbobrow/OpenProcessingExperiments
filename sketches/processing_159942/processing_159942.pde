
float xoffset = 155;
float yoffset = 155;
 
void setup() {
size(1000, 1000);
smooth();
}
  
void draw() {
//background(214, 211, 255);
//background(162, 214, 255);
scale(0.8);
noStroke();
fill(214, 239, 250);
rect(0, 0, 1500, 100);
fill(214, 237.5, 250);
rect(0, 100, 1500, 100);
fill(214, 236, 250);
rect(0, 200, 1500, 100);
fill(214, 234.5, 250);
rect(0, 300, 1500, 100);
fill(214, 233, 250);
rect(0, 400, 1500, 100);
fill(214, 231.5, 250);
rect(0, 500, 1500, 100);
fill(214, 230, 250);
rect(0, 600, 1500, 100);
fill(214, 228.5, 250);
rect(0, 700, 1500, 100);
fill(214, 227, 250);
rect(0, 800, 1500, 100);
fill(214, 225.5, 250);
rect(0, 900, 1500, 100);
fill(214, 224, 250);
rect(0, 1000, 1500, 100);
fill(214, 221.5, 250);
rect(0, 1100, 1500, 100);
fill(214, 220, 250);
rect(0, 1200, 1500, 100);


int i = 0;
while (i < 9){
//whiteclouds
fill(255,255,255);
ellipse(10+xoffset*i, 10+yoffset*i, 450, 50);
ellipse(70+xoffset*i, 140+yoffset*i, 150, 70);
ellipse(160+xoffset*i, 140+yoffset*i, 150, 50);
ellipse(320+xoffset*i, 185+yoffset*i, 190, 25);

//orangeclouds
fill(255,245,224);
ellipse(690+xoffset*i, 150+yoffset*i, 190, 60);
fill(255,236,224);
ellipse(740+xoffset*i, 175+yoffset*i, 190, 40);
fill(255,236,224);
ellipse(640+xoffset*i, 175+yoffset*i, 190, 30);
fill(255,250,224);
ellipse(640+xoffset*i, 125+yoffset*i, 140, 40);
fill(255,245,224);
ellipse(-200+xoffset*i, 150+yoffset*i, 190, 60);
fill(255,236,224);
ellipse(-150+xoffset*i, 175+yoffset*i, 190, 40);
fill(255,236,224);
ellipse(-250+xoffset*i, 175+yoffset*i, 190, 30);
fill(255,250,224);
ellipse(-250+xoffset*i, 125+yoffset*i, 140, 40);

//whitecloudsonleft
fill(255,255,255);
ellipse(900+xoffset*i, 10+yoffset*i, 450, 50);
ellipse(960+xoffset*i, 140+yoffset*i, 150, 70);
ellipse(1010+xoffset*i, 140+yoffset*i, 150, 50);
ellipse(1170+xoffset*i, 185+yoffset*i, 190, 25);
ellipse(-810+xoffset*i, 10+yoffset*i, 450, 50);
ellipse(-660+xoffset*i, 140+yoffset*i, 150, 50);
ellipse(-750+xoffset*i, 140+yoffset*i, 150, 70);
ellipse(-500+xoffset*i, 185+yoffset*i, 190, 25);

//wispypinkcloud
fill(255,229,245);
ellipse(400+xoffset*i, 85+yoffset*i, 150, 40);
fill(255,229,240);
ellipse(350+xoffset*i, 60+yoffset*i, 100, 40);
fill(255,229,255);
ellipse(320+xoffset*i, 80+yoffset*i, 100, 30);
fill(255,229,245);
ellipse(-450+xoffset*i, 85+yoffset*i, 150, 40);
fill(255,229,240);
ellipse(-500+xoffset*i, 60+yoffset*i, 100, 40);
fill(255,229,255);
ellipse(-530+xoffset*i, 80+yoffset*i, 100, 30);


i = i + 1; // or i++
}
}


