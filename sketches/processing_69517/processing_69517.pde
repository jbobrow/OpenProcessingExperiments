
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//Repeated Shapes
//URL -> http://padova.webs.com/NestedPlusSite.html

size(300, 300);
translate(149, 149);
background(0, 51, 161);
smooth();
strokeWeight(2);
noFill();

//As the name implies, this refers to how many pluses we have drawn so far (minus one).
int depth=0;

//These refer to the semiminor and semimajor axes, respectively.
float major;
float minor;

while (depth<9) 
{
  //These define the radii's rate of shrinkage.
  major=512*pow(5.0/8.0, depth);
  minor=3*major/5;
  
  while (major>minor/2)
  {
    //These check whether we are at an even or odd depth, and color accordingly.
    if (depth%2==0)
    {
      stroke(133-133*3*major/(5*minor), 5-5*3*major/(5*minor), 5-5*3*major/(5*minor));
    }
    if (depth%2==1)
    {
      stroke(256-256*3*major/(5*minor), 204-204*3*major/(5*minor), 51-51*3*major/(5*minor));
    }
    
    //This draws the plus shape.
    ellipse(0, 0, major, minor);
    ellipse(0, 0, minor, major);
    
    major=major-minor/128;
  }
  
  //This twists the future drawings to simulate a spiral.
  rotate(2*PI/5);
  
  depth=depth+1;
}
