
//VARIABLES
color topSky = color(206,99,10);
color bottomSky = color (206,30,10);
color sun = color (250,243,20);

int x;
int y;

void setup (){
size (500, 500);
x= 150;
y= 300;

}


void draw (){
  
//SKY

noStroke ();

fill (topSky);
rect (0,0,500,75);

fill (topSky);
rect (0,75,500,75);

fill (topSky);
rect (0,150,500,75);

fill (bottomSky);
rect (0,200,width,200);
// (x,y,width,height)

//SUN
fill (sun);
ellipse(x,y,150,150);
//arc(150, 300, 120, 100, PI, TWO_PI, OPEN);
//  
// WATER

noStroke ();

fill (0,0,255);
rect (0,300,300,50);

fill (0,0,200);
rect (0,350,300,50);

fill (0,0,100);
rect (0,400,300,50);

fill (0,0,50);
rect (0,450,300,50);

// GRASS
noStroke ();
// green_background
fill (0,150,0);
rect (300,300,300,250);

// squares_first_row 
fill (0,90,0);
rect (310,312,10,10);

fill (0,90,0);
rect (370,312,10,10);

fill (0,90,0);
rect (430,312,10,10);

fill (0,90,0);
rect (480,312,10,10);

// squares_second_row 
fill (0,90,0);
rect (340,342,10,10);

fill (0,90,0);
rect (400,342,10,10);

fill (0,90,0);
rect (460,342,10,10);

//  squares_third_row 
fill (0,90,0);
rect (310,372,10,10);

fill (0,90,0);
rect (370,372,10,10);

fill (0,90,0);
rect (430,372,10,10);

fill (0,90,0);
rect (480,372,10,10);

// squares_fourth_row 
fill (0,90,0);
rect (340,402,10,10);

fill (0,90,0);
rect (400,402,10,10);

fill (0,90,0);
rect (460,402,10,10);

// squares_fifth_row 
fill (0,90,0);
rect (310,432,10,10);

fill (0,90,0);
rect (370,432,10,10);

fill (0,90,0);
rect (430,432,10,10);

fill (0,90,0);
rect (480,432,10,10);

// squares_sixth_row 
fill (0,90,0);
rect (340,462,10,10);

fill (0,90,0);
rect (400,462,10,10);

fill (0,90,0);
rect (460,462,10,10);


//PALM TREE
strokeWeight (5);
stroke(129, 64, 10);
noFill();
arc(318, 165, 50, 300, HALF_PI,PI);

//LEAVES
noStroke ();
fill (126,216,52);
arc(350, 164, 120, 100, PI, PI + 3*PI/4, OPEN);

noStroke ();
fill (126,216,52);
arc(229, 164, 120, 100, PI + PI/4, TWO_PI, OPEN);
}


