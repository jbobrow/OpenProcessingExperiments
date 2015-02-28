
/*
Springs in Two Dimensions

I took the spring lattice from the last big project,
optimized the and cleaned up the code, and added in a 
parameter slider.

Kind of a cop out, but I wanted to get cracking on the next
assignment.

I put in an abnormal amount of commenting, in case anyone
wants to see how it works and implement a similar system.

-Max
*/

//Objects in the global environment
Lattice omega = null;
Slider controls = null;

//Global Parameters
float weight_radius = 25;
float stiffness = 0.01;
float dampening = 0.97;
int corner_radius = 100;
int num_loops = 10;

//Global data caches
int hr;
int dr;
int num_truss_loops;

void setup()
{
 size(500,550);
 omega = new Lattice(0, 0, 500, even_grid());
 controls = new Slider(250,525,275,30);
 rectMode(CENTER);
 hr = corner_radius>>1;
 dr = corner_radius<<1;
 num_truss_loops = (int)((float)num_loops*(sqrt(2.0)+0.5));
}

void draw()
{
 //clear the screen
 background(185,185,200);
 //update the objects
 controls.update();
 omega.update();
 //draw the backdrop
 fill(0);
 rect(hr, hr, corner_radius, corner_radius);
 rect(500-hr, hr, corner_radius, corner_radius);
 rect(hr, 500-hr, corner_radius, corner_radius);
 rect(500-hr, 500-hr, corner_radius, corner_radius);
 fill(185,185,200);
 ellipse(corner_radius, corner_radius, dr, dr);
 ellipse(500-corner_radius, corner_radius, dr, dr);
 ellipse(corner_radius, 500-corner_radius, dr, dr);
 ellipse(500-corner_radius, 500-corner_radius, dr, dr);
 //draw the springs
 omega.render();
 fill(0);
 rect(250,525,500,50);
 //draw the slider
 controls.render();
}

/* 
I have courier mouse functions, so that internal class
mechanisms can respond to the mouse
*/

void mousePressed()
{
 omega.mouseDown();
 controls.mouseDown();
}

void mouseReleased()
{
 omega.mouseUp();
 controls.mouseUp();
}


/************************************************************************************
 ** Slider Class                                                                   **
 ************************************************************************************/
class Slider
{
 int center_x, center_y, range_len, ctrl_height;
 float pos;
 boolean dragging;
 PFont meta;

Slider(int x, int y, int w, int h)
  {
    center_x = x;
    center_y = y;
    range_len = w;
    ctrl_height = h;
    pos = 0.0;
    meta = loadFont("Meta-Bold.vlw.gz");
    textFont(meta,35);
    textAlign(CENTER);
    stiffness = (1.0+pos)/30.0;
    dampening = 1.0 - (1.0+pos)/20.0;
    num_loops = (int)(5.0+(1.0/15.0 - stiffness)*225.0+0.5);
    num_truss_loops = (int)((float)num_loops*(sqrt(2.0)+0.5));
  }

  void render()
  {
    noStroke();
    fill(80,80,180);
    rect(center_x, center_y, range_len,5);
    fill(255);
    text("stiffness",center_x, center_y+8);
    fill(255, 255,0, 200);
    rect(center_x + range_len*0.5*pos, center_y, 10, ctrl_height);
    
  }

  void update()
  {
    //only changes when we're dragging it
    if (dragging)
    {
      pos = 2*(mouseX - center_x)/(float)range_len;
      pos = min(pos,1.0);
      pos = max(pos,-1.0);
      stiffness = (1.0+pos)/25.0;
      dampening = 1.0 - (1.0+pos)/20.0;
      num_loops = (int)(5.0+(1.0/15.0 - stiffness)*225.0+0.5);
      num_truss_loops = (int)((float)num_loops*(sqrt(2.0)+0.5));
    }
  }
     
  void mouseDown()
  {
     if (hovering())
    {
      dragging = true;
    }
  }

  void mouseUp()
  {
    dragging = false;
  }

  boolean hovering()
  {
    //encapsulating otherwise cryptic code
    return ( abs(mouseX - (center_x+range_len*0.5*pos)) <= 5 ) &&
           ( abs(mouseY - center_y) <= ctrl_height/2.0 );
  }
}



