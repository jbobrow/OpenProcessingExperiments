
float angle = 0.0;
float hue = 0;
float timer = 0;


void setup()
{
  size(500, 500);
 

  colorMode(HSB, 360, 100, 100);  
  background(0);
  
}

void draw()
{
      
  
timer = timer + 0.0167;

  hue = hue + 2;
  fill(hue,100,100);
  if (hue >= 360)
  {
    hue = 0;
  }
   

  angle+= 0.05;
  if (angle > TWO_PI)
  angle = 0;
  for (int i = 0; i < width; i = i + 10)
  
  {   
    float percent = i / (float)width;
    stroke(hue,100,100 * 1);
    line(i,0,i,height); 
  }
  
  pushMatrix();
 //Phase 2
       if (timer > 5 && timer < 13)
       hue = hue + 100;
  fill(hue,100,100);
  if (hue >= 360)
  {
    hue = 0;
  }
       scale(angle, angle);
       stroke(#FFFFFF);
       strokeWeight(5);
       rect(50,50,50,50);       
popMatrix();
  
  
pushMatrix();
 //Phase 3
       if (timer > 9)
       
background(0);
fill(hue,100,10);

        translate(80,80);
        rotate(angle);
        scale(angle);
        rotate(radians(10));
        stroke(#FFFFFF);
        strokeWeight(1);
        triangle(30, 75, 58, 20, 86, 75);     
popMatrix();


  hue = hue + 1;
  fill(hue,hue,hue);
  if (hue >= 360)
  {
    hue = 0;
  }
  
  //Phasettwo
      if (timer > 5)

  //Circle
  translate(250,100);
  rotate(angle); 
  rotate(radians(150));
  noStroke();
  
  hue = hue + 1;
  fill(hue,100,100);
  if (hue >= 360) 
  hue = 0;
  
  ellipse(50,50,80,80);


  //Square
  pushMatrix();
  translate(50,50);
  rotate(angle);
  scale(angle);
  rotate(radians(10));
  stroke(0);
  strokeWeight(.3);
  rect(0, 50, 50, 50);
  popMatrix();
  
 
  //Triangle
  pushMatrix();
  translate(50,50);
  rotate(angle);
  scale(angle);
  rotate(radians(10));
  stroke(0);
  strokeWeight(.3);
  triangle(30, 75, 58, 20, 86, 75);
  popMatrix();




   //Dots
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(0,250,30,30);
   

   
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(25,250,30, 30);  
   
   

   
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(50,250,30, 30);



   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(75,250,30, 30);  
         
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(100,250,30, 30);
    
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(125,250,30, 30); 
     
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(150,250,30, 30);
   
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(175,250,30, 30);  
     
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(200,250,30, 30);
    
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(225,250,30, 30); 
    
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(250,250,30, 30);
   
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(275,250,30, 30); 
     
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(300,250,30, 30);
   
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(325,250,30, 30); 
     
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(350,250,30, 30);
   
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(375,250,30, 30);
    
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(400,250,30, 30);
    
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(425,250,30, 30); 
    
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(450,250,30, 30);
   
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(475,250,30, 30);
    
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(500,250,30, 30);
  
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(525,250,30, 30);
  
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(550,250,30, 30);
   
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(575,250,30, 30);
   
   rotate(radians(height * width));
   scale(angle, angle);
   noStroke();
   stroke(0);
   strokeWeight(.01); 
   ellipse(600,250,30, 30);
   
   rotate(radians(height * width));
   scale(angle, angle);
   stroke(0);
   strokeWeight(.01); 
   ellipse(625,250,30, 30);
  
  rotate(radians(height * width));
  scale(angle, angle);
  stroke(0);
  strokeWeight(.01); 
  ellipse(650,250,30, 30);
   
   
  rotate(radians(height * width));
  scale(angle, angle);
  stroke(0);
  strokeWeight(.01); 
  ellipse(675,250,30, 30);
 
 
  rotate(radians(height * width));
  scale(angle, angle);
  stroke(0);
  strokeWeight(.01); 
  ellipse(700,250,30, 30);


  rotate(radians(height * width));
  scale(angle, angle);
  stroke(0);
  strokeWeight(.01); 
  ellipse(725,250,30, 30);


  rotate(radians(height * width));
  scale(angle, angle);
  stroke(0);
  strokeWeight(.01); 
  ellipse(750,250,30, 30); 
   

    
}


