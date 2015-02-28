
//HW 9 Cristina Shin cshin1 Copyright Cristina Shin 2013
color [] col = {
  color(random(200), random(200), random(200)),
  color(random(200), random(200), random(200)),
  color(random(200), random(200), random(200)),
  color(random(200), random(200), random(200)),
  color(random(200), random(200), random(200)),
  color(random(200), random(200), random(200)),
  color(random(200), random(200), random(200)),
  color(random(200), random(200), random(200)),
  color(random(200), random(200), random(200)),
  color(random(200), random(200), random(200)),
};
 
float [] x = {
  random(50, 300),
  random(50, 300),
  random(50, 300),
  random(50, 300),
  random(50, 300),
  random(50, 300),
  random(50, 300),
  random(50, 300),
  random(50, 300),
  random(50, 300),
                   

};
 
float [] y = {
  random(10, 250),
  random(10, 250),
  random(10, 250),
  random(10, 250),
  random(10, 250),
  random(10, 250),
  random(10, 250),
  random(10, 250),
  random(10, 250),
  random(10, 250),
};
   
float [] siz = {
  random(20, 50),
  random(20, 50),
  random(20, 50),
  random(20, 50),
  random(20, 50),
  random(20, 50),
  random(20, 50),
  random(20, 50),
  random(20, 50),
  random(20, 50),
};
 
void setup ( )
{
  size (400, 400);
  background (150);
  
  for (int i = 0; i < x.length; i++)
  {
  noFill ( );
  strokeWeight(1.5);
  stroke (col[i]);
  ellipse(x[i], y[i], siz[i], siz[i]);
  }
}





