
void setup() 
  {
  size(900,800);
  background(255);
colorMode(HSB, 100);
fill(8, 100, 100);
//rect(0, 0, 100, 100);
  }
  void draw()
    {
//%%%%%%%%%%%%%%%%%%% bande 1 %%%%%%%%%%%%%%%%%
    float xa = random(40,860);
    float ya = random(40,460);
fill(0, 100, 100,60);
    noStroke();
    float d1 = random(30, 50);
 ellipse(xa,ya,d1,d1);

filter(BLUR,.9);
 fill(8,100,100,4);
 rect(50, 50, 800, 120);
   
//%%%%%%%%%%%%%%%%%%% bande 2 %%%%%%%%%%%%%%%%%
    float xb = random(20,860);
    float yb = random(240,440);



fill(0, 100, 100);
float d2 = random(10, 60);
// ellipse(xb,yb,d2,d2);
 
  fill(0,30,100,1);
 rect(50, 200, 810, 240);
 
//%%%%%%%%%%%%%%%%%%%% bande3 %%%%%%%%%%%%%%%%%%
    //surface de référence :: 0, 400, width, 550
    float xb2 = random(40,860);
    float yb2 = random(480,620);
fill(10, 10, 100);
float d3 = random(5, 40);
 ellipse(xb2,yb2,d3,d3);


 fill(0,30,72,1);
 rect(50, 480, 810, 130);

 
//%%%%%%%%%%%%%%%%%%%% bande 4 %%%%%%%%%%%%%%%%%%
     float xc = random(40,840);
    float yc = random(640,760);

fill(0, 100, 100);
    //noStroke();
    float xc2 = random(30, 50);
 ellipse(xc,yc,xc2,xc2);

 fill(90,40,100,1);
 rect(40, 640, 820, 160);
    }

 




