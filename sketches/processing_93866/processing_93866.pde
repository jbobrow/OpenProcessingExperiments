
//HW 10 Cristina Shin cshin1 Copyright Cristina Shin 2013
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
 
float [] deltaA = {
  random(1, 5),
  random(1, 5),
  random(1, 5),
  random(1, 5),
  random(1, 5),
  random(1, 5),
  random(1, 5),
  random(1, 5),
  random(1, 5),
  random(1, 5),
};
 
float [] deltaB = {
  random(1, 3),
  random(1, 3),
  random(1, 3),
  random(1, 3),
  random(1, 3),
  random(1, 3),
  random(1, 3),
  random(1, 3),
  random(1, 3),
  random(1, 3),
};


void setup ( )
{
  size (400, 400);
  background (150);
}


void draw( ) {
 make( ); 
 bounce( );
  
}


void make( ) { 

  for (int i = 0; i < x.length; i++)
  {
    noFill ( );
    strokeWeight(1);
    stroke (col[i]);
    ellipse(x[i], y[i], siz[i], siz[i]);
  }
}


void bounce( ) {
  for (int i = 0; i < deltaA.length; i++)
  {
    x [i] = x[i] + deltaA[i];
    y [i] = y[i] + deltaB[i];
     
    if ( y[i] < 0 || y[i] > height || x[i] < 0  || x[i] > width )
    {
      deltaA[i] = -deltaA[i];
      deltaB[i] = -deltaB[i];
    }
  }}




