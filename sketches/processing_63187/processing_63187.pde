
//Fuzzy flowers inverse
//******************
// Original Rose graphics
// by Mar Canet
//******************

float longitude = 40.0f;
float theta = radians(30);
float theta2 = radians(30);
int k = 11;

void setup()
{
  size(920,1080);
  background(0);
  frameRate(6);
   ellipseMode(CENTER);
    strokeWeight(5);

  
}

  
  void draw()
{
translate(random(width),random(height));
   k = ((int)random(15)) +5;
   
 
 float randomR = random(255);
 float randomG = random(255);
 float randomB = random(255);
 int forLimit = floor(TWO_PI/0.01);
 
   for ( int i = 1; i < forLimit; i ++ ) {
    
     theta2 += 0.06;
     if( theta2 >=TWO_PI ) theta2 = 0;
     theta +=0.01;
     if( theta >=TWO_PI ) theta = 0;
   
     float r = longitude * cos( k*theta );
     float x = r * cos(theta2);
     float y = r * sin(theta2);
   
     randomR += random(-2,2);
  randomG += random(-2,2);
   randomB += random(-2,2);
  
 stroke(randomR,randomG,randomB,60);
    line(x,y,2*x,2*y);
    }
   // center flower
   fill(random(255),random(255),random(255));
   int ellipseSize = (int)random(longitude/3)+5;
    ellipse(0,0,ellipseSize,ellipseSize);
  }
  //===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
