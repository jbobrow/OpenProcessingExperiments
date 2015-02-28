
//Homework 2
// Copyright 2013 Kimberly Harvey all rights reserved, kharvey@andrew.cmu.edu

float x, y, mid, wd, ht;
//FLOATS GO BEFORE VOID SETUP KIMBERLY!!!


void setup()
{
size (400,400);
background (0,0,0);

mid = 200; //here you are defining the floats
wd = 400;
ht = 400;
x = 0;
y = 0;

}

void draw(){
smooth();

stroke(255);
strokeWeight(30);


// INITIAL K
    //brown
    stroke(204, 102, 0);
    line(x+10, y, x+10, ht);

    //BLUE
    stroke(0, 19, 209);
    line(x+10, y+ht/2,x+wd/2, ht);
    line(x+10, y+ht/2,x+wd/2,y);
    
    
// INITIAL H
stroke(255);
    
    //RED
    stroke(#FF0303);
    line(x+wd/2, y,x+wd/2,ht);
    
    //YELLOW
    stroke(#FFDA03);
    line(x+(wd-10), y,x+(wd-10),y+ht);
    
    //PINK
    stroke(255,0,183);
    line(x+wd/2,y+ht/2,(x+(wd-10)), y+(ht/2));



}


