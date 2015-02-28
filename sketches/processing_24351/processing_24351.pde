
void setup() {
  size (500,500);
}

void draw() {
println(mousePressed);
  int centerX=mouseX;
  int centerY=mouseY;

int centreX = 250;
int centreY = 250;



//background-night
  if (mouseX>10){
    for (int y=0; y<=height; y+=15) {
      for (int x=0; x<=width; x+=40) {
        background(16,22,52);
        noStroke();        
        fill(255);
        ellipse(centreX-180, centreY-180, 100, 100); //moon
        fill(150); //concrete
        rect(0,480,500,20);
      }
    }
    
//background change colour-to daytime
if (mousePressed==true) { 
  background(126,277,255);
  stroke(255,205,3);
  fill(246,255,3);
  ellipse(centreX-180, centreY-180, centreX-150, centreY-150); //sun
  
//rays
ellipse(5,45,5,5);
ellipse(18,50,5,5);
  
ellipse(15,75,5,5);
ellipse(2,80,5,5);
  
ellipse(5,108,5,5);
ellipse(20,100,5,5);
  
ellipse(25,130,5,5);
ellipse(35,120,5,5);
   
ellipse(30,30,5,5);
ellipse(20,20,5,5);
  
ellipse(60,15,5,5);
ellipse(58,5,5,5);
  
ellipse(90,18,5,5);
ellipse(96,6,5,5);
  
ellipse(112,34,5,5);
ellipse(125,20,5,5);
  
ellipse(125,55,5,5);
ellipse(140,45,5,5);
  
  
//concrete
  fill(150); 
  noStroke();
  rect(centreX-250, centreY+230, centreX+250, centreY-230);
}


//claws
stroke(0,0,0);
smooth();
fill(255, 0, 183);
ellipse(centreX-138, centreY+92, centreX-240, centreY-245);
ellipse(centreX-140, centreY+100, centreX-240, centreY-245);
ellipse(centreX-138, centreY+108, centreX-240, centreY-245);

ellipse(centreX+138, centreY+92, centreX-240, centreY-245);
ellipse(centreX+140, centreY+100, centreX-240, centreY-245);
ellipse(centreX+138, centreY+108, centreX-240, centreY-245);

ellipse(centreX-126, centreY+222, centreX-240, centreY-245);
ellipse(centreX-126, centreY+228, centreX-240, centreY-245);

ellipse(centreX+126, centreY+222, centreX-240, centreY-245);
ellipse(centreX+126, centreY+228, centreX-240, centreY-245);


//hands
fill(99, 18, 180);
for (int i=centreX-115; i<centreX*2; i+=centreX-20){
  ellipse(i, centreX+100, centreX-200, centreY-225);
}

//ears
fill(99, 18, 180);
triangle(centreX-235, centreY-35, centreX-180, centreY-77, centreX-180, centreY-25);
triangle(centreX+235, centreY-35, centreX+180, centreY-75, centreX+70, centreY-25);

//head and body/*
fill(99, 18, 180);
ellipse(centreX, centreY+100, centreX-50, centreY);
ellipse(centreX, centreY-50, centreX+125, centreY-50);

//feet/*
fill(99, 18, 180);
for (int e=centreX-75; e<centreX+150; e+=centreX-100){
  ellipse(e, centreX+225, 100, 25);
}

//eye
fill(255, 255, 255);
ellipse(centreX-173, centreY-125, centreX-200, centreY-200);
ellipse(centreX-125, centreY-150, centreX-200, centreY-200);
ellipse(centreX-77, centreY-167, centreX-200, centreY-200);
ellipse(centreX-25, centreY-175, centreX-200, centreY-200);
ellipse(centreX+25, centreY-175, centreX-200, centreY-200);
ellipse(centreX+75, centreY-167, centreX-200, centreY-200);
ellipse(centreX+125, centreY-151, centreX-200, centreY-200);
ellipse(centreX+170, centreY-125, centreX-200, centreY-200);

//eyeBall(BLACK)
fill(0, 0, 0);
ellipse(centreX-169, centreY-115, centreX-225, centreY-225);
ellipse(centreX-120, centreY-139, centreX-225, centreY-225);
ellipse(centreX-73, centreY-155, centreX-225, centreY-225);
ellipse(centreX-22, centreY-163, centreX-225, centreY-225);
ellipse(centreX+25, centreY-162, centreX-225, centreY-225);
ellipse(centreX+70, centreY-156, centreX-225, centreY-225);
ellipse(centreX+120, centreY-140, centreX-225, centreY-225);
ellipse(centreX+165, centreY-113, centreX-225, centreY-225);

//eyeLashes(FACING_LEFT)
noFill();
arc(centreX-198, centreY-150, centreX-210, 40, PI/2, PI);
arc(centreX-192, centreY-160, centreX-210, 40, PI/2, PI);

arc(centreX-150, centreY-175, centreX-210, 40, PI/2, PI);
arc(centreX-143, centreY-185, centreX-210, 40, PI/2, PI);

arc(centreX-100, centreY-200, centreX-210, 40, PI/2, PI);
arc(centreX-90, centreY-210, centreX-210, 40, PI/2, PI);

arc(centreX-44, centreY-210, centreX-210, 40, PI/2, PI);
arc(centreX-30, centreY-220, centreX-210, 40, PI/2, PI);

//eyeLashes(FACING_RIGHT)
noFill();
arc(centreX+23, centreY-220, centreX-210, centreY-210, 0, PI/2);
arc(centreX+39, centreY-215, centreX-210, centreY-210, 0, PI/2);

arc(centreX+77, centreY-212, centreX-210, centreY-210, 0, PI/2);
arc(centreX+90, centreY-208, centreX-210, centreY-210, 0, PI/2);

arc(centreX+129, centreY-197, centreX-210, centreY-210, 0, PI/2);
arc(centreX+140, centreY-192, centreX-210, centreY-210, 0, PI/2);

arc(centreX+180, centreY-169, centreX-210, centreY-210, 0, PI/2);
arc(centreX+190, centreY-160, centreX-210, centreY-210, 0, PI/2);

//giantEye
fill(100,229,100);
ellipse(centreX, centreY-50, centreX, centreY-100);
fill(255, 255, 255);
ellipse(centreX, centreY-50, centreX-100, centreY-100);

//giantEyeBall
fill(0, 0, 0);
ellipse(centreX, centreY-13, centreX-175, centreY-175);


//tail
triangle(centreX+215, centreX+4, centreY+225, centreY+65, centreX+170, centreY+30);
noFill();
bezier(centreX+200, centreY+50, centreX+100, centreY+100, centreX+180, centreY+200, centreX+91, centreY+150);




  }
}


