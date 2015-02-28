
// variables for position of one rectangle
float x = 200;
float y = 100;

// variables for position of one rectangle
float x1=200;
float y1 = 100;

// variables for speed of rectangles
float speed = 2;
float speed1 = 4;
float speed2 = 3;
float speed3 = 6;

void setup () {
 size (500, 500);
 rectMode(CENTER);
 smooth();
}

void draw () {
fill (255,10);
noStroke();
rect(width/2,height/2,width,height);




stroke(250,0,0,50);
strokeWeight(10);
ellipse(x,y,50,50);
ellipse(x1,y1,50,50);

stroke(0,250,0,50);
ellipse(x,y1,50,50);
ellipse(x1,y,50,50);

stroke(0,0,250,50);
ellipse(y,x,50,50);
ellipse(y1,x1,50,50);

//x = x + speed;

y = y + speed;
x= x-speed1;

y1 = y1 + speed2;
x1= x1+speed3;

if ((y>height ) || (y<0)){

speed = speed *-1;
}

if ((x>height ) || (x<0)){

speed1 = speed1 *-1;
}

if ((y1>height ) || (y1<0)){

speed2 = speed2 *-1;
}

if ((x1>height ) || (x1<0)){

speed3 = speed3 *-1;
}
}          
                
