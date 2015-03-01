
// Color Palette Sample 
int increment = 100;
int next = 1;
color [] cores1 = {#7F3751, #FF9DC0, #7F2847, #CC4172, #FF518E};
color [] palette1 = cores1; 
color [] cores2 =  {#F6B1C3, #F0788C, #DE264C, #BC0D35, #A20D1E};
color [] palette2 = cores2;

size(400, 200); 
background(0);
noStroke();

smooth();
fill(palette1[0]);
ellipseMode(CENTER);
ellipse(50, 100, 40, 40);
fill(palette1[1]);
ellipse(50 + (next*increment), 100, 40, 40);
fill(palette1[2]);
next = next+1;
ellipse(50 + (next*increment), 100, 40, 40);
fill(palette1[3]);
next = next+1;
ellipse(50 + (next*increment), 100, 40, 40);

//other circles
next=1;
fill(palette2[0]);
ellipseMode(CENTER);
ellipse(50, 100, 20, 20);
fill(palette2[1]);
ellipse(50 + (next*increment), 100, 20, 20);
fill(palette2[2]);
next = next+1;
ellipse(50 + (next*increment), 100, 20, 20);
fill(palette2[3]);
next = next+1;
ellipse(50 + (next*increment), 100, 20, 20);

//t

// saving into a jpg file
save("ball1.png");


