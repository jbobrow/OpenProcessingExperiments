
void setup() {
size (500,300);
smooth();
}


void draw() {
int centerX=mouseX;
int centerY=mouseY;
int z = 250;


if (mouseX > z) {for (int y = 0; y <= height; y += 15) {
for (int x = 0; x <= width; x += 40) {

   ellipse(x, y, 100, 300);

 }
}



//background
for (int y = 0; y <= height; y += 15) {
for (int x = 0; x <= width; x += 40) {
    fill(133, 176,209);
   ellipse(x, y, 60, 30);
   stroke(232, 232, 232);
 }
}

//To change colour scheme to HSB: colorMode(HSB
stroke(0,0,0);
fill(139,93,62);
ellipse(centerX-55,centerY-100,40,30);
ellipse(centerX+45,centerY-100,40,30);

//arms

fill(206,149,110);
rect(centerX-75,centerY-20,50,20);
rect(centerX+25,centerY-20,50,20);

//fingers
fill(139,93,62);
triangle(centerX-85,centerY-15,
centerX-75,centerY-20,
centerX-75,centerY-10);

triangle(centerX-85,centerY-10,
centerX-75,centerY-10,
centerX-75,centerY);

triangle(centerX+75,centerY-20,
centerX+85,centerY-15,
centerX+75,centerY-10);

triangle(centerX+75,centerY-10,
centerX+85,centerY-5,
centerX+75,centerY);

//feet
fill(139,93,62);
rect(centerX-35,centerY+20,20,50);
rect(centerX+15,+centerY+20,20,50);

//body
fill(206,149,110);
ellipse(centerX,centerY,100,100);


//head

ellipse(centerX-5,centerY-75,100,100);

//eyes
fill(0,0,0);
ellipse(centerX-15,centerY-70,7,7);
ellipse(centerX+5,centerY-70,7,7);

//mouth

fill(240,160,160);
rect(centerX-25,centerY-60,40,20);


//teeth

if (mousePressed==true) {  

fill(255,22,22);
triangle(centerX-15,centerY-60,
centerX-5,centerY-60,
centerX-10,centerY-40);
triangle(centerX-5,centerY-60,
centerX+5,centerY-60,
centerX,centerY-40);
}

//grass
noSmooth();
for (int i= 1; i <= 500; i += 5) {
  line(i+2,300, i-1,260);
       fill(133, 176,209);
       stroke(84,134,70);

}


 }
}

