
//3255389, Sam Yao Ling Li, ARCH1391 - Module 2
//I cannabalised an existing piece of code titled "prettylittle"
// by Sofia Quintana
// http://openprocessing.org/visuals/?visualID=3328 to achieve
//the sketch I was trying to create.Stripping the colour and size
//limiter from the colour.

void setup(){  
  size(600,400);  
  background(255); 
 
 }  

void draw (){          //This is the main body of the code that
  int m= millis()/15;  //draws the sketch.
  noFill(); 
  float x= random(height);            //the x and y value is
  float y= random(width);             //pretty straight forward.
    stroke(x,y,0,0);                  //they assign where the circles
    ellipse(x,y, second(), second()); //will be drawn, while "m"
      stroke(0);                      //randomises the side of the
      ellipse(x,y,m,m);               //circles. Circles are drawn
      ellipse(x,y,second(),second()); //with no fill, resulting
}                                     //in lines only.


