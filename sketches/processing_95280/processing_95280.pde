
PImage myImage;
PImage myImage2;
PImage myImage3;
PImage myImage4;
PImage myImage5;
PImage myImage6;
int x= 0;
int speed= 1;
int car1Y=190;
int car1X= 492;
int car2X=560;
int car2Y=620;
int car1W=-20;
int car1H=-20;
int state=0;
boolean button= false;

void setup(){
  size(800,700);
  myImage=loadImage("beautiful_blue_sky_hd_picture_166005.jpg");
  myImage2=loadImage("injustice.jpg");
  myImage3=loadImage("plane.png");
  myImage4=loadImage("car.png");
  myImage5=loadImage("night_sky.jpg");
  myImage6=loadImage("car_2.png");
}

void draw(){
  dayTime();
}
void dayTime(){
background(142);//base color of the sketch
image(myImage, 0, 0, 800, 200);//Daytime image
planeMove();
fill(157, 156, 160);//color of the front of building 6
rect(350, 190, 150, 500);//Front of building 6
fill(95, 94, 95);//color of the left side of building 6
rect(335, 190, 150, 500);//left side  of building 6
fill(211, 173, 149);//color of the front of building 5
rect(330, 180, 150, 500);//Front of building 5
fill(255);//color of the right window of bulding 5
rect(467, 210, 5, 20);//right window of building 5
fill(255);//color of the left window of bulding 5
rect(450, 190, 5, 20);//left window of building 5
fill(113, 89, 74);//color of the left side of building 5
rect(292, 180, 150, 500);//Left side of building 5
fill(95, 59, 4);//color of the front of building 4
rect(280, 180, 150, 500);//Front of building 4
fill(255);//color of the right window of bulding 4
rect(410, 250, 10, 30);//right window of building 4
fill(255);//color of the left window of bulding 4
rect(390, 200, 10, 30);//left window of building 4
fill(57, 36, 4);//color of the left side of building 4
rect(225, 180, 150, 500);//left side of building 4
fill(95);//color of the front of building 3
rect(200, 100, 150, 500);//Front of building 3
fill(255);//color of the left window of bulding 3
rect(240, 130, 20, 50);//left window of building 3
fill(255);//color of the right window of bulding 3
rect(300, 270, 20, 50);//right window of building 3
fill(54);//color of the side of building 3
rect(80, 100, 150, 500);//side of building 3
fill(33, 117, 155);//Color of the roof of Building 2
rect(10, 292, 240, 800);//Roof of Building 2
fill(76, 145, 175);//color of the front of bulding 2
rect(100, 300, 150, 500);//Front of building 2
fill(255);//color of the left window of bulding 2
rect(170, 320, 20, 50);//left window of building 2
fill(255);//color of the right window of bulding 2
rect(220, 400, 20, 50);//right window of building 2
fill(21, 85, 113);//color of the left side of building 2
rect(10, 300, 150, 500);//left side of building 2
fill(52);//color of the billboard frame
rect(-15, 335, 180, 90);//billboard frame
tint(255);
image(myImage2, 17, 340, 130, 80);//Billboard
fill(245,0,0);//color of right side of building
rect(60, 550, 90, 90);//right side of building
fill(245, 0, 0);//color of the front of the building 2
fill(232, 0, 0);//color of the front
rect(50, 550, 100, 700);//front of building 1
fill(255);//color of the right window of bulding 1
rect(120, 600, 15, 30);//right window of building 1
fill(255);//color of the left window of bulding 1
rect(70, 660, 15, 30);//left window of building 1
fill(155, 2,2);//color of the roof of the building
triangle(150, 550, -40, 800, -80, 550);//roof of building
fill(82,6, 6);//color of the left side of building 1
rect(-50, 680, 100, 700);//left side of building 1
fill(74, 70, 211);//color of the Front of building 10
rect(520, 170, 140, 500);//Front of building 10
fill(255);//color of the left window of bulding 10
rect(522, 180, 5, 20);//left window of building 10
fill(255);//color of the left window of bulding 10
rect(527, 220, 5, 20);//left window of building 10
fill(44, 42, 121);//color of the right side of building 10
rect(540, 170, 140, 500);//right side of building 10
fill(167);//color of the front of bulding 9
rect(550, 150, 200, 500);//Front of building 9
fill(255);//color of the left window of bulding 9
rect(565, 160, 15, 40);//left window of building 9
fill(255);//color of the left window of bulding 9
rect(580, 250, 15, 40);//right window of building 9
fill(139);//color of the right side of building 9
rect(610, 150, 140, 500);//right side of building 9
fill(33, 117, 155);//Color of the roof of Building 8
rect(620, 292, 240, 800);//Roof of Building 8
fill(12, 144,191);//color of the front of bulding 8
rect(620, 300, 200, 500);//Front of building 8
fill(255);//color of the left window of bulding 8
rect(630, 320, 20, 50);//left window of building 8
fill(255);//color of the right window of bulding 8
rect(660, 420, 20, 50);//right window of building 8
fill(21, 85, 113);//color of the right side of building 8
rect(700, 300, 140, 500);//right side of building 8
fill(232, 0, 0);//Color of the Front side of building 7
rect(700, 530, 100, 500);//Front side of building 7
fill(255);//color of the left window of bulding 7
rect(760, 660, 15, 30);//left window of building 7
fill(255);//color of the right window of bulding 7
rect(720, 600, 15, 30);//right window of building 7
fill(155, 2,2);//color of the roof of the building
triangle(795, 670, 700, 530, 7000, 500);//roof of building
fill(82,6, 6);//color of the left side of building 7
rect(787, 660, 60, 90);//right side of bulding 7
fill(98,98, 98);//color of side-walk
triangle(500, 200, 800, 800, 30, 800);//side-walk
fill(38, 39, 39);//color of street
triangle(500, 200, 700, 800, 100, 800);//street 
image(myImage6, 560, 620, 150,150);//Daytime image
redcarMove();
}

