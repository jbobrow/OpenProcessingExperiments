

//This is my variation on the moving eyes homework. 
//This could be incorporated into my app as part of the movement sensor for the timed game. This figure could act as the eyes to spot grocery items.
//Image Reference:
//Diabetes Care Club, 2012, Grocery Shopping Tips, Photo, accessed 25 April 2013, <http://c71ceebe703043909040f74970ab05f5.cloudapp.net/diabetes-education/diabetic-resources/diabetic-nutrition-tips/grocery-shopping>.
//background image. Inserted a photo to form the background.
  
  PImage img;

  void setup () {
   
  size (800,600);
  smooth ();
  //I used this wallpaper to enhance the shopping theme
  img = loadImage("grocery-shopping.jpg");
   
}
 
  //everything I want to happen once mouse movement is sensed. It plays in a continuous loop. 
  void draw () {
   
  image(img,0,0);
   
   //creating the elipses and working out the colours
  
  //face fill colour. I chose this colour to go with the background.
  fill(128,0,0);
  
  ellipse (500,300,300,300);
  ellipse (350,300,60,60);
 
 //eye ball fill colour, to give greater definition to the black pupils.
  fill(255,255,255);
  ellipse (350,300,60,60);
  ellipse (450,300,60,60); 
  line (350,250, 300, 300);
  line (450,250, 500, 300);


  //Left eyeball movement
  float ax = map (mouseX, 0, width, 345, 360);
  float ay = map (mouseY, 0, height, 290, 310);
   
  
  //Fill colour for the eyeballs
  fill(0,0,0);
  ellipse (ax,ay,40,40);

  //Right eyeball movement   
  float bx = map (mouseX, 0, width, 445, 460);
  float by = map (mouseY, 0, height, 290, 310);
   
  ellipse (bx,by,40,40);
   
   
}



