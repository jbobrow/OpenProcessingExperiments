
//Code by Saarah Saghir, YSDN 1006

//variables used:
float a=300;  //motion
int i=150;  //used in loop for dots
float steps = 200;  //how many dots show up moving
float rand = 1000;    //how random the movement is

void setup()
{
  size(300,300);
  fill(#ffffff);
  frameRate(10);  //slow speed
  ellipseMode(CENTER);
  smooth();
  
}

void draw() 
{ 
  background(255);  //constant refreshing of white bg
  
//--------------------vertical moving dots (built on code taken from processing.org's tutorial)------

  strokeWeight(.1);  //very small stroke
  stroke(255);        //white stroke
  fill(255,160,255,random(50,100));
  int totalPts = 1000;  //how many dots there are
    { a = a - 5;  //speed of motion
      if (a < -300) { 
        a = width;  //when a disappears, reset to 300.
      }
    }
for  (int i = 1; i < steps; i++){ //one line of code for each line of dots.
  ellipse( (width/400) * i+10, (height/300)+ random(300)-a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+50, (height/300)+ random(300)+a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+80, (height/300)+ random(300)+a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+100, (height/300)+ random(300)-a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+125, (height/300)+ random(300)-a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+150, (height/300)+ random(300)+a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+170, (height/300)+ random(300)-a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+180, (height/300)+ random(300)-a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+200, (height/300)+ random(300)+a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+220, (height/300)+ random(300)+a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+250, (height/300)+ random(300)-a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+280, (height/300)+ random(300)+a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+300, (height/300)+ random(300)-a, (width/700) * i+ random(1,10), (height/20)- random(1,10));
  ellipse( (width/301) * i+310, (height/300)+ random(300)-a, (width/700) * i+ random(1,10), (height/20)- random(1,10));


}

//white circle in middle, emerges only when dots move under it.
  fill(255);  
    ellipse(150, 150-random(5), 100, 100); //slight vertical movement 
}




