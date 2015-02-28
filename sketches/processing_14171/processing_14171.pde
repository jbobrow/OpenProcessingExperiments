
float x;
float y;
float size = 40.0;

void setup(){
size(400,400);       // Setting the size of the background
background(255); // Setting the background to white
smooth();
frameRate(30);



fill(25,175,200);
line(0, 0, 0, 400);
line(0, 0, 400, 0);
bezier(0, 0, 175, 175, 250, 250, 0, 400);

fill(175,200,25);
bezier(400, 0, 375, 375, 125, 125, 400, 400);

fill(100,200,100);
bezier(400, 0, 75, 25, 125, 75, 0, 0);

fill(150, 75, 50);
bezier(0, 400, 125, 375, 250, 375, 400, 400);

//fill(50, 125, 150);
//ellipse(175, 100, 50, 45);

//fill(10,150,170,150);
//rect(300, 300, 75, 25);
//fill(20,100,200,150);
//rect(290, 310, 75, 25);
//fill(30,150,170,150);
//rect(310, 290, 25, 75);
//fill(40,120,190,150);
//rect(280, 320, 75, 25);
//fill(10,150,120,150);
//rect(320, 280, 75, 25);
//fill(50,100,200,150);
//rect(270, 330, 25, 75);
//fill(60,175,125,150);
//rect(330, 270, 25, 75);
//fill(70,125,175,150);
//rect(300, 229, 75, 25);

fill(150, 225, 50);
ellipse(100, 200, 100, 100);

fill(10, 20, 30, 150);
ellipse(110, 200, 45, 25);

fill(0);
ellipse(120, 200, 20, 20);

fill(200, 25, 150);
bezier(0, 25, 75, 75, 20, 20, 0, 375);


line(100, 305, 60, 290);
line(60, 290, 50, 280);
//fill(25, 100, 200, 150); //bubbles
//ellipse(110, 300, 25, 15);
//ellipse(150, 50, 25, 25);
//ellipse(135, 125, 10, 10);
//ellipse(200, 180, 30, 30);
//fill(25, 110, 190, 140);
//ellipse(175, 205, 15, 15);
//ellipse(175, 225, 10, 10);
//ellipse(205, 145, 20, 20);
//ellipse(200, 75, 18, 18);



fill(100,200,100);
bezier(200, 390, 75, 350, 250, 50, 110, 390);
bezier(110, 390, 25, 375, 30, 10, 50, 396);

bezier(310, 395, 25, 250, 150, 300, 200, 390); 

fill(100, 175, 250, 150);
ellipse(293, 256, 25, 35);
ellipse(305, 250, 25, 35);
ellipse(320, 240, 25, 35);
ellipse(330, 232, 25, 35);
ellipse(340, 222, 25, 35);
ellipse(353, 210, 25, 35);
ellipse(363, 195, 25, 35);
ellipse(373, 182, 25, 35);
ellipse(384, 160, 25, 35);
ellipse(393, 133, 25, 35);

ellipse(300, 270, 25, 35);
ellipse(310, 280, 25, 35);
ellipse(320, 290, 25, 35);
ellipse(330, 300, 25, 35);
ellipse(340, 310, 25, 35);
ellipse(350, 320, 25, 35);
ellipse(360, 330, 25, 35);
ellipse(370, 340, 25, 35);
ellipse(380, 350, 25, 35);
ellipse(390, 360, 25, 35);








line(270, 300, 370, 380)

;
stroke (255,200,0);
  

}


void draw () 
{y = y + 0.8;
  
  if (y > width + size) {
    y = -size;
  } 

}

void mousePressed(){
  
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  ellipse(x+250, y=x, 25, 15);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(150, 50, 25, 25);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(135, 125, 10, 10);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(200, 180, 30, 30);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(175, 205, 15, 15);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(175, 225, 10, 10);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(205, 145, 20, 20);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(200, 75, 18, 18);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(175, 100, 50, 45);}

void keyPressed(){
  translate(y, height/2-size/2);
   fill(random(0,255),random(0,255),random(0,255),random(0,255));
  ellipse(x+250, y=x, 25, 15);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(150, 50, 25, 25);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(135, 125, 10, 10);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(200, 180, 30, 30);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(175, 205, 15, 15);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(175, 225, 10, 10);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(205, 145, 20, 20);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(200, 75, 18, 18);
fill(random(0,255),random(0,255),random(0,255),random(0,255));
ellipse(175, 100, 50, 45);}


