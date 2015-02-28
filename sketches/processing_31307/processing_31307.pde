
/* Triple Helix by Jordan Dozzi
 * Using code from the Processing textbook (pages 118-122, and code 
 * blocks14-08 & 14-09 and implementing
 * trig, for loops, and movement to make a zoomed-in version
 * of a 3-point intersection. The points of contact are the 
 * dot & square sheets that comprise the 3 waves 
 * (sin, cos, and tan) moving in sheets, which end up exhibiting 
 * both constructive and destructive interference patterns.
*/

void setup(){
size(900, 900);
noStroke();
smooth();
frameRate(10);

}
float i;
float offset = 50.0;
float scaleVal = 900;
float angleInc = PI/90.0;
float angle = 0.0;

void draw(){
for (float i = 1; i <= 100; i +=5)
for (int x = 0; x <= width; x += 5) {
float y = offset + (sin(angle) * scaleVal);
fill(255);
ellipse(x, y, 4, 4);
y = offset + (cos(angle) * scaleVal);
fill(0, 50);
rect(x, y, 30, 4);
y = (tan(angle) * scaleVal);
fill(200,0,0, 10);
rect(x,y,5,100);
angle += angleInc;
}
}

