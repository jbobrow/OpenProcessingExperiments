
void setup() //mode continu
{
 size(400,400); 
 smooth();
 background (0,0,0);
}

void draw()
{

translate (200,200);  //deplacement
//ellipse(0,0,50,50);
float angle = 360.0*float(mouseX) / float(width);
rotate (radians(angle));// rotation dependante de la souris
for (int i=0; i<3; i++)
{

rotate(radians (360/50)); //rotate (PI/3);  //rotation sachant que 180°=PI et 360°=2PI  et 90°=PI/2 dc la on a 60°
fill(0,0,0);
//rect(i*2,0,100,100);
//triangle (i*2,0,100,100,200,200);
//point (i*2,100);

stroke(255,0,0);
line (i*2,0,100,100);
stroke(150,0,0);
line (i*2,0,150,150);
stroke(255,255,255);
line (i*2,0,60,60);

}

}


void mousePressed()
{
 
  saveFrame("monImage-#####.jpg");
}

