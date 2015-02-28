
float merpercent, vp, ep, mp, jp, sp, up,np;
float merradius, vr, er, mr, jr, sr, ur,nr;
float rotatingAngle;
float merx, mery, vx, vy, ex, ey, mx, my, jx, jy, sx, sy, ux, uy,nx,ny; 
float frames; 
color[] bcolor = {#10163C,#2A4550,#164E64,#291664,#0A343E};
int colr;

/*
if(all the circles aren't at their initial points) saveFrame(blalsjdflkw);
else if (all the circles are at their initial points) exit();
*/

void setup() {
  size(800, 800);
  merpercent = vp = ep = mp = jp = sp = up = np = 0; 
  merradius = 155;
  vr = 165;
  er = 195; 
  mr = 210;
  jr = 250;
  sr = 290;
  ur = 330;
  nr = 360; 
  frames = 0; 
  colr = #2A4550;

  
} 


void draw() {
  noStroke();
  if (frames % 1000 == 0){
    int index = int(random(0,bcolor.length)); 
    colr = bcolor[index];
  }
  fill(colr, 10);
  rect(0, 0, 800, 800); 
  
  fill(#FFAF00,40);
  ellipse(width/2, height/2, 150, 150); //sun

  fill(255);
  rotatingAngle = merpercent/88 * TWO_PI;
  merx = width/2 + merradius * cos(rotatingAngle);
  mery = height/2 + merradius * sin(rotatingAngle); 
  ellipse(merx, mery, 5, 5); // mercury 
  merpercent ++; 
  if (merpercent % 88 == 0) {
    merpercent =  0;
  }

  fill(255);
  rotatingAngle = vp/224.7 * TWO_PI;
  vx = width/2 + vr * cos(rotatingAngle);
  vy = height/2 + vr * sin(rotatingAngle); 
  ellipse(vx, vy, 10, 10); // venus 
  vp ++; 
  if (vp % 224.7 == 0) {
    vp =  0;
  }

  fill(255);
  rotatingAngle = ep/365 * TWO_PI;
  ex = width/2 + er * cos(rotatingAngle);
  ey = height/2 + er * sin(rotatingAngle); 
  ellipse(ex, ey, 13, 13); // earth 
  ep ++; 
  if (ep % 365 == 0) {
    ep =  0;
  }

  fill(255);
  rotatingAngle = mp/687 * TWO_PI;
  mx = width/2 + mr * cos(rotatingAngle);
  my = height/2 + mr * sin(rotatingAngle); 
  ellipse(mx, my, 10, 10); // mars
  mp ++; 
  if (mp % 687 == 0) {
    mp =  0;
  }

  fill(255);
  rotatingAngle = jp/4015 * TWO_PI;
  jx = width/2 + jr * cos(rotatingAngle);
  jy = height/2 + jr * sin(rotatingAngle); 
  ellipse(jx, jy, 30, 30); // jupitar
  jp ++; 
  if (jp % 4015 == 0) {
    jp =  0;
  }

  fill(255);
  rotatingAngle = sp/10585 * TWO_PI;
  sx = width/2 + sr * cos(rotatingAngle);
  sy = height/2 + sr * sin(rotatingAngle); 
  ellipse(sx, sy, 25, 25); // saturn
  sp ++; 
  if (sp % 10585 == 0) {
    sp =  0;
  }

  fill(255);
  rotatingAngle = up/30660 * TWO_PI;
  ux = width/2 + ur * cos(rotatingAngle);
  uy = height/2 + ur * sin(rotatingAngle); 
  ellipse(ux, uy, 20, 20); // uranus
  up ++; 
  if (up % 30660 == 0) {
    up =  0;
  }

  fill(255);
  rotatingAngle = np/59860 * TWO_PI;
  nx = width/2 + nr * cos(rotatingAngle);
  ny = height/2 + nr * sin(rotatingAngle); 
  ellipse(nx, ny, 17, 17); // neptune
  np ++; 
  if (np % 59860 == 0) {
    np =  0;
  }
  
//  if (!(merpercent==0 && vp==0 && ep==0 && mp==0))
//    saveFrame("frames/####.png");
//  else exit();
}
