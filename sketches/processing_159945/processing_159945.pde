
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
 
//ellipse(300, 350, 250, 35);
//ellipse(5, 50, 250, 35);
//ellipse(200, 180, 250, 35);
//ellipse(350, 270, 250, 35);
//ellipse(400, 500, 250, 35);
//ellipse(600, 600, 250, 35);
 
 noStroke();
 fill(255,255,255);
 //bottomcloud
float xoffset = 155;
float yoffset = 155;
ellipse(10, 10, 450, 50);
ellipse(10+xoffset, 10+yoffset, 450, 50);
ellipse(10+xoffset*2, 10+yoffset*2, 450, 50);
ellipse(10+xoffset*3, 10+yoffset*3, 450, 50);
ellipse(10+xoffset*4, 10+yoffset*4, 450, 50);
ellipse(10+xoffset*5, 10+yoffset*5, 450, 50);
ellipse(10+xoffset*6, 10+yoffset*6, 450, 50);
ellipse(10+xoffset*7, 10+yoffset*7, 450, 50);
 
//topcloudleft
ellipse(70, 140, 150, 70);
ellipse(70+xoffset, 140+yoffset, 150, 70);
ellipse(70+xoffset*2, 140+yoffset*2, 150, 70);
ellipse(70+xoffset*3, 140+yoffset*3,150, 70);
ellipse(70+xoffset*4, 140+yoffset*4, 150, 70);
ellipse(70+xoffset*5, 140+yoffset*5, 150, 70);
ellipse(70+xoffset*6, 140+yoffset*6, 150, 70);
ellipse(70+xoffset*7, 140+yoffset*7, 150, 70);
 
//topcloudright
ellipse(160, 140, 150, 50);
ellipse(160+xoffset, 140+yoffset, 150, 50);
ellipse(160+xoffset*2, 140+yoffset*2, 150, 50);
ellipse(160+xoffset*3, 140+yoffset*3,150, 50);
ellipse(160+xoffset*4, 140+yoffset*4, 150, 50);
ellipse(160+xoffset*5, 140+yoffset*5, 150, 50);
ellipse(160+xoffset*5, 140+yoffset*5, 150, 50);
ellipse(160+xoffset*6, 140+yoffset*6, 150, 50);
ellipse(160+xoffset*7, 140+yoffset*7, 150, 50);
 
//bottomcloudright
ellipse(320, 185, 190, 25);
ellipse(320-xoffset, 185-yoffset, 190, 25);
ellipse(320+xoffset, 185+yoffset, 190, 25);
ellipse(320+xoffset*2, 185+yoffset*2, 190, 25);
ellipse(320+xoffset*3, 185+yoffset*3,190, 25);
ellipse(320+xoffset*4, 185+yoffset*4, 190, 25);
ellipse(320+xoffset*5, 185+yoffset*5, 190, 25);
ellipse(320+xoffset*6, 185+yoffset*6, 190, 25);
ellipse(320+xoffset*7, 185+yoffset*7, 190, 25);
 
//orangecloudright
fill(255,245,224);
ellipse(690, 150, 190, 60);
ellipse(690-xoffset, 150-yoffset, 190, 60);
ellipse(690+xoffset, 150+yoffset, 190, 60);
ellipse(690+xoffset*2, 150+yoffset*2, 190, 60);
ellipse(690+xoffset*3, 150+yoffset*3,190, 60);
ellipse(690+xoffset*4, 150+yoffset*4, 190, 60);
ellipse(600+xoffset*5, 150+yoffset*5, 190, 60);
ellipse(600+xoffset*6, 150+yoffset*6, 190, 60);
 
//orangecloudunder1
fill(255,236,224);
ellipse(740, 175, 190, 40);
ellipse(740-xoffset, 175-yoffset, 190, 40);
ellipse(740+xoffset, 175+yoffset, 190, 40);
ellipse(740+xoffset*2, 175+yoffset*2, 190, 40);
ellipse(740+xoffset*3, 175+yoffset*3,190, 40);
ellipse(740+xoffset*4, 175+yoffset*4, 190, 40);
ellipse(650+xoffset*5, 175+yoffset*5, 190, 40);
ellipse(650+xoffset*6, 175+yoffset*6, 190, 40);
 
//orangecloudunder2
fill(255,236,224);
ellipse(640, 175, 190, 30);
ellipse(640-xoffset, 175-yoffset, 190, 30);
ellipse(640+xoffset, 175+yoffset, 190, 30);
ellipse(640+xoffset*2, 175+yoffset*2, 190, 30);
ellipse(640+xoffset*3, 175+yoffset*3,190, 30);
ellipse(640+xoffset*4, 175+yoffset*4, 190, 30);
ellipse(640+xoffset*5, 175+yoffset*5, 190, 30);
ellipse(550+xoffset*6, 175+yoffset*6, 190, 30);
 
