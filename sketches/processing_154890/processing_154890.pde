
  int width = 600; 
  int height = 400;
 
  void
  setup()
  {
    size(width,height);
  
  }
  void
  draw()
  { 
    background(255, 204, 0); /*a bright yellow*/
    strokeWeight(3);
    
  /*hours circles*/
   //create a column of circles with a radius of 50,
   //offset by 20, that move down 20 every hour
   // and change color every hour
   for (int h = -480; h < height + 100 ; h += 120)
   {fill(0, 255 - (8.125 * hour()), 50);
   ellipse(200, h + (20 * hour()), 100, 100);}
  
   /*hours text*/
    //print the given hour of day within the circle (24 hour clock)
    //the text will move with the circle every hour
   for (int z = -462; z < height + 100; z += 120)
   {textSize(48);
    fill(200);
   text(hour(), 172, z + (20 * hour()));}
  
  /*minutes circles*/
   //create a column of circles with a radius of 37.5,
   //offset by 20, that move down 15 every minute
   // and change color every minute
   for (int h = -900; h < height + 75; h += 95)
   {fill(255 - (3.42 * minute()), 0, 50);
   ellipse(330, h + (15 * minute()), 75, 75);}
  
   /*minutes text*/
    //print the given minute within the circle
    //the text will move with the circle every minute
   for (int z = -890; z < height + 75; z += 95)
   {textSize(30);
   fill(200);
   text(minute(), 312, z + (15 * minute()));}
  
   /*seconds circles*/
    //create a column of circles with a radius of 25,
    //offset by 20, that move down 5 every second
    //and change color every second
    for (int h = -300; h < height + 50; h += 70)
    {fill(40, 40, 255 - (3.42 * second()));
    ellipse(430, h + (5 * second()),50,50);}
 
   /*seconds text*/
    //print the given second within the circle
    //the text will move with the circle every second
    for (int z = -292; z < height + 50 ; z += 70)
    {textSize(20);
    fill(200);
    text(second(), 419, z + (5 * second()));}
 
  /*lines*/
   //create decorative lines on the side of the image
    for (int i = 0; i < (height + 300); i += 5)
    {line(0, i, 50, i);}
    
    for (int j = 0; j < (height + 300); j += 10)
    {line(40, j, 120, j);}
    
    for (int k = 0; k < (height + 300); k += 5)
    {line(550, k, width, k);}
    
    for (int l = 0; l < (height + 300); l += 10)
    {line(480, l, (width - 40), l);}
    
 
  } // draw

