
float x,y,amp,rad,phases;
float s,phase_speed;
float step,final_phase;
float phase_offset,phase_offset_speed;
int num_pts;

void setup()
{
  phase_offset = 0;
  phase_offset_speed = 0.15;
  amp = 50;
  rad = 200;
  phases = 0;
  s = 0.0;
  phase_speed = 0.0;
  num_pts = 200;
  step = TWO_PI/num_pts;
  size(500,500);
  x = width/2;
  y = height/2;
  
}
void draw()
{
 background(255);
 phase_offset+=phase_offset_speed;
 phases = (sin((frameCount*.005))+1)*5;
fill(0);
stroke(128,0,0);
beginShape();
    for(int i = 0; i <= num_pts;i++)
    {
     float theta = i*step;
     float offset = sin(sin(theta)*phases-phase_offset)*amp;
     float tx = x+ (sin(theta)*(rad+offset));
     float ty = y+(cos(theta)*(rad+offset));
       vertex(tx,ty);
    }
  endShape();
 // rect(0,0,width/2,height);
  fill(255,50);
  beginShape();
    for(int i = 0; i <= num_pts;i++)
    {
     float theta = i*step;
     float offset = cos((sin(theta)+1.3)*phases-phase_offset)*amp;
     float tx = x+ (sin(theta)*(rad+offset));
     float ty = y+(cos(theta)*(rad+offset));
       vertex(tx,ty);
    }
  endShape();
  
}



