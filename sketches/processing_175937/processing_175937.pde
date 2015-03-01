
void setup()
{
  size(800,500);
 frameRate(90);
 smooth();
  //beginRecord(PDF,"greatestever1.pdf");
}

void draw()
{
  background(255);
  stroke(0);
  noFill();
 
 //STRAIGHT LINE >>>>>>>>>>>>>>>>>>>>>>
 beginShape();
 stroke(255);
 
for(int i = 0; i < 400; i++ )
{
  vertex( i*2  ,50);
  
}
///////OUTLINES/////////////////////////
stroke(0);
arc(579, 400, 280, 280, PI, TWO_PI);
triangle(288, 880, 351, 360, 288, 360); 
ellipse(252, 144, 72, 72);
ellipse(100, 500, 400, 400);
ellipse(500, 800, 200, 100);
ellipse(90, 300, 250, 250);
quad(189, 180, 316, 508, 216, 360, 144, 360);
rect(200, 10, 200, 10);
ellipse(252, 144, 72, 72);
rect(1, 50, 800, 80);
rect(400, 50, 163, 800);
endShape();

 //STRAIGHT LINE >>>>>>>>>>>>>>>>>>>>>>
 beginShape();
 stroke(255);
 
for(int i = 0; i < 400; i++ )
{
  vertex( i*2  ,400);
  
}

endShape();

 //STRAIGHT LINE >>>>>>>>>>>>>>>>>>>>>>
 beginShape();
 stroke(255);
 
for(int i = 0; i < 400; i++ )
{
  vertex( i*2  ,405);
  
}

endShape();

//RANDOM LINE>>>>>>>>>>>>>>>>>


stroke(255,0,196);
beginShape();
 
 
for(int i = 0; i < 400; i++ )
{
  //set a random y position (random +-50 around 150)
  float y = 170+random(-500,500);
  vertex( i*2  ,y);
  
}

endShape();
///////////////////////SHAPES behind Crazy Blue
stroke(255,0,0);
fill(255,255,0,130);
arc(400, 400, 580, 580, PI, TWO_PI);
///////////////////////BLUE CRAZY LINE
stroke(0,0,255);
strokeWeight(80);
noFill();
beginShape();
 
 
for(int i = 5; i < 400; i++ )
{
  
  
  float t = frameCount*.02;
  //Use nosie to offset the y position
  //set a random y position (random +-50 around 150)
  float f = 900*.02;
  
  float n = noise(i*.05, t) *500;
  

  
  float y = 100+n;
  vertex( i*2  ,y);
  
}
endShape();



/////////ARC & SHAPES/////////////////

noStroke();

fill(0);
triangle(800, 0, 800, 800, 0, 800); 

fill(0);
rect(80, 80, 163, 800);

fill(0);
rect(50, 0, 10, 900);

fill(0);
rect(40, 0, 9, 900);

fill(0);
rect(30, 0, 8, 900);

fill(0);
rect(20, 0, 7, 900);

fill(0);
rect(10, 0, 6, 900);

fill(0);
rect(5, 0, 5, 900);

fill(0);
rect(200, 210, 800, 10);



fill(0);
rect(500, 750, 800, 100);





fill(255,255,255,30);
ellipse(100, 500, 400, 400);

fill(255,255,255,30);
ellipse(90, 300, 250, 250);



fill(0);
triangle(288, 880, 351, 360, 288, 360); 



fill(255,230,10,60);
quad(189, 180, 316, 508, 216, 360, 144, 360);

//PERLIN NOISE LINE_>>>>>>>>>>


//PERLIN NOISE THAT CHANGES OVER TIME>>>>>>>>>>>>>>>>>

//PERLIN NOISE THAT CHANGES OVER TIME>>>>>>>>>>>>>>>>>
stroke(255,230,13);
noFill();
beginShape();
 
 
for(int i = 0; i < 400; i++ )
{
  
  
  float t = frameCount*.02;
  //Use nosie to offset the y position
  //set a random y position (random +-50 around 150)
  float f = 500*.02;
  
  float n = noise(i*.05, t) *400;
  

  
  float y = 350+n;
  vertex( i*2  ,y);
  
}
endShape();
stroke(255);
strokeWeight(1);
point(10, 100);
point(20, 100);
point(30, 100);
point(40, 100);
point(50, 100);
point(80, 100);
//point(100, 100);
//point(120, 100);
//point(150, 100);
//point(200, 100); 
//point(250, 100);
//point(300, 100);
point(400, 100); 
point(500, 100);
point(600, 100);
//point(750,100);

stroke(255);
  line(random(500,displayHeight), random(0, displayHeight),random(0, displayHeight),random(0, displayHeight) );
endRecord();
}
