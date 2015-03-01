
size(200,200);
ellipseMode(CENTER);
fill(0,255,255);
ellipse(100,100,90,90);
float pitch = 80;
float turns = 7;
float limit = pitch*turns;
int numturn = 100;
int step = 720/numturn;
beginShape();
fill(255,255,0,120);
for(int deg=0 ; deg<360*turns ; deg+=step )
{
float r = pitch * norm(deg,0,720);
float x = r * cos(radians(deg));
float y = r * sin(radians(deg));
float x_s = map(x,-limit,limit, 10,190);
float y_s = map(y,-limit,limit, 10,190);
vertex(x_s,y_s);
}
endShape();


