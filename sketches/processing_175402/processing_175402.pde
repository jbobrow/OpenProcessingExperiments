
//I'm thinking of a grandmother clock. A big pendulum clock against the wall. 
//Pendulum moves towards right and I'm chasing it (or it chases me).
//under the pendulum clock there are small slivers (at the left) whish I much avoid.

//Define Color Palette
color[] Heaven = {#B575FF, #FFFF02,#7A81FF, #84AECC, #FF9564, #A700A8,#63E8BB,#A8625B,#0F020D,#7A81FF,#D181FF,#FF5809};
color[] palette = Heaven;
float counter = 0;

//Create setup code block
void setup(){
  //maximum window size for this assignment
  size(1280, 720);
  //select the first color from the selected palette
  background(palette[0]);
 }

//Create the draw code block
void draw(){
  PFont serif = createFont("serif bold", 20);
    fill(#9B134A);
  textFont(serif);
  text("week 3",650,75);
  text("Hello everyone!",625,135);
  fill(#FF9580);
  text("Chasing time (or time chasing us)",580,105);
  fill(#04060F);
  text("Please, run sometimes to see different colors.",530,160);
  
  //Setup while loop counting up to 1000
 
  //while(counter < 1000)
  {
    //Set stroke color to random palette color
    stroke(palette[int(random(1, 12))]);
    //Set stroke weight randomly
    strokeWeight(int(random(1, 10)));
    //set objects origin location x to random of screen height  
    float x = random(width);  
    //set objects height and width randomly
    float y = random(height);
    float d = random(10, 50);
     //Set fill color randomly from palette for triangles
     fill(palette[int(random(8, 9))]);
     //draw triangle 
     triangle(-x, y, 500,1,400,10);
     //Set fill color randomly from palette for quads
    fill(palette[int(random(9, 10))]);
     quad(x,500,1,0,x/100,1,1/10,1);
     //Set fill color randomly from palette for ellipses
     fill(palette[int(random(4, 8))]);
     arc(x, 500, 1.3*d, 1.5*d,-1.5*x,2.5*y); 
      //Set fill color randomly from palette for more ellipses
     fill(palette[int(random(0,9))]);
     arc(1000, 0.5*y, 1.3*d, 1.5*d,-1.5*x,2.5*y); 
     arc(1100, 0.5*y, 1.3*d, 1.5*d,-1.5*x,2.5*y); 
     arc(1200, 0.5*y, 1.3*d, 1.5*d,-1.5*x,2.5*y); 
      //Set fill color randomly from palette for polygons
     fill(palette[int(random(4, 10))]);
     beginShape();
     vertex(x,700);
     vertex(y,650);
     vertex(x,780);
     vertex(y,790);
     endShape();
     //Set fill color randomly from palette for points
     fill(#EAAE85);
     point(x, 555);
    //change limiter count randomly between -1 and +2
    counter += random(2,2.5);
  }
}
void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}





