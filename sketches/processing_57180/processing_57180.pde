
int x= 180;
int y= 480;
int bodyHeight = 100; //minimum of 66

int init_neckHeight = 150; // Only change this value
int neckHeight = init_neckHeight;

int radius = 80;
int ny= y - bodyHeight - neckHeight - radius;

PImage landscape;

void setup() {
  size (720, 480);
  landscape = loadImage("SPACEedited.jpg");
  smooth();
  ellipseMode(RADIUS);
}

//void draw() {
//  background (landscape);
//}


//void setup()
//{
//  size(720, 480);
//  ellipseMode(RADIUS);
//  smooth();
//}
//


void draw()
{
  background (landscape);
  
  /*if (mousePressed)
  {
    x = x + 20;
  }*/
  

  
 x = mouseX;
 y = mouseY;
  
  ny= y - bodyHeight - neckHeight - radius;
  if (mousePressed)
  {
    neckHeight = neckHeight - 2;
    if (neckHeight < 5)
    {
      neckHeight = 5;
    }
  }
  else if (!mousePressed)
  {
    neckHeight = init_neckHeight;
  }
  
  //Antennae
 float speed = 2.5;       //Vibration starts
  int diameter= 20;
  float x;
  float y;
  
  {
    size(720, 480);
    smooth();
    x= width/1.5;
    y=height/1.5;
  }
  

    x += random(-speed, speed);
    y += random(-speed, speed);
    ellipse (x, y, diameter, diameter);
                            //Vibration ends
 
 
  stroke(150);
  strokeWeight(radius/6); //Set stroke to thickness of Antennae
  line(x, ny, x-radius*1.4, ny+radius/2.2);     //Left-bottom
  line(x, ny, x, ny-radius*1.5);      //Left-Top
  line(x, ny, x+radius*1.5, ny-radius*1.5);     //Right-Top
  line(x, ny, x+radius*1.2, ny+radius/10);  //Right-bottom
  
  //Neck
  
  stroke(150);//Set stroke to grey
  strokeWeight(radius/2); //Set stroke to thickness of neck
  line(x, y-bodyHeight, x, ny);       //Neck-Line*/
  
  //Body
  noStroke();                                         //Disable Stroke
  fill(102);                                          //Set fill to grey
  ellipse(x, y-33, 33, 33);                        //Antigravity orb
  fill(102);                                            //Set fill to black
  rect(x-45, y-bodyHeight+(bodyHeight/10), 90, 6);//bodyHeight-24);     //Arms
  fill(0);//Set fill to grey
  rect(x-25, y-bodyHeight, 50, bodyHeight-45);                 //Body
  
  
  
  //Head
  fill(0);                                    //Set fill to black
  ellipse(x, ny, radius, radius);    //Head
  fill(255);                                  //Set fill to white
  ellipse(x+radius/2.5, ny-radius/2.5, radius/5, radius/5);                //Large eye
  fill(0);                                    //Set fill to black
  ellipse(x+radius/2.5, ny-radius/2.5, radius/15, radius/15);                  //Pupil
  fill(153);                                  //Set fill to light grey
  ellipse(x-radius/2, ny-radius/2, radius/15, radius/15);                     //Small eye 1
  ellipse(x-radius/5, ny, radius/10, radius/10);                  //Small eye 2
  ellipse(x+radius/2, ny+radius/10, radius/10, radius/10);                  //Small eye 3

}

