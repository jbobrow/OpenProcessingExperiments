
void setup(){
 size(500,500); 
 frameRate(60);
 background(255,255,255);
}

float cx = 250;
float cy = 195;

short ra = 25;
int ra2 = 0;

float dist = sqrt((mouseX-cx)*(mouseX-cx)+(mouseY-cy)*(mouseY-cy));

short point = 0;

void draw()
{
  stroke(0,0,0);
  fill(0,0,0);
  ellipse(cx,cy,ra,ra);
  dist = sqrt((cx-mouseX)*(cx-mouseX)+(cy-mouseY)*(cy-mouseY));
 
 //Inde i cirkelen.
 if (dist < ra){
   ellipse(cx,cy,ra+10,ra+10);
   ra2 = ra2 + 5;
   point += 1;
   
 }
 
 if (dist < ra+5+ra2) {
   fill(255,255,255);
   stroke(255,255,255);
   ellipse(cx,cy,ra+5,ra+5);
   cx = random(25,475);
   cy = random(25,475);
   fill(0,0,0);
   stroke(0,0,0);
   ellipse(cx,cy,ra,ra); 
  }

}
