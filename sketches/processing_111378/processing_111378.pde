

float v = 100;
//outline ring
int r=360;
//height of eye
int e=188;
//heigh of eye
int h=128;

void setup() {
  size(500, 500);
  smooth();

}
void draw() {
    v = mouseX; 
    float eyeOutside = map(v, 0, 600, 20, 80);
  
colorMode(RGB);


//background(254,202,154);
background(254, 210, 156);



//pink face

noStroke();
//fill(253, 132, 116);
fill(254, 201, 157);
rect(20, 60, 450, 400, 10, 40, v+50, 200);

fill(253, 175, 140);
rect(40, 80, 410, 360, 10, 40, v+50, 200);



//rosy cheeks
fill(253, 124, 111,v*2);
noStroke();
ellipse(100, 270, v*0.3,v*0.2);
ellipse(400, 270, v*0.3, v*0.2);


//eyebrows

//fill(167, 114, 42);
//noStroke();
//rect(120, 180, 400, 5, 30);
strokeWeight(2);
stroke(64, 61, 90);
for (int i =0;i<400;i+=20) {
  line(i+200, 90, i+220, 120);
}





//eyes

//left eyes
//strokeWeight(3);
//stroke(167, 114, 42);


//strokeWeight(4);
//line(90, 183, 150, 207);
//line(170, 207, 200, 183);
//fill(254,249,185);
//triangle(90,183,160,183,120,210);







//left eye ball

noStroke();

fill(246, 106, 105, 40);
ellipse(h, e, v*0.8, v*0.8);

fill(246, 106, 105, 100);
ellipse(h, e, v*0.50, v*0.50);

//hot pink

noStroke();
fill(234, 40, 75, 30);
ellipse(h, e, v*0.45, v*0.45);


noStroke();
fill(234, 40, 75, 200);
ellipse(h, e, v*0.40, v*0.40);

noStroke();
fill(163, 39, 75, 90);
ellipse(h, e, v*0.20, v*0.20);

noStroke();
fill(163, 39, 75, 90);
ellipse(h, e, v*0.15, v*0.15);

noStroke();
fill(163, 39, 75, 100);
ellipse(h, e, v*0.14, v*0.14);

noStroke();
fill(163, 39, 75, 140);
ellipse(h, e, v*0.07,v*0.07);


//highlight
strokeWeight(1);
stroke(250, 206, 194, 130);
//fill(250, 206, 194,150);
noFill();
arc(130, 186, v*0.09, v*0.09, 4.87, 6.13);



//strokeWeight(4);
//line(90, 183, 150, 207);
//line(170, 207, 200, 183);
//fill(254,249,185);
//triangle(90,183,160,183,120,210);

//rosy cheeks
fill(253, 124, 111);
noStroke();
ellipse(100, 270, v*0.30, v*0.30);
ellipse(400, 270, v*0.30, v*0.30);



//outline ring
//int r=360;
//height of eye
//int e=188;
//heigh of eye
//int h=128;

//right eye




//Right eye ball

noStroke();

fill(246, 106, 105, 40);
ellipse(r, e, v*0.80, v*0.80);

fill(246, 106, 105, 100);
ellipse(r, e, v*0.50, v*0.50);

//hot pink

noStroke();
fill(234, 40, 75, 30);
ellipse(h+232, e, v*0.45, v*0.45);


noStroke();
fill(234, 40, 75, 200);
ellipse(h+232, e, v*0.40, v*0.40);

noStroke();
fill(163, 39, 75, 90);
ellipse(h+232, 188, v*0.20, v*0.20);

noStroke();
fill(163, 39, 75, 90);
ellipse(h+232, e, v*0.15, v*0.15);

noStroke();
fill(163, 39, 75, 100);
ellipse(h+232, e, v*0.14, v*0.14);

noStroke();
fill(163, 39, 75, 140);
ellipse(h+232, e, v*0.07, v*0.07);


//highlight
strokeWeight(1);
stroke(250, 206, 194, 130);
//fill(250, 206, 194,150);
noFill();
arc(h+2+232, 186, v*0.09, v*0.09, 4.87, 6.13);




//mouth
noStroke();
fill(164, 43, 74);
arc(250, (300)+v*0.02, v*0.15, v*0.20, PI, TWO_PI);

//nostrils
//stroke(238, 110, 111);
strokeWeight(v*0.07);
ellipse(240, 230,3,3);
//strokeWeight(v*0.10);
ellipse(260, 230,3,3);

{


  }
}


