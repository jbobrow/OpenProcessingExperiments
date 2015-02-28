
// ID2 Week 4 Assignment --asymmetrical face--

float x;

void setup()
{
  size(500, 500);
  smooth();
stroke(0);
}


void draw ()
{

 x= map(mouseX, 0, width, 20, 129);
background(255);
println(x);

// eyebrows
strokeWeight(3);
line(180, 5, 180, 55);
line(320, 5, 320, 55);
line(50, 55, 180, 55);
line(320, 55, 450, 55);

// eyebrow ellipse
fill(0);
ellipse(50, 55, 10, 10);
ellipse(450, 55, 10, 10);

// eyes outline
stroke(0);
strokeWeight(1);
line(50,75, 105,75);
line(105,75, 150,130);
line(150,130, 195,75);
line(195,75, 230,75);
line(270,75, 305,75);
line(305,75, 350,130);
line(350,130, 395,75);
line(395,75, 395,-10);
strokeWeight(x/5); // variable x 
strokeCap(SQUARE);
line(350,75, 350,25); //line above right eye

// nose
line(230,75, 230,260);
line(270,75, 270,260);

// tears 
fill(0);
stroke(0);
strokeWeight(2);
line(150, 130, 150, x*10); // left for x
line(350, 130, 350, x*8); // right for x
ellipse(350,x*8, x/2, x/2); //right for x
ellipse(150,x*10, x/2, x/2); // left for x

// eyes
fill(x);
stroke(x/2);
ellipse(150,85, x+5,x+5); // right eye for x
ellipse(350,85, x+5, x+5); // left eye for x

// nostrils
fill(100);
noStroke();
triangle(220,255, 240,255, 230,269); // left
triangle(260,255, 280,255, 270,269); // right



// mouth
fill(0);
stroke(0);
strokeWeight(x/5); // for x
line(250, 273, 250,488);
quad(230,380-x, 270,380-x, 270,400-x, 230,400-x); //top lip for x
quad(230,360+x, 270,360+x, 270,380+x, 230,380+x); // bottom lip for x
rectMode(CENTER);
rect(250, 380, x*4, x/4); // center line for x



}



