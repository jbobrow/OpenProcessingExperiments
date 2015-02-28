
/* @pjs preload="glitchbg.jpg";*/
/* @pjs preload="sugarskulltoo.tga";*/

float timer = 0.0;
float rad = 0.9;
float s = 1.0;
PImage tripbg; 
PImage skull;

void setup()
{
  size(1000,1000);
  tripbg = loadImage("glitchbg.jpg");
  tint (random(100),random(100),random(100),random(100));
  frameRate(16);
  
}

void draw()
{
  //rotation1  
rad = rad + 0.3;
 s = s + 0.0001;
 
pushMatrix();
   
 translate(width/2, height/2);
rotate(rad);
 scale(s);

  image (tripbg, 0,0, width,height);
 popMatrix();
   
pushMatrix();
   
 translate(width/2, height/2);
rotate(rad);
 scale(s);

  image (tripbg, 0,0, width,height);
 popMatrix();
   
 
   //class stuff copypasta
     pushMatrix();
   
   filter(INVERT);
fill(random(255),random(255),random(255),random(255));
  stroke(random(255),random(255),random(255),random(255));
  translate(width/2, height/2);
  rotate(-1*rad);
  scale(4*s);
   
   tint(random(255),random(255),random(255),random(175));
 ellipseMode(CORNER);
 ellipse(0, 0, 100, 100);
  
  
   
   
  popMatrix();
   
///thus ends the copypasta
   
 

  
  
  
  //good timer
  timer = timer + (1.0 / 3.0);
println(timer);
if (timer >=2.0 && timer < 3.0)
{rect(0,0,100,100);
}
else if (timer >= 3.0)
{ellipse (200,200,200,200);

}

}