/************************************************************************************
 ** Spring Lattice Class                                                           **
 ************************************************************************************/

class Lattice
{
 Lattice(float position_x, float position_y, float dim, Point[][] input)
 //Invariant: Only accepts a square matrix
 {
   //Set lattice dimensions
   position = new Point(position_x, position_y);
   dimension = dim;
   select_x = -1;
   select_y = -1;
   dragging = false;

   int r,c;
   int len = input.length;
   float spc = dimension/(float)(len+1);

   state = new Node[len][len];
   prev = new Point[len][len];

   for (r=0; r<len; r++)
   for (c=0; c<len; c++)
   {
     //Copy the input into the current state
     state[r][c] = new Node();
     state[r][c].x = input[r][c].x;
     state[r][c].y = input[r][c].y;
   }
   for (r=0; r<len; r++)
   for (c=0; c<len; c++)
   {
     //Set spring lengths to match the input data
     if (r == 0) state[r][c].north = fdist(state[r][c].x, state[r][c].y, (c+1)*spc, 0.0);
     else state[r][c].north = fdist(state[r][c].x, state[r][c].y, state[r-1][c].x, state[r-1][c].y);
     if (r == len-1) state[r][c].south = fdist(state[r][c].x, state[r][c].y, (c+1)*spc, dimension);
     else state[r][c].south = fdist(state[r][c].x, state[r][c].y, state[r+1][c].x, state[r+1][c].y);
     if (c == 0) state[r][c].west = fdist(state[r][c].x, state[r][c].y, 0.0, (r+1)*spc);
     else state[r][c].west = fdist(state[r][c].x, state[r][c].y, state[r][c-1].x, state[r][c-1].y);
     if (c == len-1) state[r][c].east = fdist(state[r][c].x, state[r][c].y, dimension, (r+1)*spc);
     else state[r][c].east = fdist(state[r][c].x, state[r][c].y, state[r][c+1].x, state[r][c+1].y);
     state[r][c].velocity_x = 0.0;
     state[r][c].velocity_y = 0.0;

     if ( r>0 && c>0 )
       state[r][c].truss_nw = fdist(state[r][c].x, state[r][c].y, state[r-1][c-1].x, state[r-1][c-1].y);
     if ( r<(len-1) && c<(len-1) )
       state[r][c].truss_se = fdist(state[r][c].x, state[r][c].y, state[r+1][c+1].x, state[r+1][c+1].y);
   }
 }

 void mouseDown()
 {
   if (select_x >= 0)
     dragging = true;
 }

 void mouseUp()
 {
   if (dragging)
     dragging = false;
 }

