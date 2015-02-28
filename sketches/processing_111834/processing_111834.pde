
int x = 670 ;
PFont mono ;
PImage prog;
PImage neo11;
PImage neo22;
PImage matrix2;
boolean trinity = true ;
int counter = 0;

void setup() {
  size(1000,676);
  
  matrix2 = loadImage("matrix2.jpg");
  
  mono = loadFont("Monospaced-200.vlw");
  
  prog = loadImage("program1.png");

  neo11 = loadImage("neo11.png");
  
  neo22 = loadImage("neo22.png");

}


void draw() {
  
background(matrix2);
noStroke();
smooth();


//helicopter  
  fill(#717171);
rect(290, 320, 375, 10);
rect(465, 135, 20, 10);
rect(455, 15, 40, 12);
rect(505, 15, 200, 12);
rect(245, 15, 200, 12);
rect(470, 15, 10, 40);

fill(#717171);
ellipse(475, 175, 320, 250);

fill(#FFFFFF);
arc(479, 210, 280, 280, PI+HALF_PI, TWO_PI);

fill(#717171);
quad(350, 160, 350, 190, 100, 190, 100, 130);
quad(400, 220, 410, 220, 400, 330, 390, 330);
quad(520, 220, 530, 220, 540, 330, 530, 330);

//end helicopter

image(prog, 650, 270); //program

//counter stuff

fill (#000000);
textFont (mono,70);

  if (trinity) {
    text("Trinity?!", 70, 265);
    image(neo11, 100, 240); //neo1
    
  } else {
    text("HELP!", 70,265);
    image (neo22, 100, 250);
    
  }
  
  
 // controls
  
  counter ++ ;
  
  //println(counter) ;
  
  if (counter > 120) {
    //println("beep");
    //println(trinity);
    counter = 0;
    trinity = !trinity ;
  }
  
  
//bullet

  fill(#000000);
  ellipse(x,340,25,10);
  x=x-10;
  println(x);
  if (x < 0) {
  x=670;
  }
  
}





