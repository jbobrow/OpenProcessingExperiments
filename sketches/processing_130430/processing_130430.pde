
//Rachel Ciavarella
//comupting for the arts with processing CMU
//Homework IV

float x , y;
float wd , ht;
float xDist, yDist;
float easingCoef;

void setup()
{
  size( 400, 400 );
  noCursor();
  easingCoef = .2;
  wd = 40;
  ht = 40;
  xDist = mouseX - 50 *.5;
  yDist = mouseY - 50 *.5;
  
}

void draw()
{
    
  
fill( 100 , 100 , 100 , 10 );
rect( 0 , 0 , 400 , 400 );
x = mouseX;
y = mouseY;
wd = 50;
ht = 50;


// key interaction key = (b)
//press to change circle color

  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      noStroke();
fill(random(55,90) , random(50,55) , random(200,255) );
ellipse ( mouseX , mouseY ,wd , ht );
    }
  } else {
      noStroke();
    fill(random(10,10) , random(100,200) , random(50,255) );
    ellipse ( mouseX , mouseY ,wd , ht );
  }



//mouse press interaction key = (right click)
//click to clear screen to white

  if (mousePressed) {
    if (mousePressed == true) {
      fill( 255 , 255 , 255 , 255 );
rect( 0 , 0 , 400 , 400 );
    }
  } else {
   fill( 100 , 100 , 100 , 10 );
rect( 0 , 0 , 400 , 400 );
  }

}





