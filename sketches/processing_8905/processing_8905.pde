
void setup() 
{

smooth();
size (400,400);
background (255);
frameRate(100);
}

void draw () 
{

pushMatrix();
translate (-50,120);
beginShape();
fill (0);
vertex( 286.0 , 101.0 );
bezierVertex( 286.0 , 101.0 , 234.0 , 97.0 , 195.0 , 131.0 );
bezierVertex( 195.0 , 131.0 , 117.0 , 182.0 , 74.0 , 140.0 );
vertex( 71.0 , 138.0 );
bezierVertex( 71.0 , 138.0 , 92.0 , 178.0 , 135.0 , 178.0 );
bezierVertex( 135.0 , 178.0 , 203.0 , 166.0 , 229.0 , 144.0 );
bezierVertex( 229.0 , 144.0 , 265.0 , 123.0 , 291.0 , 121.0 );
vertex( 289.0 , 119.0 );
vertex( 288.0 , 102.0 );
endShape();
popMatrix();

fill(0);
rect (100,150,200,150);


for ( int i = 0; i < width; i++ )
{

float y1 = map( mouseY,    0, height,    90, 10 );


fill(255);
ellipse (200,250,120,y1); // Mund

}

fill(0);
triangle (100,300,150,300,100,350);

fill(0);
triangle (250,300,300,300,300,350);


fill(0);
ellipse (120,150,80,80);

fill(0);
ellipse (280,150,80,80);

 


for ( int i = 0; i < width; i++ )
{

float x1 = map( mouseX,    0, width,    100, 140 );
float x2 = map( mouseX,    0, width,    270, 300 );


fill(255);
noStroke();
ellipse (x2,150,40,40); //Pupille links

fill(255);
noStroke();
ellipse (x1,150,40,40); // Pupille rechts


}
}


