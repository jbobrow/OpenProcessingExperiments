
//setup
background (230,230,230);
smooth();
strokeWeight (0.5);
stroke (255,255,255);

//declaring variables
int x = 40; // centre points
int y = 60;
size (100, 100); //size of canvas
int dg = 180; // dark grey
int lg = 140; // light grey

//1
fill (dg,dg,dg);
triangle (x-30,y-50,x-20,y-50,x-30,y-20);
fill (lg,lg,lg);
triangle (x-30,y-50,x,y-55,x-20,y-50);
fill (dg,dg,dg);
triangle (x-20,y-50,x,y-55,x+10,y-50);
fill (lg,lg,lg);
triangle (x-20,y-50,x-20,y-40,x-30,y-20);
//5
fill (dg,dg,dg);
triangle (x-20,y-50,x-20,y-40,x-10,y-40);
fill (lg,lg,lg);
triangle (x-20,y-40,x-30,y-20,x-10,y-40);
fill (dg,dg,dg);
triangle (x-20,y-50,40,y-50,x-10,y-40);
fill (lg,lg,lg);
triangle (x,y-50,x-20,y-30,x,y-30);
fill (dg,dg,dg);
triangle (x-20,y-30,x-30,y-20,x-20,y-10);
//10
fill (lg,lg,lg);
triangle (x-20,y-30,x-10,y-20,x-20,y-10);
fill (dg,dg,dg);
triangle (x-20,y-30,x-10,y-30,x-10,y-20);
fill (lg,lg,lg);
triangle (x-10,y-30,x-10,y-20,x,y-30);
fill (dg,dg,dg);
triangle (x,y-50,x,y-30,x+10,y-40);
fill (lg,lg,lg);
triangle (x,y-50,x+20,y-50,x+20,y-40);
//15
fill (dg,dg,dg);
triangle (x,y-50,x+20,y-30,x+20,y-40);
fill (lg,lg,lg);
triangle (x+20,y-50,x+20,y-40,x+30,y-40);
fill (dg,dg,dg);
triangle (x+20,y-30,x+20,y-40,x+30,y-40);
fill (lg,lg,lg);
triangle (x+20,y-50,x+40,y-50,x+40,y-30);
fill (dg,dg,dg);
triangle (x+20,y-30,x+30,y-40,x+30,y-20);
//20
fill (lg,lg,lg);
triangle (x+30,y-40,x+40,y-30,x+30,y-20);
fill (dg,dg,dg);
triangle (x+40,y-40,x+50,y-30,x+40,y-30);
fill (lg,lg,lg);
triangle (x+10,y-40,x+10,y-20,x+30,y-20);
fill (dg,dg,dg);
triangle (x,y-30,x+10,y-40,x+10,y-30);
fill (lg,lg,lg);
quad (x,y-30,x,y-20,x+10,y-20,x+10,y-30);
//25
fill (dg,dg,dg);
triangle (x,y-30,x-10,y-20,x,y);
fill (lg,lg,lg);
triangle (x-10,y-20,x-10,y,x,y);
fill (dg,dg,dg);
triangle (x-10,y-20,x-10,y,x-20,y-10);
fill (lg,lg,lg);
triangle (x-20,y-10,x-10,y+20,x-10,y);
fill (dg,dg,dg);
triangle (x-20,y-10,x-13,y+10,x-30,y);
//30
fill (lg,lg,lg);
triangle (x-30,y,x-13,y+10,x-10,y+20);
fill (dg,dg,dg);
triangle (x-30,y,x-20,y+20,x-10,y+20);
fill (lg,lg,lg);
triangle (x-20,y+20,x-20,y+30,x-10,y+20);
fill (dg,dg,dg);
triangle (x-10,y,x-10,y+20,x,y+7);
fill (lg,lg,lg);
triangle (x,y+7,x-10,y+20,x,y+20);
//35
fill (dg,dg,dg);
triangle (x-10,y+20,x,y+20,x,y+30);
fill (lg,lg,lg);
triangle (x-10,y,x,y,x+20,y+20);
fill (dg,dg,dg);
triangle (x+10,y-20,x+20,y-20,x,y);
fill (lg,lg,lg);
triangle (x+20,y-20,x+20,y-10,x+10,y-10);
fill (dg,dg,dg);
triangle (x+10,y-10,x+20,y-10,x,y);
//37,38 repeat
fill (lg,lg,lg);
triangle (x,y-20,x+10,y-20,x+5,y-10);
fill (dg,dg,dg);
triangle (x,y-20,x+5,y-10,x,y);
//40
fill (lg,lg,lg);
triangle (x,y,x+20,y-10,x+30,y);
fill (dg,dg,dg);
triangle (x+20,y-20,x+30,y-10,x+20,y-10);
fill (lg,lg,lg);
triangle (x+20,y-10,x+30,y-10,x+30,y);
fill (dg,dg,dg);
triangle (x+20,y-20,x+30,y-20,x+40,y);
fill (lg,lg,lg);
triangle (x+30,y-10,x+30,y,x+40,y);
//45
fill (dg,dg,dg);
triangle (x+30,y-20,x+50,y,x+40,y);
fill (lg,lg,lg);
triangle (x+30,y-20,x+40,y-30,x+40,y-10);
fill (dg,dg,dg);
quad (x+40,y-30,x+40,y-20,x+50,y-15,x+50,y-20);
fill (lg,lg,lg);
triangle (x+50,y-20,x+40,y-30,x+50,y-30);
fill (dg,dg,dg);
quad (x+40,y-20,x+50,y-15,x+50,y,x+40,y-10);
//50
fill (lg,lg,lg);
triangle (x+50,y-15,x+55,y-10,x+50,y+20);
fill (dg,dg,dg);
triangle (x,y,x+20,y,x+20,y+20);
fill (lg,lg,lg);
triangle (x+20,y,x+25,y+10,x+20,y+20);
fill (dg,dg,dg);
triangle (x+20,y,x+30,y,x+25,y+10);
fill (lg,lg,lg);
triangle (x+20,y+20,x+30,y,x+40,y);
//55
fill (dg,dg,dg);
triangle (x+40,y,x+50,y,x+50,y+20);
fill (lg,lg,lg);
triangle (x+30,y+20,x+40,y,x+50,y+20);
fill (dg,dg,dg);
triangle (x+20,y+20,x+40,y,x+30,y+20);
fill (lg,lg,lg);
triangle (x,y+7,x,y+30,x+20,y+20);
fill (dg,dg,dg);
triangle (x+20,y+20,x+20,y+30,x,y+30);
//60
fill (lg,lg,lg);
triangle (x+20,y+20,x+30,y+20,x+20,y+30);
fill (dg,dg,dg);
triangle (x+20,y+30,x+30,y+20,x+40,y+30);
fill (lg,lg,lg);
triangle (x+30,y+20,x+50,y+20,x+40,y+30);
fill (dg,dg,dg);
triangle (x+40,y+30,x+50,y+20,x+50,y+35);
fill(lg,lg,lg);
triangle (x+20,y+30,x+20,y+35,x,y+30);

