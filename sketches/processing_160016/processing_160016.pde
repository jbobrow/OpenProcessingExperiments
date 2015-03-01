
//color palette sample
int increment = 100;
int next = 1;
color[] cores1 = {#CDCAFF, #6588E8, #7BCBFF, #65DFE8, #6FFFD6};
color[] palette1 = cores1;
color[] cores2 = {#FF39CA,#8765E8,#7BCBFF,#37E891,#B8FF6F};
color[] palette2 = cores2;
color[] cores3 = {#AB12B3, #FFC70E, #7000FF, #14CCA8, #C2FF15};
color[] palette3 = cores3;


size(400, 220);
background(#C1E82C);
noStroke();
smooth();

//wop
next=1;
fill(palette3[0]);
ellipse(50, 100, 70, 70);
fill(palette3[1]);
ellipse(50 + (next*increment), 100, 50+20, 50+20);
fill(palette3[2]);
next = next+1;
ellipse(50 + (next*increment), 100, 50+20, 50+20);
fill(palette3[3]);
next = next+1;
ellipse(50 + (next*increment), 100, 50+20, 50+20);

//yehhee
fill(palette1[1]);
ellipseMode(CENTER);
ellipse(50, 100, 50, 50);
fill(palette1[0]);
ellipse(50 + (next*increment), 100, 50, 50);
fill(palette1[2]);
next = next+1;
ellipse(50 + (next*increment), 100, 50, 50);
fill(palette1[1]);
next = next+1;
ellipse(50+(next*increment), 100, 50, 50);

//other circles
next = 1;
fill(palette2[1]);
ellipse(50, 100, 30, 30);
fill(palette2[2]);
ellipse(50 + (next*increment), 100, 50-20, 50-20);
fill(palette2[0]);
next = next+1;
ellipse(50 + (next*increment), 100, 50-20, 50-20);
fill(palette2[3]);
next = next+1;
ellipse(50 + (next*increment), 100, 50-20, 50-20);

////more circles
//next=1;
//fill(palette3[0]);
//ellipse(50, 100, 70, 70);
//fill(palette3[1]);
//ellipse(50 + (next*increment), 100, 50+20, 50+20);
//fill(palette3[2]);
//next = next+1;
//ellipse(50 + (next*increment), 100, 50+20, 50+20);
//fill(palette3[3]);
//next = next+1;
//ellipse(50 + (next*increment), 100, 50+20, 50+20);

//saving into a jpg file
save("ball1.png");


