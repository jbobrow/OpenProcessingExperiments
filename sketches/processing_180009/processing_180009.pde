

/*

Self-portrait
Tyler Sinclair 
6 Jan 2014 | DES479

*/

void setup(){
  size(100, 100); //set window size
  background(255, 255, 255); //set background color
  noLoop();
}


void draw(){
fill(238,213,183, 125); //fill to flesh color
noStroke();
ellipse(50, 50, 65,75); //draws main head shape


ellipse(15, 45, 10, 20); //draws ears
ellipse(85, 45, 10, 20);

fill(255, 255, 255); //fill to white
ellipse(35, 45, 10, 10); //draws eyes
ellipse(65, 45, 10, 10);

fill(0);  //fill to black
ellipse(37, 48, 3, 4); //draws pupils
ellipse(66, 48, 3, 4);

ellipse(55, 75, 8, 8); //draws mouth

fill(255, 0, 0); //draws hat
arc(50, 15, 15, 20, PI, 2*PI); 
ellipse(50, 17, 50, 8); 

noStroke(); //draws tie
fill(0,100,100);
triangle(45, 88, 50, 93, 55, 88);
triangle(43, 100, 50, 93, 57, 100);

stroke(50, 50, 50, 125);
strokeWeight(1);
line(50, 93, 40, 97);
line(40, 97, 30, 89);
line(30, 89, 40, 85);

line(50, 93, 60, 97);
line(60, 97, 70, 89);
line(70, 89, 60, 85);

}






