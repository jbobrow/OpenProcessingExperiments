
int x = 60;          //X coordinate
int y= 420;          //Y coordinate
int bodyHeight = 100;  //Body Height
int neckHeight = 50;  //Neck Height
int radius = 45;  //Head Radius
int ny = y - bodyHeight - neckHeight - radius; //Neck Y



size(300, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

//Neck
stroke(102);  //sets stroke to gray
line(x+2, y-bodyHeight, x+2, ny);  //left
line(x+12, y-bodyHeight, x+12, ny);  //middle
line(x+22, y-bodyHeight, x+22, ny);  //right

//Antennae
line(x+12, ny, x-18, ny-43);  //small
ellipse(x-21, ny-48, -5, -5);  //ellipse on small
line(x+12, ny, x+42, ny-99);  //tall
ellipse(x+39, ny-89, -5, -5);  //ellipse on medium
line(x+12, ny, x+78, ny+15);  //medium
ellipse(x+72, ny+14, -3, -3);  //ellipse on tall

//Body
noStroke();  //disable stroke
fill(102);
ellipse(x, y-33, 33, 33);  //Antigravity Orb outer
fill(204);
ellipse(x, y-33, 29, 29);  //Antigravity Orb inner
fill(0);                  //Set fill to black
rect(x-45, y-bodyHeight, 90, bodyHeight-33);  //Main body
fill(0,150,0);              //Set fill to gray
rect(x-45, y-bodyHeight+17, 90, 6);  //Gray Stripe
fill(0,255,0);              //Set fill to gray
rect(x-45, y-bodyHeight+30, 90, 6);  //Gray Stripe middle
fill(255,0,0);              //Set fill to gray
rect(x-45, y-bodyHeight+43, 90, 6);  //Gray Stripe middle

//Head
fill(0);                    //Set fill to black
ellipse(x+12, ny, radius, radius);  //Head
fill(255);                  //Set fill to white
ellipse(x+24, ny-6, 14, 14);  //Large Eye  
fill(0);                    //Set fill to black
ellipse(x+24, ny-6, 3, 3);    //Pupil
fill(153);      // set fill to light grey
ellipse(x, ny-8, 5, 5);  //Small eye 1
ellipse(x+30, ny-26, 4, 4);  //Small eye 2
ellipse(x+41, ny+6, 3, 3);  //Small eye 3



