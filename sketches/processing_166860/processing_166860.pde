
size(400,400);
float pitch = 3;
float pitcha = 2;
float turns = 5;
float turnsa = 3;
float limit = pitch*turns;
float limita =pitcha*turnsa;
int numturn = 100;
int step = 360/numturn;
beginShape();
noFill();
stroke(color(255,0,0));
for(int deg=0 ; deg<360*turns ; deg+=step )
{
float r = pitch * norm(deg,0,360);
float x = r * cos(radians(deg));
float y = r * sin(radians(deg));
float x_s = map(x,-limit,limit, 10,190);
float y_s = map(y,-limit,limit, 10,190);
vertex(x_s,y_s);
}
endShape();
beginShape();
noFill();
stroke(color(0,0,255));
for(int deg=0 ; deg<360*turns ; deg+=step )
{
float r = pitcha * norm(deg,0,360);
float x = r * cos(radians(deg));
float y = r * sin(radians(deg));
float x_s = map(x,limita,-limita, 210,360);
float y_s = map(y,limita,-limita, 190,340);
vertex(x_s,y_s);
}
endShape();


