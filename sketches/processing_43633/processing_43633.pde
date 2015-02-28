
//Maximilian Uriarte
//Midterm!
//I'm a huge space nerd, it's true.
//This project is a diagram of our own solar system.
//PLUTO IS NOT A PLANET

float ex,ey,angle,s;
float mx,my;
float vx,vy;
float Mx,My;
float jx,jy;
float sx,sy;
float ux,uy;
float nx,ny;
float ax,ay;
float moonx,moony;
float starSize,starLoc;
//float rs,rv,rd;

void setup(){
  size(900,900);
  smooth();
  ex = 0;
  ey = 0;
  mx = 0;
  my = 0;
  vx = 0;
  vy = 0;
  Mx = 0;
  My = 0;
  jx = 0;
  jy = 0;
  sx = 0;
  sy = 0;
  ux = 0;
  uy = 0;
  nx = 0;
  ny = 0;
  ax = 0;
  ay = 0;
  moonx = 0;
  moony = 0;
  angle = 0;
  s = 1;
  starSize = random(10);
  starLoc = random(900);
   //asteroids
/*/  fill(240);
  
  for(float i = 0; i < 100; i++){
    float rs = random(15);
    float rd = random(230,280);
    float rv = random(.12,.52);
    
    ax = cos(radians(angle*rv)) * rd + width/2;
    ay = sin(radians(angle*rv)) * rd + width/2;
    ellipse(ax,ay,rs,rs);
  }
  /*/
}


