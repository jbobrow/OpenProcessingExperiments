
void setup()
{
  size( 1800, 1000);
  background( 0 );

float xnoise =0.0;
float ynoise = 0.0;
float inc = 0.01;

colorMode( HSB, 360, 100, 100, 100);

for (int y = 0; y < height; y++){
  for( int x = 0; x < width; x++){
    float gray= noise(xnoise, ynoise) * 255;
    stroke(gray);
    point( x, y );
    xnoise = xnoise + inc;
  }
  xnoise= 0.0;
  ynoise += inc;
  }
 noStroke();
 fill( 250, 90, 100, 30);
 rect(0, 0, width, height);
 
 for( int i = 0; i < 100; i++)
 {
   stroke(70, 100, 100);
   int x = (int)random(1800);
   int y = (int)random(1000);
   line( x, y-1, x, y+2);
   line( x-1, y, x+1, y);
   
 }
 noFill();
  for( int i = 100; i < 200; i+=3)
  {
  stroke(random(255), 90, 90, 80);  //150�i�M�w���, �ո� 50, 100,  150 
    strokeWeight(i % 2);
//  line(0, i+400, 800, random(30)+400+i );
  bezier(0, i+400, 300, i+350, 1100, i+350, 1800, random(30)+400+i);
  }
 
 PFont font = loadFont("TwCenMT-Regular-48.vlw");
 fill(70, 100, 100);
 textFont(font);
 text("Techs & Apps of Digital Contents", 1000, 800);
 ellipseMode(RADIUS);
 noFill();
 for( int i = 0; i < 400; i+= 20)
 {
   int radius = (int)random(300)+i;
   stroke(255, 20);
   strokeWeight( random(5) );
   ellipse(i, 250, radius, radius);
 }
 String[] strx = new String[10];
 strx[0] = "Web";
 strx[1] = "Digital Archive";
 strx[2] = "e-Learning";
 strx[3] = "Digital Game";
 strx[4] = "Information Retrival";
 strx[5] = "Data Mining";
 strx[6] = "Service Science";
 strx[7] = "Cloud Computing";
 strx[8] = "Network";
 strx[9] = "Marketing";

 font = loadFont("BerlinSansFB-Reg-48.vlw");
 textFont(font);
 for(int i = 0; i < 10; i++)
 {
   fill(random(250), 100, 100, 60);
   textSize(110);
   text(strx[i], (i * 200)%1300, random(800) );
 }
 
}
  