void nightTime(){
  background(142);//base color of the sketch
image(myImage5, 0, 0, 800, 200);//night time image
planeMove();
fill(165);//color of the front of building 6
rect(350, 190, 150, 500);//Front of building 6
fill(62);//color of the left side of building 6
rect(335, 190, 150, 500);//left side  of building 6
fill(170, 141, 124);//color of the front of building 5
rect(330, 180, 150, 500);//Front of building 5
fill(252, 240, 0);//color of the right window of bulding 5
rect(467, 210, 5, 20);//right window of building 5
fill(252, 240, 0);//color of the left window of bulding 5
rect(450, 190, 5, 20);//left window of building 5
fill(93,75, 65);//color of the left side of building 5
rect(292, 180, 150, 500);//Left side of building 5
fill(85,70,48);//color of the front of building 4
rect(280, 180, 150, 500);//Front of building 4
fill(252, 240, 0);//color of the right window of bulding 4
rect(410, 250, 10, 30);//right window of building 4
fill(252, 240, 0);//color of the left window of bulding 4
rect(390, 200, 10, 30);//left window of building 4
fill(52,43,29);//color of the left side of building 4
rect(225, 180, 150, 500);//left side of building 4
fill(93);//color of the front of building 3
rect(200, 100, 150, 500);//Front of building 3
fill(252, 240, 0);//color of the left window of bulding 3
rect(240, 130, 20, 50);//left window of building 3
fill(252, 240, 0);//color of the right window of bulding 3
rect(300, 270, 20, 50);//right window of building 3
fill(52);//color of the side of building 3
rect(80, 100, 150, 500);//side of building 3
fill(33, 117, 155);//Color of the roof of Building 2
rect(10, 292, 240, 800);//Roof of Building 2
fill(76, 145, 175);//color of the front of bulding 2
rect(100, 300, 150, 500);//Front of building 2
fill(252, 240, 0);//color of the left window of bulding 2
rect(170, 320, 20, 50);//left window of building 2
fill(252, 240, 0);//color of the right window of bulding 2
rect(220, 400, 20, 50);//right window of building 2
fill(21, 85, 113);//color of the left side of building 2
rect(10, 300, 150, 500);//left side of building 2
fill(52);//color of the billboard frame
rect(-15, 335, 180, 90);//billboard frame
image(myImage2, 17, 340, 130, 80);//Billboard
fill(245,0,0);//color of right side of building
rect(60, 550, 90, 90);//right side of building
fill(245, 0, 0);//color of the front of the building 2
fill(232, 0, 0);//color of the front
rect(50, 550, 100, 700);//front of building 1
fill(252, 240, 0);//color of the right window of bulding 1
rect(120, 600, 15, 30);//right window of building 1
fill(252, 240, 0);//color of the left window of bulding 1
rect(70, 660, 15, 30);//left window of building 1
fill(155, 2,2);//color of the roof of the building
triangle(150, 550, -40, 800, -80, 550);//roof of building
fill(82,6, 6);//color of the left side of building 1
rect(-50, 680, 100, 700);//left side of building 1
fill(74, 70, 211);//color of the Front of building 10
rect(520, 170, 140, 500);//Front of building 10
fill(252, 240, 0);//color of the left window of bulding 10
rect(522, 180, 5, 20);//left window of building 10
fill(252, 240, 0);//color of the left window of bulding 10
rect(527, 220, 5, 20);//left window of building 10
fill(44, 42, 121);//color of the right side of building 10
rect(540, 170, 140, 500);//right side of building 10
fill(167);//color of the front of bulding 9
rect(550, 150, 200, 500);//Front of building 9
fill(252, 240, 0);//color of the left window of bulding 9
rect(565, 160, 15, 40);//left window of building 9
fill(252, 240, 0);//color of the left window of bulding 9
rect(580, 250, 15, 40);//right window of building 9
fill(139);//color of the right side of building 9
rect(610, 150, 140, 500);//right side of building 9
fill(33, 117, 155);//Color of the roof of Building 8
rect(620, 292, 240, 800);//Roof of Building 8
fill(12, 144,191);//color of the front of bulding 8
rect(620, 300, 200, 500);//Front of building 8
fill(252, 240, 0);//color of the left window of bulding 8
rect(630, 320, 20, 50);//left window of building 8
fill(252, 240, 0);//color of the right window of bulding 8
rect(660, 420, 20, 50);//right window of building 8
fill(21, 85, 113);//color of the right side of building 8
rect(700, 300, 140, 500);//right side of building 8
fill(232, 0, 0);//Color of the Front side of building 7
rect(700, 530, 100, 500);//Front side of building 7
fill(252, 240, 0);//color of the left window of bulding 7
rect(760, 660, 15, 30);//left window of building 7
fill(252, 240, 0);//color of the right window of bulding 7
rect(720, 600, 15, 30);//right window of building 7
fill(155, 2,2);//color of the roof of the building
triangle(795, 670, 700, 530, 7000, 500);//roof of building
fill(82,6, 6);//color of the left side of building 7
rect(787, 660, 60, 90);//right side of bulding 7
fill(98,98, 98);//color of side-walk
triangle(500, 200, 800, 800, 30, 800);//side-walk
fill(38, 39, 39);//color of street
triangle(500, 200, 700, 800, 100, 800);//street 
image(myImage6, 560, 620, 150,150);//Daytime image
redcarMove();
}

void planeMove(){
  x=x+speed;
  if((x>width)||(x<0)){                                                                     
    speed= speed*1;
  }
  image(myImage3,x, 0, 70, 70);//Airplane
}

void redcarMove(){
    car1Y=car1Y+speed;
  if((car1Y>height)||(car1Y<0)){
    speed= speed*1;
  }
  image(myImage4, car1X, car1Y, car1W, car1H);
  car1X= car1X-1;
  car1Y=car1Y+1;
  car1W=car1W+1;
  car1H=car1H+1;
}
void graycarMove(){
  car2Y=car2Y+speed;
  if((car2Y>height)||(car2Y<0)){
    speed=speed+1;
  }
  
}


void mousePressed(){
if(mousePressed){
myImage=loadImage("night_sky.jpg");
fill(252, 240, 0);//color of the left window of bulding 2
rect(170, 320, 20, 50);//left window of building 2
fill(252, 240, 0);//color of the right window of bulding 2
rect(220, 400, 20, 50);//right window of building 2
  }
  }


  
  


    





