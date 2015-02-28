
void setup()
{
size(250,250);
//sets size of canva
stroke(255);
//sets stroke to white
smooth();
//smooth lines & shapes
background(7,18,59);
//background set to dark blue
frameRate(20);
//number of frames within 1 second
}
 
void draw(){
line ( random(300), random(300), random(300),random(300));
//draws random lines from points ranging (0-300,0-300,0-300,0-300)
 
 
}
