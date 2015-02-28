
void setup(){//setup of skyline
size(900, 300);
background(206, 182, 247);
fill(0, 0, 0);
beginShape(LINES);
line(0,50, 10, 70);//mountain
line(10, 70, 50, 90);//mountain
line(50, 90, 60, 100);//mountain
line(60, 100, 80,105);//mountain
line(80, 105, 95, 60);//mountain
line(95, 60, 100, 58);//mountain
line(100, 58, 110, 53);//mountain
line(110, 53, 120, 45);//mountain
line(120, 45, 140, 35);//mountain
line(140, 35, 190, 50);//mountain
line(190, 50, 220, 100);//mountain
line(220, 100, 230, 120);//mountain
line(230, 120, 240, 125);//mountain
line(240, 125, 270, 110);//mountain
line(270, 110, 330, 100);//mountain
line(330, 100, 370, 80);//mountain
line(370, 80, 390, 70);//mountain
line(390, 70, 420, 60);//mountain
line(420, 60, 440, 100);//mountain
line(440, 100, 480, 98);//mountain
line(480, 98, 550, 150);//mountain
line(550, 150, 600, 140);//mountain
line(600, 140, 650, 130);//mountain
line(650, 130, 670, 129);//mountain
line(670, 129, 700, 125);//mountain
line(700, 125, 730, 100);//mountain
line(730, 100, 780, 80);//mountain
line(780, 80, 790, 85);//mountain
line(790, 85, 820, 75);//mountain
line(820, 75, 880, 60);//mountain
line(880, 60, 900, 90);//mountain
line(900, 90, 900, 300);//closing mountain
line(900, 300, 0, 300);//closing mountain
line(0, 300, 0, 50);//closing mountain
endShape(LINES);
rect(0, 170, 70, 130);
rect(70, 150, 80, 150, 7, 7, 0, 0);
rect(150, 200, 150, 100, 0, 3, 0, 0);
rect(200, 130, 50, 220);//tower
quad(190, 130, 260, 130, 260, 100, 190, 100);//tower
quad(200, 100, 250, 100, 250, 80, 200, 80);//tower
triangle(210, 80, 225, 30, 240, 80);//tower
rect(290, 180, 70, 130);
rect(360, 220, 80, 130);
rect(440, 160, 80, 140);//dome
quad(430, 160, 530, 160, 530, 150, 430, 150);//dome
rect(440, 100, 80, 50, 180, 180, 0, 0);//dome
rect(475, 90, 10, 10, 100, 100, 0, 0);//dome
rect(520, 200, 100, 100, 50, 50, 0, 0);
quad(620, 160, 660, 160, 660, 300, 620, 300);//tower
quad(610, 150, 670, 150, 670, 160, 610, 160);//tower
triangle(610, 150, 640, 140, 670, 150);//tower
quad(660, 180, 740, 200, 740, 300, 660, 300);
quad(740, 170, 900, 170, 900, 300, 740, 300);//duomo
rect(740, 90, 160, 90, 360, 360, 0, 0);//duomo
rect(800, 80, 40, 10, 30, 30, 30, 30);//duomo
rect(815, 60, 10, 20, 30, 30, 0, 0);//duomo



}


