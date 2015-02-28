
float kx, ky, dim, dkx, dky, mx, my, dmx, dmy, hx,hy, dhx, dhy;
void setup ( )
{
  size(500,500);
  dkx = 1;
  dky = 1;
  kx = 25;
  ky = 50;
  mx = 175;
  my = 50;
  dmx = 1;
  dmy = 1;
  hx = 350;
  hy = 50;
  dhx = 1;
  dhy = 1;
}
void draw ( )
{
 background (200,50, 90);
 fill(212,1,240);
 rect(kx,ky,30,400);
 fill(100,255,106);
 quad(kx + 25,ky + 225,kx + 25,ky + 250,kx + 75,ky + 200,kx + 125,ky + 400);
 fill(20,60,80);
 quad(kx + 25,ky + 225,kx + 25,ky + 200,kx + 100,ky,kx + 125,ky + 50);
 fill(50,50,30);
 rect(mx,my,30,100);
 fill(90, 180, 145);
 rect(mx + 100,my,30,175);
 fill(100,204,222);
 triangle(mx + 25,my,mx + 75,my + 150,mx + 125,my);
 rect(hx,hy + 150,100,50);
 rect(hx,hy,30,400);
 rect(hx + 100,hy,30,400);
 kx+=dkx;
 if (kx > width - 125  || kx < 10) {
  dkx = -dkx;
 }
 ky+= dky;
 if (ky > height - 400 || ky < 10) {
   dky = - dky;}
 mx+=dmx;
 if (mx > width - 130  || mx < 10) {
  dmx = -dmx;
 }
 my+= dmy;
 if (my > height - 175 || my < 10) {
   dmy = - dmy;}
 hx+=dhx;
 if (hx > width - 130  || hx < 10) {
  dhx = -dhx;
 }
 hy+= dhy;
 if (hy > height - 400 || hy < 10) {
   dhy = - dhy;}
}   

void keyPressed( )
{
   noLoop(); 
}
                     
void keyReleased()
{
   loop();                                                                                                                                                                      
}


