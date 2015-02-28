
/*
Chad Horton
Dynamic Web Graphics
9/01/12
Mondrian
*/

void setup()
{
 size(400,400);
background(27,139,35);
stroke(0);
println();
}

void draw()
{
  int a=5;
  int b1=218,b2=165,b3=32;
  int c1=255,c2=105,c3=180;
  int d1=205,d2=92,d3=92;
  int e1=216,e2=191,e3=216;
  int f1=240,f2=230,f3=140;
  
  //Row 1
 fill(c1,c2,c3);
 myboxes(0,0); 
 fill(b1,b2,b3);
 myboxes(0,90);
 fill(d1,d2,d3);
 myboxes(0,180);
 fill(e1,e2,e3);
 myboxes(0,270);
 fill(f1,f2,f3);
 myboxes(0,360);
 fill(255);
 //******************
 //Row 2
fill(b1,b2,b3);
 myboxes(50,0+a); 
 fill(d1,d2,d3);
 myboxes(50,90+a);
 fill(e1,e2,e3);
 myboxes(50,180+a);
 fill(f1,f2,f3);
 myboxes(50,270+a);
 fill(c1,c2,c3);
 myboxes(50,360+a);
 fill(255);
 //*********************
 //Row 3
 fill(d1,d2,d3);
 myboxes(100,0-a); 
 fill(e1,e2,e3);
 myboxes(100,90-a);
 fill(f1,f2,f3);
 myboxes(100,180-a);
 fill(c1,c2,c3);
 myboxes(100,270-a);
 fill(b1,b2,b3);
 myboxes(100,360-a);
 fill(255);
 //******************
 //Row 4
 fill(e1,e2,e3);
 myboxes(150,0+a); 
 fill(f1,f2,f3);
 myboxes(150,90+a);
 fill(c1,c2,c3);
 myboxes(150,180+a);
 fill(b1,b2,b3);
 myboxes(150,270+a);
 fill(d1,d2,d3);
 myboxes(150,360+a);
fill(255); 
 //********************
 //Row 5
 fill(f1,f2,f3);
 myboxes(200,0-a); 
 fill(c1,c2,c3);
 myboxes(200,90-a);
 fill(b1,b2,b3);
 myboxes(200,180-a);
 fill(d1,d2,d3);
 myboxes(200,270-a);
 fill(e1,e2,e3);
 myboxes(200,360-a);
 fill(255);
 //*********************
 //Row 6
 fill(c1,c2,c3);
 myboxes(250,0+a); 
 fill(b1,b2,b3);
 myboxes(250,90+a);
 fill(d1,d2,d3);
 myboxes(250,180+a);
 fill(e1,e2,e3);
 myboxes(250,270+a);
 fill(f1,f2,f3);
 myboxes(250,360+a);
 fill(255);
 //*****************
 //Row 6
 fill(b1,b2,b3);
 myboxes(300,0-a); 
 fill(d1,d2,d3);
 myboxes(300,90-a);
 fill(e1,e2,e3);
 myboxes(300,180-a);
 fill(f1,f2,f3);
 myboxes(300,270-a);
 fill(c1,c2,c3);
 myboxes(300,360-a);
 fill(255);
 //****************
 //Row 7
 fill(d1,d2,d3);
 myboxes(350,0+a); 
 fill(e1,e2,e3);
 myboxes(350,90+a);
 fill(f1,f2,f3);
 myboxes(350,180+a);
 fill(c1,c2,c3);
 myboxes(350,270+a);
 fill(b1,b2,b3);
 myboxes(350,360+a);
 fill(255);
 mytriangles(0,0); //must always be 0,0
}

void myboxes(int x, int y)
{
  quad(x,y,x,y+30,x+50,y+30,x+50,y);
  quad(x,y+30,x,y+60,x+50,y+60,x+50,y+30);
  quad(x,y+60,x,y+90,x+50,y+90,x+50,y+60);
}
void mytriangles(int i, int r)
{

 triangle(i,r,i,r+height/2,width/2,r);
 triangle(i+width,r+height/2,i+width,r+height, i+width/2,r+height);
 triangle(i+width/2,r,i+width,r+height/2,i+width,r);
 triangle(i,r+height/2,i+width/2,r+height,i,r+height);
 
}


