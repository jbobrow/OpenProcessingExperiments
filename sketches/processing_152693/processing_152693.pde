
size(200,200);
float pitch = 2;
float turns = 3;
float limit = pitch*turns;
int numturn = 100;
int step = 360/numturn;
beginShape();
noFill();
for(int deg=0 ; deg<360*turns ; deg+=step )
{
  float r = pitch * norm(deg,0,360);
  float x = r * cos(radians(deg));
  float y = r * sin(radians(deg));
  
  float x_s = map(x,-limit,limit, 10, 190);
  float y_s = map(y,-limit,limit, 10, 190);
  vertex(x_s,y_s);
}
endShape();


