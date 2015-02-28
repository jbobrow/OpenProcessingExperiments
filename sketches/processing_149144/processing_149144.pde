
size(600,600);
background(0);
noStroke();
float angolo=0;
for (int y=0; y<=height; y+=25) 
{
 for (int x=0; x<=width; x+=25)
 {
 angolo += 0.008;
 resetMatrix();
 translate( x,y );
 rotate( angolo );
 fill(random(255));
 triangle(0,0, 20,20, 0,40);
 }
}


