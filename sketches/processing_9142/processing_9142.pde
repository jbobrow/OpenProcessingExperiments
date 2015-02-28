
 /* author adam schmidt
 athaddius.com
 */
 
 
 /*
 sketch which wotates spheres around each other at
 random  constant velocities drawing a colored point at the center of each
 */
 
 
 
 
 
 //STARTSKETCH STARTSKETCH STARTSKETCH STARTSKETCH STARTSKETCH STARTSKETCH 
 
 //___________________________________________________________
 int o =1;// int for up or down pressed
  int ypos1 = 450; //y CENTER OF circle which is rotated around
  int xpos1 = 450;//x CENTER OF circle which is rotated around
  int i = 0;//variable for a if loop to initiate the circles
  int n = 0;//variable for a if loop to update the circles
  int tl = 1;//clockwise or counterclockwise rotation 1 or 2
    int _radius = 150; //radius of center circle
  circle[] circ = new circle[10];// initiating the circles
  boolean enter = true; //to switch ellipse and point

void setup(){
  size(900,900);// window size
  background(255);//background color
    fill(0,0,0);//black fill
  ellipse(xpos1,ypos1,_radius*2,_radius*2);//draw center circle

  circ[0] = new circle(xpos1,ypos1,_radius,0, tl,1,0,0,0);//initiate class
  frameRate(100);//frames rate
}
void draw(){

  circ[0].update(xpos1,ypos1,_radius,i);//update position

}

class circle {
  float j = 1;// pressed or not
  int t;
    float angle = 0;
  int px, py,pl,pf;
 float radius;
 int n1;
 float r,g,b;
  circle(int _xpos, int _ypos, float __radius,int _n, int tl,float j1,float r1, float g1,float b1){
    pl = _xpos;
    pf = _ypos;
    radius = __radius;
    n1 = _n;
    t = tl;
    j = j1;
    r = r1;
    g = g1;
    b = b1;
  }
void update(int _x,int _y,float _r,int _i){
  i = _i;
  pl = _x;
  pf = _y;
  radius = _r;
    if(t == 1){
  angle = angle + j;

  }else{
    angle = angle - j;
  }
  stroke(0);
  float cos = cos(radians(angle));
  float sin = sin(radians(angle));
       int l = 1;
px = int(radius*1.5*cos+pl);
py = int(radius *1.5*sin+pf);
fill(r,g,b);
stroke(r,g,b);

  if(keyCode == UP){
      enter = true;
  }else if (keyCode == DOWN){
    enter = false;
  }
  if( enter == true){
  

if(o == 1){
      background(0);
}
o = o +1;
l = 1;
 point(px,py);

  }
  if(enter == false){
 
    if(l == 1){
stroke(0);
    if(i == 0){
      background(255);
    }
  ellipse(xpos1,ypos1,_radius*2,_radius*2);

    ellipse(px,py,radius,radius);
    l = l+1;
  }
  o =1;
  }

  n1 = n1 +1;
  if(n1 > 0 && n1 < circ.length-1){
   // if(t== 1){
     // t=t+2;
   // }
   //t = t - 1;
    println("t"+t);
    circ[n1] = new circle(px,py,radius/2,n1,round(random(1,2)),j+(random(.5,3)/2),random(1,255),random(1,255),random(1,255));
           
 
 } 
 i = i+1;
     if(i < circ.length-1 && i >0){

circ[i].update(px,py,radius/2,i);
     }else{
       i = 0;
     }



}
}

