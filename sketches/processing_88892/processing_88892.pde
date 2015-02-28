
int RED = 150;
int GREEN = 185; //declare a variable called GREEN that is an interger
int BLUE = 95;
int ellipseSize = 75;

void setup(){
  size(400, 600);
  background(RED, GREEN, BLUE); //background colour declared by variables
}

void draw(){
  fill(250, 200, 200);
  noStroke();
rect(190,80, 20,210);  
ellipse(200,50, ellipseSize, ellipseSize);

fill(0);
ellipse(190, 40, 5, 5);
ellipse(210, 40, 5, 5);
ellipse(200, 50, 15, 5); //stickman's face

fill(217, 47, 37);
ellipse(200, 60, 25, 8);

fill(160, 29, 29); //fill red for mouth
ellipse(200, 15, 100, 30); 

strokeWeight(17);
stroke(250, 200, 200);
line(200, 280, 280, 500);
line(200, 280, 100, 500);
line(50, 150, 350, 150); // stickman's body

stroke(227, 27, 27);
rect(280, 500, 50, 10);
rect(50, 500, 50, 10);
save("mrcool.jpeg");
}