 void update()
 {
   int r, c, len = state.length;

   if (dragging)
   {
     state[select_x][select_y].x = mouseX;
     state[select_x][select_y].y = mouseY;
   }
   else
     select_x = select_y = -1;

   for (r=0; r<len; r++)
   for (c=0; c<len; c++)
   {
     //Highlight hovered weight
     if (!dragging)
     if (fdist(state[r][c].x, state[r][c].y, (float)mouseX, (float)mouseY ) <= 0.8*weight_radius)
     {
       select_x = r;
       select_y = c;
     }
     //cache previous lattice
     prev[r][c] = new Point(state[r][c].x, state[r][c].y);
   }

   //calculate forces on each node
   float force_x, force_y, north, south, east, west, truss_se, truss_nw;
   float spc = dimension/(float)(len+1);

   for (r=0; r<len; r++)
   for (c=0; c<len; c++)
   {
     if (dragging && select_x == r && select_y == c)
     {
       state[select_x][select_y].velocity_x = 0.0;
       state[select_x][select_y].velocity_y = 0.0;
       continue;
     }
     //compute n,s,e,w displacements
     if (r == 0) north = fdist(prev[r][c].x, prev[r][c].y, (c+1)*spc, 0.0);
     else north = fdist(prev[r][c].x, prev[r][c].y, prev[r-1][c].x, prev[r-1][c].y);
     if (r == len-1) south = fdist(prev[r][c].x, prev[r][c].y, (c+1)*spc, dimension);
     else south = fdist(prev[r][c].x, prev[r][c].y, prev[r+1][c].x, prev[r+1][c].y);
     if (c == 0) west = fdist(prev[r][c].x, prev[r][c].y, 0.0, (r+1)*spc);
     else west = fdist(prev[r][c].x, prev[r][c].y, prev[r][c-1].x, prev[r][c-1].y);
     if (c == len-1) east = fdist(prev[r][c].x, prev[r][c].y, dimension, (r+1)*spc);
     else east = fdist(prev[r][c].x, prev[r][c].y, prev[r][c+1].x, prev[r][c+1].y);

     //compute the diagonal truss's displacement
     truss_nw = 0;
     truss_se = 0;
     if (r>0 && c>0) truss_nw = fdist(prev[r][c].x, prev[r][c].y, prev[r-1][c-1].x, prev[r-1][c-1].y);
     if (r<len-1 && c<len-1) truss_se = fdist(prev[r][c].x, prev[r][c].y, prev[r+1][c+1].x, prev[r+1][c+1].y);

     north-=state[r][c].north;
     south-=state[r][c].south;
     west-=state[r][c].east;
     east-=state[r][c].west;
     truss_se-=state[r][c].truss_se;
     truss_nw-=state[r][c].truss_nw;

     //hooke's law
     north *= stiffness;
     south *= stiffness;
     east  *= stiffness;
     west  *= stiffness;
     truss_se *= stiffness;
     truss_nw *= stiffness;

     //break up the componenets of the force
     force_x = 0.0;
     force_y = 0.0;
     if (r == 0) force_y += y_component(north, (c+1)*spc - prev[r][c].x, 0.0 - prev[r][c].y);
     else force_y += y_component(north, prev[r-1][c].x - prev[r][c].x, prev[r-1][c].y - prev[r][c].y);
     if (r == len-1) force_y += y_component(south, (c+1)*spc - prev[r][c].x, dimension - prev[r][c].y);
     else force_y += y_component(south, prev[r+1][c].x - prev[r][c].x, prev[r+1][c].y - prev[r][c].y);
     if (c == 0) force_x += x_component(west, 0.0 - prev[r][c].x, (r+1)*spc - prev[r][c].y);
     else force_x += x_component(west, prev[r][c-1].x - prev[r][c].x, prev[r][c-1].y - prev[r][c].y);
     if (c == len-1) force_x += x_component(east, dimension - prev[r][c].x, (r+1)*spc - prev[r][c].y);
     else force_x += x_component(east, prev[r][c+1].x - prev[r][c].x, prev[r][c+1].y - prev[r][c].y);

     //truss forces
     if (r>0 && c >0)
     {
       force_x += x_component(truss_nw,prev[r-1][c-1].x-prev[r][c].x,prev[r-1][c-1].y-prev[r][c].y);
       force_y += y_component(truss_nw,prev[r-1][c-1].x-prev[r][c].x,prev[r-1][c-1].y-prev[r][c].y);
     }

     if (r<len-1 && c<len-1)
     {
       force_x += x_component(truss_se,prev[r+1][c+1].x-prev[r][c].x,prev[r+1][c+1].y-prev[r][c].y);
       force_y += y_component(truss_se,prev[r+1][c+1].x-prev[r][c].x,prev[r+1][c+1].y-prev[r][c].y);
     }

     //apply the components of the force to each node's velocity, and update position
     state[r][c].velocity_x += force_x;
     state[r][c].velocity_y += force_y;
     state[r][c].velocity_x *= dampening;
     state[r][c].velocity_y *= dampening;
     state[r][c].x += state[r][c].velocity_x;
     state[r][c].y += state[r][c].velocity_y;
   }

   //update the selection blinker parameter
   iota += PI/35.0;
 }


