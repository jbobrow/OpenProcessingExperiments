
//numbers for bouncing Domo 
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;


void setup() {
size(500,500); //size 500 width and 500 height
}

void draw() {

//changing background color
if(mousePressed == true) { 
  drawDomo(mouseX,mouseY);
  } else if (keyPressed == true) {  //bouncing Domo
background(int(random(255)), int(random(255)), int(random(255)));
x = x + xspeed;
  y = y + yspeed;

  // Check for bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  // Display at x,y location
  stroke(0);
  fill(175);
//Domo
fill( 108, 74, 0);
  rect(x,y,50,60); //head
  fill(0);
  ellipse(x+10, y+10, 2, 2); //left eye
  ellipse(x+40, y+10, 2, 2); //right eye
  fill(255, 0, 4);
  rect(x+10, y+20, 30, 30); //mouth
  fill(255);
  triangle(x+10, y+20, x+20, y+20, x+15, y+30); //top teeth
  triangle(x+20, y+20, x+30, y+20, x+25, y+30); //top teeth
  triangle(x+30, y+20, x+40, y+20, x+35, y+30); //top teeth    
  triangle(x+10, y+50, x+20, y+50, x+15, y+40); //bottom teeth
  triangle(x+20, y+50, x+30, y+50, x+25, y+40); //bottom teeth
  triangle(x+30, y+50, x+40, y+50, x+35, y+40); //bottom teeth
  

  } else {
background( int(random(255)),100,255,int(random(25)));
  }
  


  for (int y=0; y < height; y += 0){
for ( int x=0; x < width; x += 0){
//fill( int(random(255)), int(random(255)), int(random(255)));
fill(int(random(255)),100,255,int(random(25)));
stroke(1);
rect(x, y, 50, 60);
x+=50;}
y+=60;
} 
//Domo moves in a square motion
//Domo = drawDomo - 1;
}

void drawDomo (int x, int y){
  fill( 108, 74, 0);
  rect(x,y,50,60); //head
  fill(0);
  ellipse(x+10, y+10, 2, 2); //left eye
  ellipse(x+40, y+10, 2, 2); //right eye
fill(255, 0, 4);
  rect(x+10, y+20, 30, 30); //mouth
  fill(255);
  triangle(x+10, y+20, x+20, y+20, x+15, y+30); //top teeth
  triangle(x+20, y+20, x+30, y+20, x+25, y+30); //top teeth
  triangle(x+30, y+20, x+40, y+20, x+35, y+30); //top teeth    
  triangle(x+10, y+50, x+20, y+50, x+15, y+40); //bottom teeth
  triangle(x+20, y+50, x+30, y+50, x+25, y+40); //bottom teeth
  triangle(x+30, y+50, x+40, y+50, x+35, y+40); //bottom teeth
}






