

int masodperc;
int perc;
int ora;


void setup()
{
 size(600, 400); 
  
}


void draw()
{
 background(0, 0, 0);
 
 
 perc = minute();
 masodperc = second();
 ora = hour();

 
 
 
 fill(245, 12, 254, 200);
 triangle(perc * width / 60, height - 250, 90, 20, 90, 250);
line(0, height / 2, height / 2, 255 );

fill(12, 254, 23, 255);
 noStroke();
 
 triangle(masodperc * width / 60, height - 350, 90, 20, 90, 250); //600szeles osztva 60 percel 10egyseggel ugräl
 
 fill(8, 13, 248, 180);
 ellipse(ora * width / 24, (height / 2) + 50, 100, 100);
}







