
/* By Gina Kim
YSDN 1006 Interactivity Design 3.0
Prof. Borzu
March 3, 2012
Credit:
http://www.openprocessing.org/visuals/?visualID=22872
*/


float x = 0.0;
float y= 1.0;
float b= 1.0;

void setup(){
  size (500,500);
  background(0);//initial background colour
  noStroke();
  smooth();
  ellipseMode(CENTER); //ellipses move from cent
}
void draw(){
  
  frameRate (30); //speed of the ellipse growing bigger
  background (25,40,100);//background colour is navy blue
  
  fill(random(255), random(255), random(255), random(0,255)); //random changing colours and blinking
    translate (random (3), random (3)); //randomly shaking 
  ellipse (200+x,200, 30 + x/4, 30+ x/4);// going east
  
    
  fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (200-x,200, 30 + x/4, 30+ x/4);// west
    
  fill(random(255), random(255), random(255), random(0,255)); //random changing colours and blinking
  ellipse (200,200+x, 30 + x/4, 30+ x/4);//south
    
  fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (200,200-x, 30 + x/4, 30+ x/4);//north
  
    fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (200+x,200-x, 30 + x/4, 30 + x/4);//northeast
  
   fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (200-x,200-x, 30 + x/4, 30 + x/4);//northwest
  
   fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (200+x,200+x, 30 + x/4, 30 + x/4);//southeast
  
   fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (200-x,200+x, 30 + x/4, 30 + x/4);//soutthwest
  
  
  
  
  
   fill(random(255), random(255), random(255), random(0,255)); //random changing colours and blinking
   translate (random (3), random (3)); //randomly shaking 
  ellipse (250+y,250, 30 + y/2, 30+ y/2);//going east
  
  fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (250-y,250, 30 + y/2, 30+ y/2);// west
    
  fill(random(255), random(255), random(255), random(0,255)); //random changing colours and blinking
  ellipse (250,250+y, 30 + y/2, 30+ y/2);//south
    
  fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (250,250-y, 30 + y/2, 30+ y/2);//north
  
    fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (250+y,250-y, 30 + y/2, 30 + y/2);//northeast
  
   fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (250-y,250-y, 30 + y/2, 30 + y/2);//northwest
  
   fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (250+y,250+y, 30 + y/2, 30 + y/2);//southeast
  
   fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (250-y,250+y, 30 + y/2, 30 + y/2);//soutthwest
  
  

  
 fill(random(255), random(255), random(255), random(0,255)); //random changing colours and blinking
translate (random (5), random (5));
  ellipse (320+b,320, 20 + b/6, 20+ b/6);//east
  
  fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (320-b,320, 20 + b/6, 20+ b/6);// west
    
  fill(random(255), random(255), random(255), random(0,255)); //random changing colours and blinking
  ellipse (320,320+b, 20 + b/6, 20+ b/6);//south
    
  fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (320,320-b, 20 + b/6, 20+ b/6);//north
  
    fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (320+b,320-b, 20 + b/6, 20 + b/6);//northeast
  
   fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (320-b,320-b, 20 + b/6, 20 + b/6);//northwest
  
   fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (320+b,320+b, 20 + b/6, 20 + b/6);//southeast
  
   fill(random(255), random(255), random(255), random(0,255));//random changing colours and blinking
  ellipse (320-b,320+b, 20 + b/6, 20 + b/6);//soutthwest
  
  

  if(x<250)//if x is smaller than 250
  {
    x+= 2; //increase value by 2
  }
  else
  {
    x= 0;//if x is bigger, returns to 0
  }
  if(y<200) //if y is smaller than 200
  {
    y+=2; //increase value by 2
  }
  else
  {
    y=0; //if y is bigger, returns to 0
  }
  if (b<80) //if b is smaller than 80
  {
    b+=1;//increase value by 1
  }
  else
  {
    b=0;//if b is bigger, returns to 0
  }
}

