
void setup()
{
  size(200,200);
  background(0);
}

void draw()
{
//float pitch sets up the area the spiral goes to
//for example 2 will make a line go to the same x axis twice
//before ending
float pitch = 4;
//float turns sets up the rotations a spiral will do
//before it ends
float turns = 8;
//float limit limits the maximum for the spiral
float limit = pitch*turns;
int numturn = 100;
int step = 360/numturn;
beginShape();
noFill();
for(int deg=0; deg<360*turns; deg+=step)
{
  stroke(color(0,187,102));
  float r = pitch*norm(deg, 0, 360);
  float x = r*cos(radians(deg));
  float y = r*sin(radians(deg));
  
  float x_s = map(x,-limit,limit, 10,190);
  float y_s = map(y,-limit,limit, 10,190);
  vertex(x_s,y_s);
}
endShape();
}


