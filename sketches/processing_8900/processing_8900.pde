
/**
 *    aufgabe
 *
 *    http://www.rmx.cz/monsters/
 *
 *    fjenett 20080327
 */

/* zeichne eine monsterrrrr mit den befehlen:
   
   point()
   line()
   triangle()
   quad()
   
   rect()
   ellipse()
   
   curve()
   bezier()
   
   fill() / noFill()
   stroke() / noStroke()
   
   smooth() / noSmooth()
*/
void setup() 
{ 
  size(300,400);
  frameRate(20);
  background(255);
}


void draw()
{
translate(60,0);

ellipseMode(CENTER);
background(255);
fill(0);

line(-60,358,width,358);
stroke(255);

//rotation
float c = map (mouseX, 0, width, 15, 20);
rotate(radians(c));

triangle(130, 120, 100, 280, 50, 200);

//bauch
triangle(170, 90, 140, 250, 100, 80);

//kopf
ellipse(150, 80, 100, 100);

//offenes auge
rect(160, 60, 20, 20);
//drehung auge, pupille
float z = map (mouseX, 0, width, 163,177);
float z2 = map (mouseY, 0, height, 63,77);

fill(255);
ellipse(z,z2,7,7);
stroke(0);

//linker arm
triangle(130, 120, 100, 280, 50, 200);
fill(0);
stroke(255);

//zuenes auge
line(140, 70, 120, 90);



pushMatrix();

float d = map (mouseX, 0, width, 0, 20);
ellipseMode(CORNER);

translate(130,210);

//linkes bein
rotate(radians(d*2));
ellipse(0,20, 40, 100);

//rechtes bein
float e = map (mouseX, 0, width, 10, 0);
ellipseMode(CORNER);
rotate(radians((e*e)-e));
ellipse(0,0, 30, 100);

popMatrix();



if (mousePressed)
{
  fill(255);
  stroke(0);

  beginShape();
    vertex( 132.0 , 94.0 );
    bezierVertex( 146.0 , 106.0 , 166.0 , 67.0 , 177.0 , 119.0 );
    bezierVertex( 177.0 , 119.0 , 140.0 , 155.0 , 130.0 , 95.0 );
  endShape();
}
else
{
//mund
 bezier(130, 100, 170, 140, 160, 90, 200, 130);
}
stroke(0);
} 


