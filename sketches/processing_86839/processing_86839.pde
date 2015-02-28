
int myX;
int myY;
void setup() {
size(500,500);
myX=100;
myY=100;
}

void draw() {
  background(146,184,189);//bg color
  noStroke();
  myX=mouseX;
  myY=mouseY;
  int s = second();
fill(218,218,218);//skin color

int myTime = 0; //set start time to 0
int ntime = second() - myTime; //measuring time between current second and 0, how many seconds have passed
if( ntime >= 1 && ntime % 2){ //if the number of seconds that have passed are greater or equal to 1 and that number is even...
    triangle(159+myX,67+myY,172+myX,50+myY,172+myX,84+myY); //then the tail moves down
quad(102+myX,28+myY,102+myX,73+myY,162+myX,69+myY,162+myX,65+myY);
myTime = second(); //makes it a loop
}
else {
triangle(159+myX,47+myY,172+myX,30+myY,172+myX,64+myY);//otherwise, flipper is here
quad(102+myX,28+myY,102+myX,73+myY,162+myX,49+myY,162+myX,45+myY);//otherwise, back tail is here
}
ellipse(50+myX,50+myY,150,75);//main body shape
ellipse(myX-15,50+myY,60,60);//head
fill(221,217,210);//horn color
triangle(myX-40,45+myY,myX-40,53+myY,myX-95,25+myY);//horn
fill(255,255,255);//eyeball color
ellipse(myX-30,40+myY,10,10);//eyeball
fill(0,0,0);//pupil color
ellipse(myX-27,40+myY,3,3);//pupil
fill(177,177,176);//spots colors
ellipse(50+myX,20+myY,20,5);//spot 1
ellipse(30+myX,25+myY,20,5);//spot 2
ellipse(80+myX,22+myY,20,5);//spot 3
ellipse(70+myX,30+myY,18,5);//spot 4
ellipse(85+myX,35+myY,16,5);//spot 5
ellipse(102+myX,33+myY,12,5);//spot 6
fill(218,218,218);//left flipper color
triangle(42+myX,85+myY,66+myX,66+myY,66+myX,106+myY);//left flipper
stroke(3);//mouth line
line(myX-37,70+myY,myX-20,70+myY);//mouth
}