void draw(){
  strokeWeight(.5);
  background(0);
  
  //info
  if(mousePressed == true){
    text("Local Solar System",50,50);
    text("Stars: 1",50,75);
    text("Planets: 8 - 4 Solid, 4 Gaseous",50,100);
    text("Dwarf Planets: 5",50,125);
  }

  
  //sun
  fill(255,255,0);
  noStroke();
  ellipse(width/2,height/2,50,50);
  if(mouseX > 425){ //begin rollover info
    if(mouseX < 475){
      if(mouseY > 425){
        if(mouseY < 475){
      noFill();
      stroke(255);
      line(450,450,470,490);
      line(470,490,700,490);
      text("Sun - Class: G2V Yellow Dwarf",475,485);
      text("Diameter - 870,000 Miles",475,505);
      noStroke();
        } 
      }
    }
  }
  if(mousePressed == true){ //sun mouse code
    noFill();
      stroke(255);
      line(450,450,470,490);
      line(470,490,700,490);
      text("Sun - Class: G2V Yellow Dwarf",475,485);
      text("Diameter - 870,000 Miles",475,505);
      noStroke();
  }
  
  //earth
  fill(5,255,23);
  ex = cos(radians(angle++)) * 150 + width/2;
  ey = sin(radians(angle)) * 150 + height/2;
  ellipse(ex,ey,20,20);
  if(mouseX > ex-50){ //begin rollover info
    if(mouseX < ex+50){
      if(mouseY > ey-50){
        if(mouseY < ey+50){
      noFill();
      stroke(255);
      ellipse(width/2,height/2,300,300);
      line(ex,ey,ex+20,ey-10);
      line(ex+20,ey-10,ex+200,ey-10);
      text("Earth - Orbit 1 Earth Year", ex+25,ey-15);
      text("Diameter - 7,926 Miles", ex+25,ey+5);
      noStroke();
        } 
      }
    }
  }
  if(mousePressed == true){ //earth mouse code
          noFill();
      stroke(255);
      ellipse(width/2,height/2,300,300);
      line(ex,ey,ex+20,ey-10);
      line(ex+20,ey-10,ex+200,ey-10);
      text("Earth - Orbit 1 Earth Year", ex+25,ey-15);
      text("Diameter - 7,926 Miles", ex+25,ey+5);
      noStroke();
  }
  
  //earth moon
  fill(250);
  moonx = cos(radians(ex/2)) * 20 + ex;
  moony = sin(radians(ey/2)) * 20 + ey;
  ellipse(moonx,moony,10,10);
  
  
  //mercury
  fill(240);
  mx = cos(radians(angle*4.16)) * 50 + width/2;
  my = sin(radians(angle*4.16)) * 50 + height/2;
  ellipse(mx,my,5,5);
  noFill();
  ellipse(width/2,height/2,50,50);
  if(mouseX > mx-50){
    if(mouseX < mx+50){
      if(mouseY > my-50){
        if(mouseY < my+50){
      noFill();
      stroke(255);
      ellipse(width/2,height/2,100,100);
      line(mx,my,mx+20,my-10);
      line(mx+20,my-10,mx+200,my-10);
      text("Mercury - Orbit .24 Earth Years", mx+25,my-15);
      text("Diameter - 3,031 Miles",mx+25,my+5);
      noStroke();
        } 
      }
    }
  }
  if(mousePressed == true){ //mercury mouse code
          noFill();
      stroke(255);
      ellipse(width/2,height/2,100,100);
      line(mx,my,mx+20,my-10);
      line(mx+20,my-10,mx+200,my-10);
      text("Mercury - Orbit .24 Earth Years", mx+25,my-15);
      text("Diameter - 3,031 Miles",mx+25,my+5);
      noStroke();
  }
  
  //venus
  fill(233,237,41);
  vx = cos(radians(angle*1.63)) * 100 + width/2;
  vy = sin(radians(angle*1.63)) * 100 + height/2;
  ellipse(vx,vy,18,18);
  if(mouseX > vx-50){
    if(mouseX < vx+50){
      if(mouseY > vy-50){
        if(mouseY < vy+50){
      noFill();
      stroke(255);
      ellipse(width/2,height/2,200,200);
      line(vx,vy,vx+20,vy-10);
      line(vx+20,vy-10,vx+200,vy-10);
      text("Venus - Orbit .62 Earth Years", vx+25,vy-15);
      text("Diameter - 7,521 Miles",vx+25,vy+5);
      noStroke();
        } 
      }
    }
  }
  if(mousePressed == true){ //venus mouse code
          noFill();
      stroke(255);
      ellipse(width/2,height/2,200,200);
      line(vx,vy,vx+20,vy-10);
      line(vx+20,vy-10,vx+200,vy-10);
      text("Venus - Orbit .62 Earth Years", vx+25,vy-15);
      text("Diameter - 7,521 Miles",vx+25,vy+5);
      noStroke();
  }
  
  //mars
  fill(183,32,24);
  Mx = cos(radians(angle*.53)) * 200 + width/2;
  My = sin(radians(angle*.53)) * 200 + height/2;
  ellipse(Mx,My,15,15);
  if(mouseX > Mx-50){
    if(mouseX < Mx+50){
      if(mouseY > My-50){
        if(mouseY < My+50){
      noFill();
      stroke(255);
      ellipse(width/2,height/2,400,400);
      line(Mx,My,Mx+20,My-10);
      line(Mx+20,My-10,Mx+200,My-10);
      text("Mars - Orbit 1.8 Earth Years", Mx+25,My-15);
      text("Diameter - 4,220 Miles",Mx+25,My+5);
      noStroke();
        } 
      }
    }
  }
  if(mousePressed == true){ //mars mouse code
    noFill();
      stroke(255);
      ellipse(width/2,height/2,400,400);
      line(Mx,My,Mx+20,My-10);
      line(Mx+20,My-10,Mx+200,My-10);
      text("Mars - Orbit 1.8 Earth Years", Mx+25,My-15);
      text("Diameter - 4,220 Miles",Mx+25,My+5);
      noStroke();
  }
  
 

  //jupiter
  fill(180,157,109);
  jx = cos(radians(angle*.08)) * 300 + width/2;
  jy = sin(radians(angle*.08)) * 300 + height/2;
  ellipse(jx,jy,40,40);
  if(mouseX > jx-50){
    if(mouseX < jx+50){
      if(mouseY > jy-50){
        if(mouseY < jy+50){
      noFill();
      stroke(255);
      ellipse(width/2,height/2,600,600);
      line(jx,jy,jx+20,jy-10);
      line(jx+20,jy-10,jx+200,jy-10);
      text("Jupiter - Orbit 11.86 Earth Years", jx+25,jy-15);
      text("Diameter - 88,700 Miles",jx+25,jy+5);
      noStroke();
        } 
      }
    }
  }
  if(mousePressed == true){ //jupiter mouse code
    noFill();
      stroke(255);
      ellipse(width/2,height/2,600,600);
      line(jx,jy,jx+20,jy-10);
      line(jx+20,jy-10,jx+200,jy-10);
      text("Jupiter - Orbit 11.86 Earth Years", jx+25,jy-15);
      text("Diameter - 88,700 Miles",jx+25,jy+5);
      noStroke();
  }
  
  //saturn
  fill(214,145,6);
  sx = cos(radians(angle*.033)) * 350 + width/2;
  sy = sin(radians(angle*.033)) * 350 + height/2;
  ellipse(sx,sy,30,30);
  noFill();
  stroke(255);
  ellipse(sx,sy,50,25);
  noStroke();
  if(mouseX > sx-30){
    if(mouseX < sx+30){
      if(mouseY > sy-30){
        if(mouseY < sy+30){
      noFill();
      stroke(255);
      ellipse(width/2,height/2,700,700);
      line(sx,sy,sx-20,sy+10);
      line(sx-20,sy+10,sx-250,sy+10);
      text("Saturn - Orbit 29.45 Earth Years", sx-235,sy+5);
      text("Diameter - 74,898 Miles", sx-235,sy+25);
      noStroke();
        } 
      }
    }
  }
  if(mousePressed == true){ //Saturn mouse code
    noFill();
      stroke(255);
      ellipse(width/2,height/2,700,700);
      line(sx,sy,sx-20,sy+10);
      line(sx-20,sy+10,sx-250,sy+10);
      text("Saturn - Orbit 29.45 Earth Years", sx-235,sy+5);
      text("Diameter - 74,898 Miles", sx-235,sy+25);
      noStroke();
  }
  
  //uranus
  fill(73,151,227);
  ux = cos(radians(angle*.011)) * 400 + width/2;
  uy = sin(radians(angle*.011)) * 400 + height/2;
  ellipse(ux,uy,25,25);
  if(mouseX > ux-20){
    if(mouseX < ux+20){
      if(mouseY > uy-20){
        if(mouseY < uy+20){
      noFill();
      stroke(255);
      ellipse(width/2,height/2,800,800);
      line(ux,uy,ux-20,uy+10);
      line(ux-20,uy+10,ux-250,uy+10);
      text("Uranus - Orbit 84.32 Earth Years", ux-235,uy+5);
      text("Diameter - 31,763 Miles", ux-235,uy+25);
      noStroke();
        } 
      }
    }
  }
  if(mousePressed == true){ //Uranus mouse code
    noFill();
      stroke(255);
      ellipse(width/2,height/2,800,800);
      line(ux,uy,ux-20,uy+10);
      line(ux-20,uy+10,ux-250,uy+10);
      text("Uranus - Orbit 84.32 Earth Years", ux-235,uy+5);
      text("Diameter - 31,763 Miles", ux-235,uy+25);
      noStroke();
  }
  
  //neptune
  fill(10,92,250);
  nx = cos(radians(angle*.006)) * 430 + width/2;
  ny = sin(radians(angle*.006)) * 430 + height/2;
  ellipse(nx,ny,25,25);
  if(mouseX > nx-20){
    if(mouseX < nx+20){
      if(mouseY > ny-20){
        if(mouseY < ny+20){
      noFill();
      stroke(255);
      ellipse(width/2,height/2,860,860);
      line(nx,ny,nx-20,ny+10);
      line(nx-20,ny+10,nx-250,ny+10);
      text("Neptune - Orbit 164.79 Earth Years", nx-235,ny+5);
      text("Diameter - 30,775 Miles",nx-235,ny+25);
      noStroke();
        } 
      }
    }
  }
  if(mousePressed == true){ //Neptune Mouse Code
    noFill();
      stroke(255);
      ellipse(width/2,height/2,860,860);
      line(nx,ny,nx-20,ny+10);
      line(nx-20,ny+10,nx-250,ny+10);
      text("Neptune - Orbit 164.79 Earth Years", nx-235,ny+5);
      text("Diameter - 30,775 Miles",nx-235,ny+25);
      noStroke();
  }
  
}
/*/
void asteroid(int ax, int ay){
  float rs = random(15);
  ellipse(ax,ay,rs,rs);
}


class Asteroid {
  float x,y,circleSize;
  int speed
  int distance
  
  Asteroid(float xpos, float ypos, float cSize){
    x = xpos;
    y = ypos;
    circleSize = cSize;
  }
  
  void display(){
    ellipse(x,y,circleSize,circleSize);
  }
  /*/

