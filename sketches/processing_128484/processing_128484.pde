
//Copyright Talha Aamir 2014
//Homework 1

size(400, 400);

//background
background(140, 0, 26); //burgundy

//cross
strokeWeight(1);
fill(244, 164, 96); //sandy brown
quad(50, 150, 350, 150, 360, 160, 50, 160);



//background diagonals
stroke(217, 96, 59); //vermillion 
strokeWeight(5);
int x1 = 0;
int y1 = 0; //increase by 20
int x2 = 0; //increase by 20
int y2 = 0;
for(int i = 0; i < 50; i++)
{
   line(x1, y1, x2, y2);
   y1 = y1 + 20;
   x2 = x2 + 20;
}


//t-a burgundy connectors
stroke(140, 0, 26);
strokeWeight(10);
line(176, 122, 224, 77);
line(176, 305, 224, 255);
line(226, 255, 311, 167);

stroke(0);
strokeWeight(1);

//t
fill(0); //black
rect(170, 115, 6, 205);

//a down
fill(0); //black
rect(225, 60, 6, 205);

//a diagonal
//quad(225, 60, 231, 60, 375, 260, 369, 260);
quad(225, 61.5, 231, 61.5, 321, 173, 315, 173);

//saveFrame("hw1.jpg");


