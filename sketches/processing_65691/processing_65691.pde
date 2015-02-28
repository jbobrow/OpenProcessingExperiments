
/*
This originally was a collage about Persian carpets in different shapes, sizes and colors.
And the linear motion features has been added to the workshop in order to give an unrealistic movement to some of the carpets.
The concept could associate to the "magic carpet" - which is able to fly - derived from one of "one thousand and one nights" stories.
*/


//IMAGES

PImage img1; PImage img2; PImage img3;
PImage img4; PImage img5; PImage img6;
PImage img7; PImage img8; PImage img9;
PImage bg; float r1; float r2;
PImage[] images;

//LINEAR VARIABLES

int radius = 51; float x = 300; float speed = 3; int direction = 1; float y=150;



//--------------------------------------------------------------------------------------------------------------------------------------------------

void setup() 
  {
    //GENERAL
      size(600, 300); background(0); smooth();
  
    //IMAGE LOADER
      images = new PImage[9];
      images[0]=loadImage("01.png");   images[1]=loadImage("02.png");   images[2]=loadImage("03.png");  images[3]=loadImage("04.png");   images[4]=loadImage("05.png");   images[5]=loadImage("06.png");  images[6]=loadImage("07.png");   images[7]=loadImage("08.png");   images[8]=loadImage("09.png");   

    //LINEAR SECTION     
    ellipseMode(RADIUS);    


  }
  
//-------------------------------------------------------------------------------------------------------------------------------------------------

void draw()
  {
    
   //BACKGROUND

    imageMode(CORNER); 
    image(images[8], 0, 0);
    image(images[7], 150, 0);
    image(images[8], 300, 0);
    image(images[7], 450, 0);
    image(images[7], 0, 150);
    image(images[8], 150, 150);
    image(images[7], 300, 150);
    image(images[8], 450, 150);
    imageMode(CENTER);

   //LINEAR MOVEMENTS

      x += speed * direction;
      y = y - (x);
      image(images[2], x, 0);
      image(images[2], x, 300);
      image(images[3], 150, 150);
      image(images[6], 450, 150);
      
      image(images[5], width/2, height/2+x/32);
      
    if ((x > width-255) || (x < 255)) {direction = -direction;}
      if (direction == 1) {imageMode(CENTER);image(images[1], x, height/2);} else {  image(images[1], x, height/2);}


      imageMode(CENTER);
      image(images[4], 75-x/30, height/2);
      image(images[4], 525+x/20, height/2);
      imageMode(CENTER);


  }
  


