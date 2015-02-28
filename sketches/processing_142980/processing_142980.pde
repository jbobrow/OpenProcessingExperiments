
//variables
int centre; //centre of screen
int length1; //length of rectangle 1, small
int length2; //length of rectangle 2, mid
int length3; //length of rectangle 3, large
int deg = 0; //rotational degree
int full_circle = 1; //check for full circle rotation

//colours variables to control increase
int r = 1;
int b = 1;
int g = 1;

//colours variables to control decrease
int r2 = 255;
int b2 = 255;
int g2 = 255;

//colour placeholders for fill
int r_ph;
int b_ph;
int g_ph;

//images variables
PImage body;
PImage mind;
PImage harmony;
PImage peaceful;
PImage ohm;
PImage lotus;
PImage mandala;


//initialize
void setup()
{
  size(400,400);
  background(255);
  
  //set drawing parameters
  strokeWeight(2);
  smooth();
  
  //load images
  body = loadImage("body.gif");
  mind = loadImage("mind.gif");
  harmony = loadImage("harmony.gif");
  peaceful = loadImage("peaceful.gif");
  ohm = loadImage("ohm.gif");
  lotus = loadImage("lotus.gif");
  mandala = loadImage("mandala.gif");
}


//My own function
//cycles through RGB and outputs stroke colour
void stroke_colour()
{
  //control fill
  if ((r < 255) && (r != 0))
  {
    r++; //increase red
    stroke(r,g,b);
    
    //set placeholder variables for fill
    r_ph = r;
    b_ph = b;
    g_ph = g;
  }
  else if ((b < 255) && (b != 0))
       {
         b++; //increase blue
         stroke(r2,g,b);
         r2--; //decrease red
         
         //set placeholder variables for fill
         r_ph = r2;
         b_ph = b;
         g_ph = g;
       }
       else if ((g < 255) && (g != 0))
            {
              g++; //increase green
              stroke(r2,g,b2);
              b2--; //decrease blue
              
              //set placeholder variables for fill
              r_ph = r2;
              b_ph = b2;
              g_ph = g;
            }
            else if (g2 > 0)
                 {
                   stroke(r2,g2,b2);
                   g2--; //decrease green
                   
                   //set placeholder variables for fill
                   r_ph = r2;
                   b_ph = b2;
                   g_ph = g2;
                 }
                 else
                 {
                   //reset all values to repeat
                   r = 1;
                   b = 1;
                   g = 1;
                   r2 = 255;
                   b2 = 255;
                   g2 = 255;
                   
                   //set placeholder variables for fill
                   r_ph = r;
                   b_ph = b;
                   g_ph = g;
                 }
}


//main program
void draw()
{
  //set variables
  centre = width/2;
  length1 = 50;
  length2 = 125;
  length3 = centre;
  
  //translate origin to center
  translate(199,199);
  
  //creates weird clipping, as far as I understand it, each time
  //draw happens, it draws the opposite rotation, effectively
  //drawing both at once....ish
  full_circle = -full_circle;
  
  if (full_circle == 1)
  {
    //rotates one way and randomly fills on the gray-scale
    rotate(radians(deg));
  }
  else
  {
    //rotates other way and generates a random colour
    rotate(radians(-deg)); 
  }
  
  //////////////////////////////////////////////////////////
  //draw shapes
  stroke_colour(); //determine fill colour  
  
  //creates outside pattern
  noFill();
  rect(-length3, -length3, length3*2, length3*2);
  
  //cross lines
  line(width,height,0,0); //bottom right to centre
  line(-width,-height,0,0); //top left to centre
  line(width,-height,0,0); //top right to centre
  line(-width,height,0,0); //bottom left to centre
 
  //////////////////////////////////////////////////////////
  //outer ring of circles, with pentagrams
  //top circle
  fill(255);
  ellipse(0,-length2*1.5,length2,length2);
  
  //top pentagram - mandala
  image(mandala,-length2/2+12,-length2*2+14,100,100);
  
  
  //left circle
  fill(255);
  ellipse(-length2*1.5, 0, length2,length2);    
  
  //left Pentagram - lotus
  image(lotus,-length2*2+10,-length2/2+10,100,100);
  
  
  //bottom circle
  fill(255);
  ellipse(0, length2*1.5, length2,length2);
  
  //bottom design - mandala
  image(mandala,-length2/2+14,length2+10,100,100);
  

  //right circle
  fill(255);
  ellipse(length2*1.5, 0, length2,length2);
  
  //right pentagram - lotus
  image(lotus,length2+10,-50,100,100);
  
  //////////////////////////////////////////////////////////
  //circle, square mid size
  noFill();
  rect(-length2, -length2, length2*2, length2*2);
  ellipse(0,0,length2*2,length2*2);
  
  //rotating circles close to centre
  fill(255);
  ellipse(0,-length2 + length1/2 + 12,length1,length1); //top circle
  image(mind,-length2/4+5,-length2 + length1/2 - 14,length2/2-15,length2/2-15); //draw kanji mind
  
  ellipse(-length2 + length1/2 + 12, 0, length1,length1); //left circle
  image(peaceful,-length2 + length1/2 - 10,-length1/2+2,length2/2-15,length2/2-15); //draw kanji peaceful
  
  ellipse(length1/2 - 24, length2 - length1/2 - 12, length1,length1); //bottom circle
  image(body,-length2/4+10,length2 - length1 - 10,length2/2-15,length2/2-15);//draw kanji body
  
  ellipse(length2 - length1/2 - 12, 0, length1,length1); // right circle
  image(harmony,length2 - length1 - 8,-length1/2+2,length2/2-15,length2/2-15);//draw kanji harmony
  
  //////////////////////////////////////////////////////////
  //smaller circle and square
  noFill();
  rect(-length1, -length1, length1*2, length1*2);
  
  //circle in the middle, see-through
  ellipse(0,0,length1*2,length1*2);
 
  //add ohm and counter rotate
  //counter rotate = same code as above, just -ve values
  if (full_circle == 1)
  {
    //rotates one way and randomly fills on the gray-scale
    rotate(radians(-deg));
  }
  else
  {
    //rotates other way and generates a random colour
    rotate(radians(deg)); 
  }
  
  image(ohm,-length1+12,-length1+12,length1*1.5,length1*1.5);
    
  //////////////////////////////////////////////////////////
  //increase variable
  deg++; //degrees
  
//  println("x = " + (mouseX-199));
//  println("y = " + (mouseY-199));
}


