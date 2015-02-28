
int x=300;
int y=300;

int o=400;
int p=300;

float circleX =0;
float circleY =0;

void setup() {
 size(600, 600);
//background(242, 208,37, 50); //yellow
//background(58, 191, 229, 193); //blue
smooth();
}

void draw(){
  int targetX=mouseX;

    x+= (targetX - x);
  
  int targetY=mouseY;
  y+= (targetY - y);
 background(242, 208,37, 50); //yellow

 //background(200);

//EYES

//Antennae
strokeWeight(10);
stroke(142, 52, 144, 298); //purple
line(x+50,y-150,300, 300); // eye line
line(x-50,y-150, 300, 300); //eye line

//Eye Balls
strokeWeight(1);
stroke(0); //black
fill(255); //white
ellipse(x+50,y-150, 30, 30); 
ellipse(x-50, y-150, 30, 30);

strokeWeight(5);
//stroke(100); // black
stroke(32, 227, 56); //green
ellipse(x-45, y-155, 15, 15);//iris
ellipse(x+55, y-155, 15, 15);//iris
stroke(0); //black
ellipse(x-45, y-155, 5, 5);//pupil
ellipse(x+55, y-155, 5, 5);//pupil

//HEAD
noStroke();
fill(142, 52, 144); //purple
arc(300, 300, 150, 150, 3.3, 6.13);

//ARMS

int targetO=mouseX;
int targetP=mouseY;
  if (mousePressed){
o+= targetO - o; 
  }
  
  if (mousePressed){
     p+= targetP - p;
  }

arc(225, 325, 50, 50, 1.57, 4.71);//left
//arc(225, 325, 50, 50, 4.71, 1.57); why doesnt this work? 
ellipse(375, 325, 50, 50);

quad(225, 305, 225, 345, p-130, o-20, p-145, o-45);
quad(375, 305, 375, 345, p+155, o-20, p+155, o-45);
//hand
strokeWeight(0.5);
stroke(0); //black
fill(11, 139, 216); //blue
ellipse(p-138, o-33, 30, 30);
ellipse(p+147, o-33, 30, 30);
fill(200);
//noStroke();
//triangle(162, 367, 132, 387, 150, 355);
//triangle(447, 367, 480, 387, 460, 355);


//LEGS 
strokeWeight(9);
stroke(0); //black
fill(11, 139, 216); //blue

if (mouseX>167.5 && mouseX<357.5 && mouseY>345 && mouseY<535) {
  fill(203, 39, 108, 334);// pink
}
ellipse(337.5, 440, 95, 95);
if (mouseX>242.5 && mouseX<432.5 && mouseY>345 && mouseY<535) {
  fill(203, 39, 108, 334);// pink
}
ellipse(262.5, 440, 95, 95);

//BODY
strokeWeight(2);
stroke(203, 39, 108, 334);// pink
fill(142, 52, 144, 298);// purple
rect(225, 300, 150, 50);
fill(214, 98, 11);// orange
rect(225, 350, 150, 50);
//Middlemouth
  circleX = random(1, 600);
  circleY = random(1, 600);
strokeWeight(6);
stroke(203, 39, 108, 334); //pink
fill(214, 98, 11); //orange
frameRate(5);
if (mousePressed) {
  fill(circleX, circleY, 60);
}
ellipse(300, 300, 60, 60);
fill(200); // grey
strokeWeight(1);
stroke(0);//back
ellipse(300, 300, 25, 25);

//Arms
noFill();
strokeWeight(2);
stroke(203, 39, 108, 334);
ellipse(225, 325, 50, 50);
ellipse(375, 325, 50, 50);



//Armholes
fill(200); // grey
strokeWeight(2);
stroke(214, 98, 11);// orange
ellipse(225, 325, 20, 20);
ellipse(375, 325, 20, 20);



//Legholes
strokeWeight(2);
fill(142, 52, 144); //purple
triangle(225, 400, 375, 400, 300, 470);
fill(200); // grey
strokeWeight(2);
stroke(214, 98, 11); //orange
ellipse(262.5, 440, 40, 40);
ellipse(337.5, 440, 40, 40);


}


