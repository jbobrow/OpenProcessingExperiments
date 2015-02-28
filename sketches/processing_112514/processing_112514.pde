
//To start off the code.
void setup() {
  
//This is for the background dimensions.  
size(600, 600);

//To change the colour of the background to red.
background(224, 20, 20);

}

void draw() {
  
//To take away the outlines on the shapes.  
noStroke();

//These shapes are for the top left corner squares and circle.
fill(0,0,0);
rect(50, 50, 200, 200);

fill(26,172,217);
rect(75, 75, 150, 150);

fill(224, 20, 20);
rect(100, 100, 100, 100);

fill(0,0,0);
ellipse(150, 150, 48, 48) ;

//These are for the top right triangle.
fill(26,172,217);
triangle(350, 250, 550, 250, 450, 50);

fill(0,0,0);
triangle(450, 250, 400, 150, 500, 150);

//These are for the bottom left triangle
fill(0,0,0);
triangle(50, 350, 250, 350, 150, 550);

fill(26,172,217);
triangle(150, 350, 200, 450, 100, 450);

//These are to declare the variables of the bottom right squares and their colours.
  int Xcoord = 350 ;
  int Ycoord = 350 ;
  int height1 = 200;
  int fill1 = 0;
  int fill2 = 255;
  
//The start of the loop for the bottom right squares.  
for(int i=0; i < 7; i++){
  
  fill(fill1,fill1,fill1);
 rect(Xcoord, Ycoord, height1, height1);
 
 fill(26,172,217);
 rect(431, 431, 40, 40);

//Used to create the squares inside of each other, 
height1 = height1 - 40;
fill1 = fill1 + 90;
fill2 = fill2 - 80;
Ycoord = Ycoord + 20;
Xcoord = Xcoord + 20;

}

}


