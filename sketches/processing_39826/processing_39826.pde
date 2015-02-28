
void setup(){
  
  size(300,300);
  background(0);
  smooth();
  
}
//radius of the ellipses
int r1 = 10;
int r2 = 10;
int r3 = 20;
int r4 = 20;

//x coordinates for the first set of ellipses that are moving up and down
int x1 = 0;
int x2 = 150;

int x3 = -10;
int x4 = 310;

//y coordinate for the little dot that is trying to escape the other claws of the other ellipses
int y3 = 0;

void draw() {
  background(0);
  //first set of ellipses that are moving towards one another
  ellipse(30,x1,r1,r2);
  ellipse(30,x2,r1,r2);
  
  ellipse(60,x1,r1,r2);
  ellipse(60,x2,r1,r2);
  //2nd set of ellipses
  ellipse(90,x3,r3,r4);
  ellipse(90,x4,r3,r4);
  
  fill(200,0,0);
  ellipse(y3,150,r3,r4);
  fill(255);
  
  //spped of the vertically moving ellipses
  x1++;
  x2--;
  
  x3++;
  x4--;


 //speed of the horizontally moving ellipses
  y3++;
  //resets the ellipses
  if(x1 > 150) x1 = 0; 
  if(x2 < 150) x2 = 310;
  
  if(x3 > 150) x3 = -10;
  if(x4 < 150) x4 = 310;
  //determines when the vertical ellipses increase in size
  //1st set
  if(x1 >= 0)  r1 = 10;
  if(x1 >= 0)  r2 = 10;
  if(x1 >=145) r1 = 20;
  if(x1 >=145) r2 = 20;
 
  //determines how the red ellipse acts 
  if(y3 > 300) y3 = 0;
  if(y3 <=300) r1 = 10;
  if(y3 <=300) r2 = 10;
}

