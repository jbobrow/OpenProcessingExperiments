
// Amanda Chung Creative Computing B Benjamin Bacon Week 2
int r = 15;
int l = 130;
int x = 68;
int y = 200;
int w = 20;
int v = 30;
size(500,350);
smooth();

noStroke();

//sky
fill(43, 43, 43);
rect(0,0,900,900);

//ground
fill(140, 140, 143);
rect(0,320,900,80);

//building
fill(95, 89, 102);
rect(r,l-20,x,y+20);

rect(r+100,l-50,x+20,y+50);

rect(r+l,l+50,x+20,y);

rect(r+150,l+50,x+20,y);

rect(r+250,l+90,x+20,y);

rect(r+550,l-20,x+50,y+20);

rect(r+600,l-70,x+30,y+70);

rect(r+350,l-20,x+20,y+20);

//windows
fill(255, 243, 5);
rect(w,l,w,v);
rect(w,l+50,w,v);
rect(w,l+100,w,v);
rect(w+30,l,w,v);
rect(w+30,l+50,w,v);
rect(w+30,l+100,w,v);

ellipse(470,40,100,100);

//ground
fill(140, 140, 143);
rect(0,320,900,80);


