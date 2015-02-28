
//Jiyoung Lee
// homework 9
//copyright @ jiyoung lee

float [ ] x= {random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),};
float [ ] y = {random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
random(0,400),
};

float [] z = { random(0,50),
random(0,50),
random(0,100),
random(0,150),
random(0,200),
random(0,120),
random(0,150),
random(0,100),
random(0,50),
random(0,50),
};





color [ ] col = {color(random(255), random(255), random(255)),
color(random(255), random(255), random(255)),
color(random(255), random(255), random(255)),
color(random(255), random(255), random(255)),
color(random(255), random(255), random(255)),
color(random(255), random(255), random(255)),
color(random(255), random(255), random(255)),
color(random(255), random(255), random(255)),
color(random(255), random(255), random(255)),
color(random(255), random(255), random(255)),};
                    


void setup()
{
  size(400,400);
  background(250,149,149);


}



void draw()
{
   for(int i = 0; i < x.length; i++)
  {
    noStroke();
    fill(col [i]);
    ellipse(x[i],y[i],z[i],z[i]);
   
    
  }
  
}



