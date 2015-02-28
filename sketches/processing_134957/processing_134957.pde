

int shapeX=350;
int shapeY=200;
int shape0X=80;
int shape0Y=265;
int shape1X=265;
int shape1Y=525;
int shape2X=255;
int shape2Y=125;
int shape3X=250;
int shape3Y=500;
int shape4X=200;
int shape4Y=125;
int shape5X=400;
int shape5Y=325;
int shape6X=450;
int shape6Y=25;
int shape7X=400;
int shape7Y=25;
int shape8X=475;
int shape8Y=465;
int shape9X=480;
int shape9Y=500;
int shape10X=475;
int shape10Y=425;
int shape11X=325;
int shape11Y=580;
 
void setup() {  
  size(600, 700);
  background(243, 219, 157);
  rows = height/3;
 
}
 
void draw() {  
background(243, 219, 157); 

int i = 0;
while(i < height) {
  noStroke();
  float distance = abs(mouseX -i);
  
  fill(distance);
  rect(i,0,width,10);
  
  i +=100;
  }
  
  int i = 0;
while(i < height) {
  noStroke();
  float distance = abs(mouseX -i);
  
  fill(distance);
  rect(i,690,width,10);
  
  i +=100;
  }

if (mouseY < rows) {

//red circle
noStroke();
ellipseMode(CENTER);
fill(122, 19, 29);
ellipse(shapeX, shapeY, 300, 300);
shapeY= shapeY + 2;

//white rect
fill(255);
quad(shape0X, shape0Y, shape0X + 470, shape0Y - 115, shape0X + 470, shape0Y - 95, shape0X, shape0Y + 35);
shape0Y++;

//top blue rect
fill(129, 150, 135);
quad(shape2X, shape2Y, shape2X + 20, shape2Y + 10, shape2X - 35, shape2Y + 90, shape2X- 65, shape2Y + 75);
shape2Y= shape2Y + 2;

//top small line
stroke(51);
line(shape4X, shape4Y, shape4X + 250, shape4Y + 100);
shape4Y= shape4Y + 3;
 }

else if(mouseY > rows && mouseY < rows*2) {
//bottom blue rect
noStroke();
fill(129, 150, 135);
quad(shape1X, shape1Y, shape1X + 20, shape1Y + 10, shape1X- 65, shape1Y + 90, shape1X- 75, shape1Y + 75);
shape1Y= shape1Y - 2;

//blue rect
quad(shape3X, shape3Y, shape3X + 5, shape3Y - 10, shape3X + 85, shape3Y + 40, shape3X + 80, shape3Y + 50);
shape3Y= shape3Y + 1;

//black rect
noStroke();
fill(51);
quad(shape5X, shape5Y, shape5X + 50, shape5Y + 25, shape5X - 50, shape5Y + 205, shape5X - 100, shape5Y + 175);
shape5Y--;

//large orange rect
fill(200, 66, 0);
quad(shape6X, shape6Y, shape6X + 100, shape6Y + 75, shape6X - 300, shape6Y + 575,  shape6X - 400, shape6Y + 475);
shape6Y= shape6Y + 2;

//right blue rect
noStroke();
fill(129, 150, 135);
quad(shape8X, shape8Y, shape8X - 10, shape8Y - 12, shape8X + 25, shape8Y - 45, shape8X + 35, shape8Y - 35);
shape8Y= shape8Y + 1;
}

else if(mouseY > rows*2) {

//diagonal line
stroke(51);
line(shape7X, shape7Y, shape7X - 350, shape7Y + 425);
shape7Y= shape7Y - 3;


//right orange rect
fill(200, 66, 0);
quad(shape9X, shape9Y, shape9X -10, shape9Y - 5, shape9X + 42, shape9Y - 75, shape9X + 50, shape9Y - 70);
shape9Y= shape9Y - 2;

//small line
stroke(51);
line(shape10X, shape10Y, shape10X + 50, shape10Y + 50);
shape10Y--;

//square
noStroke();
fill(122, 19, 29);
quad(shape11X, shape11Y, shape11X + 45, shape11Y + 20, shape11X + 25, shape11Y + 60, shape11X - 15, shape11Y + 43);
shape11Y= shape11Y - 2;

}
else { }

shapeX=mouseX;
shape5X=mouseX;
shape9X=mouseX; 
 }