//orangecloudtop
fill(255,250,224);
ellipse(640, 125, 140, 40);
ellipse(640-xoffset, 125-yoffset, 140, 40);
ellipse(640+xoffset, 125+yoffset, 140, 40);
ellipse(640+xoffset*2, 125+yoffset*2, 140, 40);
ellipse(640+xoffset*3, 125+yoffset*3,140, 40);
ellipse(640+xoffset*4, 125+yoffset*4, 140, 40);
ellipse(640+xoffset*5, 125+yoffset*5, 140, 40);
ellipse(640+xoffset*6, 125+yoffset*6, 140, 40);
 
//orangecloudleft
fill(255,245,224);
ellipse(-200, 150, 190, 60);
ellipse(-200-xoffset, 150-yoffset, 190, 60);
ellipse(-200+xoffset, 150+yoffset, 190, 60);
ellipse(-200+xoffset*2, 150+yoffset*2, 190, 60);
ellipse(-200+xoffset*3, 150+yoffset*3,190, 60);
ellipse(-200+xoffset*4, 150+yoffset*4, 190, 60);
ellipse(-200+xoffset*5, 150+yoffset*5, 190, 60);
ellipse(-200+xoffset*6, 150+yoffset*6, 190, 60);
ellipse(-200+xoffset*7, 150+yoffset*7, 190, 60);
 
 
//orangecloudunder1
fill(255,236,224);
ellipse(-150, 175, 190, 40);
ellipse(-150-xoffset, 175-yoffset, 190, 40);
ellipse(-150+xoffset, 175+yoffset, 190, 40);
ellipse(-150+xoffset*2, 175+yoffset*2, 190, 40);
ellipse(-150+xoffset*3, 175+yoffset*3,190, 40);
ellipse(-150+xoffset*4, 175+yoffset*4, 190, 40);
ellipse(-150+xoffset*5, 175+yoffset*5, 190, 40);
ellipse(-150+xoffset*6, 175+yoffset*6, 190, 40);
ellipse(-150+xoffset*7, 175+yoffset*7, 190, 40);
 
 
//orangecloudunder2
fill(255,236,224);
ellipse(-250, 175, 190, 30);
ellipse(-250-xoffset, 175-yoffset, 190, 30);
ellipse(-250+xoffset, 175+yoffset, 190, 30);
ellipse(-250+xoffset*2, 175+yoffset*2, 190, 30);
ellipse(-250+xoffset*3, 175+yoffset*3,190, 30);
ellipse(-250+xoffset*4, 175+yoffset*4, 190, 30);
ellipse(-250+xoffset*5, 175+yoffset*5, 190, 30);
ellipse(-250+xoffset*6, 175+yoffset*6, 190, 30);
ellipse(-250+xoffset*7, 175+yoffset*7, 190, 30);
 
//orangecloudtop
fill(255,250,224);
ellipse(-250, 125, 140, 40);
ellipse(-250-xoffset, 125-yoffset, 140, 40);
ellipse(-250+xoffset, 125+yoffset, 140, 40);
ellipse(-250+xoffset*2, 125+yoffset*2, 140, 40);
ellipse(-250+xoffset*3, 125+yoffset*3,140, 40);
ellipse(-250+xoffset*4, 125+yoffset*4, 140, 40);
ellipse(-250+xoffset*5, 125+yoffset*5, 140, 40);
ellipse(-250+xoffset*6, 125+yoffset*6, 140, 40);
ellipse(-250+xoffset*7, 125+yoffset*7, 140, 40);
 
 fill(255,255,255);
 //bottomcloud
ellipse(900, 10, 450, 50);
ellipse(900+xoffset, 10+yoffset, 450, 50);
ellipse(900+xoffset*2, 10+yoffset*2, 450, 50);
ellipse(900+xoffset*3, 10+yoffset*3, 450, 50);
ellipse(900+xoffset*4, 10+yoffset*4, 450, 50);
ellipse(900+xoffset*5, 10+yoffset*5, 450, 50);
ellipse(900+xoffset*6, 10+yoffset*6, 450, 50);
ellipse(900+xoffset*7, 10+yoffset*7, 450, 50);
 
