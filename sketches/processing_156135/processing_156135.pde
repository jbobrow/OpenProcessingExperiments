
int cloudX;
int cloudX2;

void setup() {
   size(500,250);
   cloudX = 0;
   cloudX2 = 0;
}

void draw () {
  background (149,204,255);
  cloudX = cloudX +1;
  cloudX2 = cloudX2 +2;
  

//circle (x, y, width, height)
//triange(x1,y1,x2,y2,x3,y4)

//sunbeams

//push
stroke (#FFB700);
line(300, 90, 350, 40);

stroke (#FFB700);
line(300, 90, 250, 140);

stroke (#FFB700);
line(300, 90, 250, 40);

stroke (#FFB700);
line(300, 90, 350, 140);

stroke (#FFB700);
line(300, 90, 370, 90);

stroke (#FFB700);
line(300, 90, 300, 160);

stroke (#FFB700);
line(300, 90, 300, 25);

stroke (#FFB700);
line(300, 90, 225, 90);

//sun
stroke(#FFB700);
strokeWeight(4);
fill(255, 255, 72);
ellipse(300, 92, 75, 75);


//cloud1
fill(255, 255, 255);
noStroke();
ellipse(100+cloudX, 50, 60, 60);


fill(255, 255, 255);
noStroke();
ellipse(125+cloudX, 55, 50, 50);

fill(255, 255, 255);
noStroke();
ellipse(150+cloudX, 60, 30, 30);

fill(255, 255, 255);
noStroke();
ellipse(70+cloudX, 60, 30, 30);

//cloud2
fill(255, 255, 255);
noStroke();
ellipse(200+cloudX2, 150, 60, 60);

fill(255, 255, 255);
noStroke();
ellipse(225+cloudX2, 155, 50, 50);

fill(255, 255, 255);
noStroke();
ellipse(250+cloudX2, 160, 30, 30);

fill(255, 255, 255);
noStroke();
ellipse(170+cloudX2, 160, 30, 30);

}

void mousePressed() {
  cloudX = 0;
  cloudX2 = 0;
}

//pushmatrix;
//rotate (i);
//popmatrix;
//rotate(radians);
//radians(degrees);

//pushMatrix();
//translate(30, 20);
//fill(0);  
//rect(0, 0, 50, 50);  // Black rectangle
//popMatrix();

//pushMatrix();
//translate(30, 20);
//fill(0);  
//rect(0, 0, 50, 50);  // Black rectangle
//popMatrix();


