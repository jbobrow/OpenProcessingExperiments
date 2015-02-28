

float x;
float easing = 0.01; 


PImage landscape;

void setup() { 
size(1024, 768); 
landscape= loadImage("bikini_bottom.jpg");
smooth(); 
strokeWeight(2); 
}









void draw() {
background (landscape);

int bodyx = mouseX;
int bodyy = 250 + mouseX/4;

//body top
fill(62, 243, 88);
rect(bodyx, bodyy, 150, 140);

//shorts
strokeWeight(2);
fill(97, 25, 45);
rect(bodyx, bodyy+140, 150, 60);

//belt
line(bodyx, bodyy+140, bodyx+150, bodyy+140);
line(bodyx, bodyy+160, bodyx+150, bodyy+160);

//legs
fill(97, 25, 45);
rect(bodyx+25, bodyy+200, 40, 25);
rect(bodyx+85, bodyy+200, 40, 25);
fill(255);
rect(bodyx+35, bodyy+225, 15, 25);
rect(bodyx+100, bodyy+225, 15, 25);

//shoes
fill(0);
rect(bodyx+35, bodyy+250, 15, 20);
ellipse(bodyx+33, bodyy+263, 30, 15);
rect(bodyx+100, bodyy+250, 15, 20);
ellipse(bodyx+117, bodyy+263, 30, 15);


//mouth
fill(184, 12, 60);
arc(bodyx+75, bodyy, 100, 70, radians(0), radians(180)); 

//teeth
fill(255);
rect(bodyx+35, bodyy, 30, 50);
rect(bodyx+85, bodyy, 30, 50);

//sponge blobs
fill( 243, 62, 241);
ellipse( bodyx+25, bodyy+75, 10, 30);
ellipse( bodyx+50, bodyy+90, 10, 13);
ellipse (bodyx+35, bodyy+105, 15, 12);

//Left eye
int Eyeballx = bodyx;
int Eyebally = bodyy - 100;
int Pupilx = Eyeballx + 15; 
int Pupily = Eyebally - 20;
int blackx = Pupilx - 4;
int blacky = Pupily + 10;
line(x, Eyebally, bodyx+25, bodyy); //eyes stick
fill(255); //eyeball white
ellipse(x, Eyebally, 100, 100);
fill(8, 30, 247); //blue pupil
ellipse(x+15, Pupily, 40, 40);
 if (mousePressed == true) { 
  fill(100, mouseY, mouseX); 
  } 
ellipse(x+15, Pupily, 40, 40);
fill(0); //Eye black
ellipse (x+11, blacky, 10, 10);

//right eye

float easing = 0.04; 

  float targetX = mouseX ; 
  x += (targetX - x) * easing; 


int Eyeballx2 = bodyx + 150;
int Eyebally2 = bodyy - 150;
int Pupilx2 = Eyeballx2 + 5; 
int Pupily2 = Eyebally2 - 5;
int blackx2 = Pupilx2 + 2;
int blacky2 = Pupily2 - 3;
line(x+150, Eyebally2, bodyx+125, bodyy); //eye stick
fill(255);
ellipse (x+150, Eyebally2, 40, 40); //eyeball white
fill(8, 30, 247); 
ellipse(x+155, Pupily2, 20, 20); //blue pupil
if (mousePressed == true) { 
  fill(250, mouseX, mouseY); 
  } 
ellipse(x+155, Pupily2, 20, 20);
fill (0);
ellipse(x+157, blacky2, 8, 8); //eye black



}










