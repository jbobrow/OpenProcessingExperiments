
//Vincent Comella
//Assignment 1-use an artist to create an image
//Nadir Afonso

void setup()
{
size(800,750);
background(225, 500, 100);
strokeWeight(15);
stroke(#FFFFFF);
noFill(); 

//outside line
ellipse(440, 450, 920, 920);
fill(#E31515);

//middle
fill(#62A5FA);
triangle(425, 280, 277, 103, 482, 68);

fill(#E31515);
triangle(265, 140, 559, 476, 329, 476);
triangle(503, 111, 533, 454, 400, 458);
arc(209, 158, 50, 50, 0, PI/2);

//Top Lines
{
stroke(0,0,0);
line(226, 6, 50, 100);
line(450, 25, 50, 100);
line(600, 50, 50, 100);
line(200, 130, 80, 120);
}

stroke(#FFFFFF);
fill(#75FA5B);
ellipse(450, 425, 150, 150);

fill(#62A5FA);
stroke(#FFFFFF);
ellipse(447, 425, 50, 50);

fill(#62A5FA);
ellipse(334, 508, 150, 150);
ellipse(552, 479, 150, 150);

fill(#75FA5B);
ellipse(330, 504, 50, 50);
ellipse(551, 481, 50, 50);
rect(12,504, width - 600, height-600);

fill(#E31515);
rect(52, 554, width - 600, height-600);

fill(#75FA5B);
rect(527, 88, width - 600, height-600);

fill(#62A5FA);
rect(557, 209, width - 600, height-600);

//left side 
fill(#62A5FA);
quad(250, 1000, 90, 25, 80, 95, 20, 91);

fill(#E31515);
quad(550, 1000, 90, 25, 80, 95, 20, 91);
quad(750, 1000, 600, 600, 750, 750, 750, 750);


//right side 
quad(552, 116, 670, 112, 558, 700, 576, 600);
quad( 618, 79, 704, 40, 796, 700, 800, 700);

fill(#62A5FA);
triangle(465, 552,605, 711, 449, 711);

fill(#E31515);
triangle(429, 569, 409, 731, 287, 638);

fill(#75FA5B);
ellipse(731, 590, 150, 150);

fill(#62A5FA);
ellipse(731, 590, 50, 50);


}
 
void draw()
{
  println("x: " + mouseX + " y: " + mouseY);
}








