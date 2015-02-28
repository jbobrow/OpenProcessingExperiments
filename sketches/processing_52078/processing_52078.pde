
// Ariel Leath code assignment 1 - Bestiary
// Jan 27, 2012

int x=400;
int y=300;
int counter=0;

void setup (){
smooth();
size(800,800);
background(255);
//int a=900;
//int b=400;
}

void draw (){
  //x=400;
  println(x);
  //y=300;
  println(y);

// begin drawing "cop" monster
// body
background(255);
//a=a+2;
//b=x-150;
strokeWeight(5);
fill(255,0);
rect(x-150,y-50,350,250);

// mouth
fill(0);
stroke(0);
rect(x-70,y-5,200,75);
noFill();

// "bottom" teeth
fill(255);
stroke(255);
rect(x-65,y,20,30);
rect(x-35,y,20,30);
rect(x-5,y,20,30);
rect(x+25,y,20,30);
rect(x+85,y,20,30);

// "top" teeth
rect(x-60,y+45,30,20);
rect(x+25,y+45,30,20);


// left eye
stroke(0);
fill(255,0,0);
ellipse(x+65,y+150,60,60);
noFill();
ellipse(x-20,y+150,60,60);

// right eye
fill(0);
ellipse(x+65,y+150,40,40);
ellipse(x-20,y+150,20,20);
noFill();

// legs...? arms...?

// left base leg
rect(x-60,y+200,9,120);
fill(0);
rect(x-80,y+200,50,20);
//foot
rect(x-70,y+320,30,9);

// right base leg
noFill();
rect(x+95,y+200,9,120);
fill(0);
rect(x+75,y+200,50,20);
//foot
rect(x+85,y+320,30,9);
noFill();

//right side arms
//top
rect(x+200,y,120,9);
fill(0);
rect(x+200,y-20,20,50);
noFill();
//bottom
rect(x+200,y+95,120,9);
fill(0);
rect(x+200,y+80,20,50);
noFill();

//left side arms
//bottom
rect(x-270,y+95,120,9);
fill(0);
rect(x-170,y+75,20,50);
noFill();
//top
rect(x-270,y,120,9);
fill(0);
rect(x-170,y-20,20,50);
noFill();

//top arms
// top arm left
rect(x-60,y-190,9,120);
fill(0);
rect(x-80,y-70,50,20);
noFill();
// top arm right
rect(x+95,y-190,9,120);
fill(0);
rect(x+75,y-70,50,20);
noFill();

//straps
fill(75);
rect(x-125,y-50,9,250);
rect(x+170,y-50,9,250);

//c'est complete


if (y>500 && counter==0){
  y-=2; 
  counter=1;
}
if (counter==0){
  y+=2;
}
if (y<100 && counter==1){
  y+=2;
  counter=0;
}
if (counter==1){
  y-=2;
}
  
  
}



