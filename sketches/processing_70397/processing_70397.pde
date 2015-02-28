

float semicircleup1;
float semicircleup2;
float x;
int r;
int b;


void setup(){

   semicircleup1= TWO_PI;
   semicircleup2= TWO_PI+PI;
   x= PI;
   r=450;
   b=400;
 
   

size(600, 600);

}
  


void draw(){

  
background(127,236,252);

  
  
  
  
smooth();
//this is the sun;
fill(254,233,3);
stroke(254,233,3);
ellipse(540,105,170,190);

//this are the clouds;
stroke(255);
fill(254,254,254);
ellipse(45,140,80,80);
ellipse(90,140,140,150);
ellipse(135,140,140,190);
ellipse(460,140,80,80);
ellipse(500,140,140,150);
ellipse(580,140,140,190);

if (key == 'b') {
 
 
 fill(179,178,171);
stroke(179,178,171);
ellipse(45,140,80,80);
ellipse(90,140,140,150);
ellipse(135,140,140,190);
ellipse(460,140,80,80);
ellipse(500,140,140,150);
ellipse(580,140,140,190);
}



if (mousePressed == true) {
  fill(0);
rect(0,0,600,600);
fill(254,233,3);
stroke(254,233,3);
ellipse(100,40,5,5);
ellipse(560,40,5,5);
ellipse(570,320,5,5);
ellipse(545,200,5,5);
ellipse(565,398,5,5);
ellipse(580,350,5,5);
ellipse(598,200,5,5);
ellipse(520,140,5,5);
ellipse(50,40,5,5);
ellipse(500,40,5,5);
ellipse(485,40,5,5);
ellipse(130,40,5,5);
ellipse(86,140,5,5);
ellipse(50,160,5,5);
ellipse(576,140,5,5);
ellipse(40,120,5,5);
ellipse(434,150,5,5);
ellipse(80,105,5,5);
ellipse(140,70,5,5);
ellipse(462,350,5,5);
ellipse(462,300,5,5);
ellipse(462,113,5,5);
ellipse(10,152,5,5);
ellipse(25,129,5,5);
ellipse(39,145,5,5);
ellipse(45,200,5,5);
ellipse(78,170,5,5);
ellipse(80,470,5,5);
ellipse(80,300,5,5);
ellipse(23,490,5,5);
ellipse(87,342,5,5);
ellipse(63,367,5,5);
ellipse(63,340,5,5);
ellipse(43,340,5,5);
ellipse(30,310,5,5);
ellipse(27,269,5,5);
ellipse(434,150,5,5);
ellipse(460,340,5,5);
ellipse(489,340,5,5);
ellipse(499,425,5,5);
ellipse(576,286,5,5);
}





//this is the face;
fill(250,210,124);
stroke(249,200,84);
ellipse(289,350,340,400);







//these are the eyes;
fill(254,254,254);
stroke(254,254,254);
ellipse(230,328,92,110);
ellipse(350,328,92,110);




//this are the iris;
fill(115,74,10);
stroke(115,74,10);
ellipse(350,328,35,45);
ellipse(230,328,35,45);





if (mousePressed == true){
  fill(218,177,80);
  stroke(218,177,80);
  ellipse(230,327,94,110);
  ellipse(350,327,94,110); 
}
  


//this is the nose;
fill(250,210,124);
stroke(218,177,80);
arc(288,420,120,110,x,semicircleup1);

//these are the eyebows;




fill(60,42,2);
stroke(60,42,2);
rect(318,255,60,5);
rect(210,255,60,5);






//these are the eyelids;
fill(218,177,80);
stroke(218,177,80);
arc(230,298,82,49,x,semicircleup1);
arc(350,298,82,49,x,semicircleup1);







//this is the hair;
fill(60,42,2);
stroke(60,42,2);
triangle(477,150,250,150,477,330);
triangle(95,150,475,150,95,350);


//these are the bricks;
stroke(249,107,44);
fill(249,107,44);
rect(0,399,600,200);
rect(240,559,160,80);
fill(149,48,4);
rect(0,399,160,80);
fill(249,107,44);
rect(160,399,80,80);
fill(211,67,3);
rect(240,399,160,80);
fill(149,48,4);
rect(400,399,80,80);
fill(249,107,44);
rect(480,399,160,80);
fill(211,67,3);
rect(640,399,160,80);
fill(149,48,4);
rect(0,479,80,80);
fill(211,67,3);
rect(80,479,160,80);
fill(149,48,4);
rect(240,479,80,80);
fill(249,107,44);
rect(320,479,160,80);
fill(211,67,3);
rect(480,479,80,80);
fill(149,48,4);
rect(560,479,80,80);
fill(249,107,44);
rect(0,559,160,80);
fill(149,48,4);
rect(160,559,80,80);
fill(211,67,3);
rect(240,559,160,80);
fill(149,48,4);
rect(400,559,160,80);
fill(249,107,44);
rect(560,559,160,80);

  if (key == 'a'){

fill(149,48,4);
rect(0,399,600,200);
rect(240,559,160,80);
fill(249,107,44);
rect(0,399,160,80);
fill(249,107,44);
rect(160,399,80,80);
fill(211,67,3);
rect(240,399,160,80);
fill(149,48,4);
rect(400,399,80,80);
fill(149,48,4);
rect(480,399,160,80);
fill(211,67,3);
rect(640,399,160,80);
fill(149,48,4);
rect(0,479,80,80);
fill(211,67,3);
rect(80,479,160,80);
fill(149,48,4);
rect(240,479,80,80);
fill(249,107,44);
rect(320,479,160,80);
fill(211,67,3);
rect(480,479,80,80);
fill(149,48,4);
rect(560,479,80,80);
fill(149,48,4);
rect(0,559,160,80);
fill(211,67,3);
rect(160,559,80,80);
fill(149,48,4);
rect(240,559,160,80);
fill(249,107,44);
rect(400,559,160,80);//
fill(211,67,3);
rect(560,559,160,80);
}



























//this is the bottom of the hat;
stroke(254,44,3);
fill(254,44,3);
ellipse(288,175,480,45);


//this is the hat;

//top hat;
stroke(254,44,3);
fill(254,44,3);
arc(288,175,389,335,x,semicircleup1);
//bottom hat;
stroke(60,42,2);
fill(60,42,2);
arc(288,150,195,168,x,semicircleup1);


//top of the hands;
stroke(218,177,80);
fill(250,210,124);
arc(165,b,210,60,x,semicircleup1);
arc(405,b,210,60,x,semicircleup1);




//right fingers;
stroke(218,177,80);
fill(250,210,124);
arc(90,b,60,160,semicircleup1,   semicircleup2);
arc(140,b,60,160,semicircleup1,   semicircleup2);
arc(190,b,60,160,semicircleup1,   semicircleup2);
arc(240,b,60,160,semicircleup1,   semicircleup2);


//left fingers;
stroke(218,177,80);
fill(250,210,124);
arc(480,b,60,160,semicircleup1,   semicircleup2);
arc(430,b,60,160,semicircleup1,   semicircleup2);
arc(380,b,60,160,semicircleup1,   semicircleup2);
arc(330,b,60,160,semicircleup1,   semicircleup2);

//right nails;
stroke(249,200,84);
fill(253,202,218);
arc(90,r,25,40,semicircleup1,   semicircleup2);
arc(140,r,25,40,semicircleup1,   semicircleup2);
arc(190,r,25,40,semicircleup1,   semicircleup2);
arc(240,r,25,40,semicircleup1,   semicircleup2);

//left nails;
stroke(253,202,218);
fill(253,202,218);
arc(330,r,25,40,semicircleup1,   semicircleup2);
arc(380,r,25,40,semicircleup1,   semicircleup2);
arc(430,r,25,40,semicircleup1,   semicircleup2);
arc(480,r,25,40,semicircleup1,   semicircleup2);

}