 void render()
 {
   int r, c, len = state.length;
   float spc = dimension/(float)(len+1);
   ellipseMode(CENTER);

   //Draw Springs
   noFill();
   stroke(150,150,150);
   for (r=0; r<len; r++)
   for (c=0; c<len; c++)
   {
     if (r == 0) spring_line(state[r][c].x, state[r][c].y, (c+1)*spc, 0.0, num_loops);
     if (c == 0) spring_line(state[r][c].x, state[r][c].y, 0.0, (r+1)*spc, num_loops);
     if (r == len-1) spring_line(state[r][c].x, state[r][c].y, (c+1)*spc, dimension, num_loops);
     if (c == len-1) spring_line(state[r][c].x, state[r][c].y, dimension, (r+1)*spc, num_loops);
     if (r < len-1) spring_line(state[r][c].x, state[r][c].y, state[r+1][c].x, state[r+1][c].y, num_loops);
     if (c < len-1) spring_line(state[r][c].x, state[r][c].y, state[r][c+1].x, state[r][c+1].y, num_loops);
     if (r<len-1 && c<len-1) spring_line(state[r][c].x, state[r][c].y, state[r+1][c+1].x, state[r+1][c+1].y, num_truss_loops);
   }

   //Draw Weights
   noStroke();
   fill(0);
   for (r=0; r<len; r++)
   for (c=0; c<len; c++)
     ellipse(state[r][c].x+position.x, state[r][c].y+position.y, weight_radius, weight_radius);

   //Draw Highlight
   if (select_x >= 0)
   {
     noStroke();
     fill(0,255*(0.8+0.2*sin(iota)),0);
     ellipse(state[select_x][select_y].x, state[select_x][select_y].y, weight_radius, weight_radius);
   }
 }
 
 void spring_line(float x1, float y1, float x2, float y2, int loops)
 {
   //draw a spring along the give line with the given number of loops
   float angle = atan2(x1-x2,y2-y1);
   float len = fdist(x1,y1,x2,y2);
   float max_theta = loops*TWO_PI;
   float theta, iota, phi=4.0;
   pushMatrix();
   translate(x1,y1);
   rotate(angle);
   noFill();
   beginShape();
   for ( theta=0.0; theta<=max_theta; theta+=PI/12.0 )
     vertex(phi*sin(theta),(theta/max_theta)*len+phi*cos(theta));
   endShape();
   popMatrix();
 }

 //Lattice Dimension Properties
 Point position;
 float dimension;

 //State variables
 Node[][] state;
 Point[][] prev;
 int select_x, select_y;
 boolean dragging;
 float iota;

 //Helper functions:
 float fdist( float x0, float y0, float x1, float y1 )
 //fast distance
 {
   float dx = abs(x1-x0);
   float dy = abs(y1-y0);
   float mn, mx, approx;
   mx = max(dx,dy);
   mn = min(dx,dy);
   approx = ( mx * 1007.0 ) + ( mn * 441.0 );
   if ( mx < ( mn * 16.0 ))
     approx -= ( mx * 40.0 );
   return approx/1024.0;
 }

 float x_component( float r, float dx, float dy )
 //x component along the vector d
 {
   if ( dx == 0 )
     return 0;
   return r * (dx/fdist(0.0,0.0,dx,dy));
 }

 float y_component( float r, float dx, float dy )
 //y component along the vector d
 {
   if ( dy == 0 )
     return 0;
   return r * (dy/fdist(0.0,0.0,dx,dy));
 }
}

/************************************************************************************
 ** Lattice Helper Classes                                                         **
 ************************************************************************************/
class Node
{
 float x,y;      //Stable coordinate for the node
 float north,south,east,west;  //Spring Lengths around the node
 float truss_nw, truss_se;
 float velocity_x, velocity_y;
}

class Point
{
 Point(float u, float v)
 {
   x=u;
   y=v;
 }
 float x,y;
}

Point PNT(float x, float y)
{
 return new Point(x,y);
}

Point[][] even_grid()
{
  return new Point[][]{ {PNT(100,100), PNT(200,100), PNT(300,100), PNT(400,100)},
                        {PNT(100,200), PNT(200,200), PNT(300,200), PNT(400,200)},
                        {PNT(100,300), PNT(200,300), PNT(300,300), PNT(400,300)},
                        {PNT(100,400), PNT(200,400), PNT(300,400), PNT(400,400)}};
}

