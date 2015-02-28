
int x=40;
int h1=300;
int h=150;
int u1= -60;
int u=120;
int f1=240;
int f=250;
int g1=100;
int g=200;

void setup(){
  size(400,500);  
}

void draw(){
  background(177,223,243);
  fill(106,168,82);
  rect(0,300,600,600);
  fill (255);
  ellipse(x,30,100,20);
  if (x < 400)
  {x = x+ 1;} else {x=-60;}
  delay (40); 
  
  ellipse (h1, h, 100,20);
  if (h1 < 400)
  {h1 = h1 +1;} else { h1=-60;}
  ellipse (u1,u,100,20);
  if (u1 < 400)
  {u1 =u1 +1;} else {u1=-60;}
  delay (40);
  ellipse (f1,f,100,20);
  if (f1<400)
  {f1=f1+1;} else {f1=-60;}
  delay (20);
  ellipse (g1,g,100,20);
  if (g1<400)
  {g1=g1+1;} else {g1=-60;}
  delay (40);
} 
void mousePressed () { 
  background (random (160,177), random (100,223),random (230,240));
  fill(random (160,184), random (30,69),random (40,67));
  rect(0,300,600,600);
  fill (random (0,400),122,66);
  ellipse(x,30,100,20);
  if (x < 400)
  {x = x+ 1;} else {x=-60;}
  delay (40);   
  ellipse (h1, h, 100,20);
  if (h1 < 400)
  {h1 = h1 +1;} else { h1=-60;}
  ellipse (u1,u,100,20);
  if (u1 < 400)
  {u1 =u1 +1;} else {u1=-60;}
  delay (40);
  ellipse (f1,f,100,20);
  if (f1<400)
  {f1=f1+1;} else {f1=-60;}
  delay (20);
  ellipse (g1,g,100,20);
  if (g1<400)
  {g1=g1+1;} else {g1=-60;}
  delay (40);    
}

                
                         
        
