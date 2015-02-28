
void draw()
{
size(500,500);
 
background(255);
 
arc(250,250,90,90,-PI/2,second()*2*PI/60-PI/2);
 
arc(250,250,60,60,-PI/2,minute()*2*PI/60-PI/2);
 
arc(250,250,30,30,-PI/2,hour()*2*PI/60-PI/2);
}
