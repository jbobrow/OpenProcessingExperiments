
size(600, 600);
background(0);
stroke(225);
noFill();
smooth();
strokeWeight(1);
float j=0;
float k=0;
float l=0;
float m=0;
float n=0;
float o=0;

colorMode(HSB, width);

//edit the parameters here to change the number of lines that are created
for (int x=0;x<=230;x+=45)
{
  for (int g=0;g<width;g++)
  {

    for (int y=0;y<width;y++) 
    {
    }
  }
  for (int i=1/4; i<100; i+=6.5) 
  {  
//changing these effects the shape in a big way
    j=(random(width));
    k=(random(height));
    l=(random(width)+100); 
    m=(random(width, height));
    n=( x + i );
    o=(random(50-175));

    stroke(k, width, width);



 //messing around with these integers is interwesting an is a nice way to get use to the brazier shape
    bezier(random(200, 300), random(200, 300), random(height), random(height), n, random(height/2), j, k);
  }
}