//topcloudleft
ellipse(960, 140, 150, 70);
ellipse(960+xoffset, 140+yoffset, 150, 70);
ellipse(960+xoffset*2, 140+yoffset*2, 150, 70);
ellipse(960+xoffset*3, 140+yoffset*3,150, 70);
ellipse(960+xoffset*4, 140+yoffset*4, 150, 70);
ellipse(960+xoffset*5, 140+yoffset*5, 150, 70);
ellipse(960+xoffset*6, 140+yoffset*6, 150, 70);
ellipse(960+xoffset*7, 140+yoffset*7, 150, 70);
 
//topcloudright
ellipse(1010, 140, 150, 50);
ellipse(1010+xoffset, 140+yoffset, 150, 50);
ellipse(1010+xoffset*2, 140+yoffset*2, 150, 50);
ellipse(1010+xoffset*3, 140+yoffset*3,150, 50);
ellipse(1010+xoffset*4, 140+yoffset*4, 150, 50);
ellipse(1010+xoffset*5, 140+yoffset*5, 150, 50);
ellipse(1010+xoffset*5, 140+yoffset*5, 150, 50);
ellipse(1010+xoffset*6, 140+yoffset*6, 150, 50);
ellipse(1010+xoffset*7, 140+yoffset*7, 150, 50);
 
//bottomcloudright
ellipse(1170, 185, 190, 25);
ellipse(1170-xoffset, 185-yoffset, 190, 25);
ellipse(1170+xoffset, 185+yoffset, 190, 25);
ellipse(1170+xoffset*2, 185+yoffset*2, 190, 25);
ellipse(1170+xoffset*3, 185+yoffset*3,190, 25);
ellipse(1170+xoffset*4, 185+yoffset*4, 190, 25);
ellipse(1170+xoffset*5, 185+yoffset*5, 190, 25);
ellipse(1170+xoffset*6, 185+yoffset*6, 190, 25);
ellipse(1170+xoffset*7, 185+yoffset*7, 190, 25);
 
 
fill(255,255,255);
 //bottomleftcloud
ellipse(-810, 10, 450, 50);
ellipse(-810+xoffset, 10+yoffset, 450, 50);
ellipse(-810+xoffset*2, 10+yoffset*2, 450, 50);
ellipse(-810+xoffset*3, 10+yoffset*3, 450, 50);
ellipse(-810+xoffset*4, 10+yoffset*4, 450, 50);
ellipse(-810+xoffset*5, 10+yoffset*5, 450, 50);
ellipse(-810+xoffset*6, 10+yoffset*6, 450, 50);
ellipse(-810+xoffset*7, 10+yoffset*7, 450, 50);
ellipse(-810+xoffset*8, 10+yoffset*8, 450, 50);
 
 
//topcloudleft
ellipse(-750, 140, 150, 70);
ellipse(-750+xoffset, 140+yoffset, 150, 70);
ellipse(-750+xoffset*2, 140+yoffset*2, 150, 70);
ellipse(-750+xoffset*3, 140+yoffset*3,150, 70);
ellipse(-750+xoffset*4, 140+yoffset*4, 150, 70);
ellipse(-750+xoffset*5, 140+yoffset*5, 150, 70);
ellipse(-750+xoffset*6, 140+yoffset*6, 150, 70);
ellipse(-750+xoffset*7, 140+yoffset*7, 150, 70);
 
//topcloudright
ellipse(-660, 140, 150, 50);
ellipse(-660+xoffset, 140+yoffset, 150, 50);
ellipse(-660+xoffset*2, 140+yoffset*2, 150, 50);
ellipse(-660+xoffset*3, 140+yoffset*3,150, 50);
ellipse(-660+xoffset*4, 140+yoffset*4, 150, 50);
ellipse(-660+xoffset*5, 140+yoffset*5, 150, 50);
ellipse(-660+xoffset*5, 140+yoffset*5, 150, 50);
ellipse(-660+xoffset*6, 140+yoffset*6, 150, 50);
ellipse(-660+xoffset*7, 140+yoffset*7, 150, 50);
 
//bottomcloudright
ellipse(-500, 185, 190, 25);
ellipse(-500-xoffset, 185-yoffset, 190, 25);
ellipse(-500+xoffset, 185+yoffset, 190, 25);
ellipse(-500+xoffset*2, 185+yoffset*2, 190, 25);
ellipse(-500+xoffset*3, 185+yoffset*3,190, 25);
ellipse(-500+xoffset*4, 185+yoffset*4, 190, 25);
ellipse(-500+xoffset*5, 185+yoffset*5, 190, 25);
ellipse(-500+xoffset*6, 185+yoffset*6, 190, 25);
ellipse(-500+xoffset*7, 185+yoffset*7, 190, 25);
 
