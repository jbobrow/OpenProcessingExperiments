
float angle;
 
void setup()
{
size(600,600);
}
 
void draw()
{
background(0);
angle += 0.007;  
strokeWeight(25);
stroke(0);
fill(255);
 
translate(width/2,height/2);
 
for (int i=0; i<100; i++){
   
rotate(angle);
scale(0.9);
ellipseMode(CENTER);
ellipse(10,10,600,600);
}

}