//wispypinkcloud
fill(255,229,245);
ellipse(400, 85, 150, 40);
ellipse(400-xoffset, 85-yoffset, 150, 40);
ellipse(400+xoffset, 85+yoffset, 150, 40);
ellipse(400+xoffset*2, 85+yoffset*2, 150, 40);
ellipse(400+xoffset*3, 85+yoffset*3,150, 40);
ellipse(400+xoffset*4, 85+yoffset*4, 150, 40);
ellipse(400+xoffset*5, 85+yoffset*5, 150, 40);
ellipse(400+xoffset*6, 85+yoffset*6, 150, 40);
ellipse(400+xoffset*7, 85+yoffset*7, 150, 40);
ellipse(400+xoffset*8, 85+yoffset*8, 150, 40);
//wispypinkcloudtop
fill(255,229,240);
ellipse(350, 60, 100, 40);
ellipse(350-xoffset, 60-yoffset, 100, 40);
ellipse(350+xoffset, 60+yoffset, 100, 40);
ellipse(350+xoffset*2, 60+yoffset*2, 100, 40);
ellipse(350+xoffset*3, 60+yoffset*3,100, 40);
ellipse(350+xoffset*4, 60+yoffset*4, 100, 40);
ellipse(350+xoffset*5, 60+yoffset*5, 100, 40);
ellipse(350+xoffset*6, 60+yoffset*6, 100, 40);
ellipse(350+xoffset*7, 60+yoffset*7, 100, 40);
ellipse(350+xoffset*8, 60+yoffset*8, 100, 40);
//wispypinkcloud
fill(255,229,255);
ellipse(320, 80, 100, 30);
ellipse(320-xoffset, 80-yoffset, 100, 30);
ellipse(320+xoffset, 80+yoffset, 100, 30);
ellipse(320+xoffset*2, 80+yoffset*2, 100, 30);
ellipse(320+xoffset*3, 80+yoffset*3,100, 30);
ellipse(320+xoffset*4, 80+yoffset*4, 100, 30);
ellipse(320+xoffset*5, 80+yoffset*5, 100, 30);
ellipse(320+xoffset*6, 80+yoffset*6, 100, 30);
ellipse(320+xoffset*7, 80+yoffset*7, 100, 30);
ellipse(320+xoffset*8, 80+yoffset*8, 100, 30);
 
 
//wispypinkcloud left
fill(255,229,245);
ellipse(-450, 85, 150, 40);
ellipse(-450-xoffset, 85-yoffset, 150, 40);
ellipse(-450+xoffset, 85+yoffset, 150, 40);
ellipse(-450+xoffset*2, 85+yoffset*2, 150, 40);
ellipse(-450+xoffset*3, 85+yoffset*3,150, 40);
ellipse(-450+xoffset*4, 85+yoffset*4, 150, 40);
ellipse(-450+xoffset*5, 85+yoffset*5, 150, 40);
ellipse(-450+xoffset*6, 85+yoffset*6, 150, 40);
ellipse(-450+xoffset*7, 85+yoffset*7, 150, 40);
ellipse(-450+xoffset*8, 85+yoffset*8, 150, 40);
//wispypinkcloud left top
fill(255,229,240);
ellipse(-500, 60, 100, 40);
ellipse(-500-xoffset, 60-yoffset, 100, 40);
ellipse(-500+xoffset, 60+yoffset, 100, 40);
ellipse(-500+xoffset*2, 60+yoffset*2, 100, 40);
ellipse(-500+xoffset*3, 60+yoffset*3,100, 40);
ellipse(-500+xoffset*4, 60+yoffset*4, 100, 40);
ellipse(-500+xoffset*5, 60+yoffset*5, 100, 40);
ellipse(-500+xoffset*6, 60+yoffset*6, 100, 40);
ellipse(-500+xoffset*7, 60+yoffset*7, 100, 40);
ellipse(-500+xoffset*8, 60+yoffset*8, 100, 40);
//wispypinkcloud left
fill(255,229,255);
ellipse(-530, 80, 100, 30);
ellipse(-530-xoffset, 80-yoffset, 100, 30);
ellipse(-530+xoffset, 80+yoffset, 100, 30);
ellipse(-530+xoffset*2, 80+yoffset*2, 100, 30);
ellipse(-530+xoffset*3, 80+yoffset*3,100, 30);
ellipse(-530+xoffset*4, 80+yoffset*4, 100, 30);
ellipse(-530+xoffset*5, 80+yoffset*5, 100, 30);
ellipse(-530+xoffset*6, 80+yoffset*6, 100, 30);
ellipse(-530+xoffset*7, 80+yoffset*7, 100, 30);
ellipse(-530+xoffset*8, 80+yoffset*8, 100, 30);
 
 
}



