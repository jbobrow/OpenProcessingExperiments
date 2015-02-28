
/**
<b>Fluid Dynamics</b>
<p>
Simple fluid dynamics sketch, 
based on <a href="http://www.dgp.toronto.edu/people/stam/reality/Research/pdf/GDC03.pdf" target="_blank">Real-time Fluid Dynamics for Games (PDF)</a> 
and <a href="http://www.plasmapong.com/" target="_blank">Plasma Pong</a>.
</p>
<p>
Left mouse button - click and drag to stir fluid<br>
Right mouse button or shift key and left mouse button - click and drag to add density
</p>
<p>
<b>Controls</b> (click the applet first)<br>
r key - reset<br>
d key - show/hide density (default: show)<br>
v key - show/hide velocity vectors (default: hide)<br>
n key - show/hide normal vectors (default: hide)<br>
g key - show/hide gradient colours (default: hide)<br>
l key - add/remove 3D lighting (default: show)<br>
+ key, - key - increase/decrease fluid viscosity<br>
</p>
<p>
<b>Gradients</b> ('borrowed' from Plasma Pong)<br>
0 key - black to white<br>
1 key - random gradient (press for a new random gradient each time)<br>
2 key - spectrum (rainbow colours)<br>
3 key - 'infrared'<br>
4 key - black body<br>
5 key - neon<br>
6 key - winter<br>
7 key - summer<br>
</p>
<p>
For smoke like effects, try gradient 6 and press l to remove 3D lighting
</p>
*/

int n = 128;          // The size of the calculation grid
int gridSize = n+2;   // Extra grid space for boundary
int pixelSize = 2;    // The size of each grid square on the screen

// I unravelled the 1D arrays from Jos Stam's paper back to 2D arrays, as we don't have compile time macros in Java...
float[][] u = new float[gridSize][gridSize];
float[][] v = new float[gridSize][gridSize];
float[][] uPrev = new float[gridSize][gridSize];
float[][] vPrev = new float[gridSize][gridSize];
float[][] dens = new float[gridSize][gridSize];
float[][] densPrev = new float[gridSize][gridSize];

float viscosity = 0.0001;  // Viscosity of fluid
float dt = 0.2;            // Rate of change
float diff = 0.0001;       // Degree of diffusion of density over time

int prevMouseX;
int prevMouseY;

// Flags for control of display
boolean showDensity = true;
boolean showVelocity = false;
boolean showNormals = false;
boolean showLighting = true;
boolean showGradient = false;

// Flag for drawing velocity or density - shift (or RMB) = density
boolean shiftPressed = false;

Gradient gradient = new Gradient();
color[] gradientColours;
int numGradientColours = 256;  // Use a larger array for better gradient resolution

int densityBrushSize = n/10;   // Size of the density area applied with the mouse
int velocityBrushSize = n/20;  // Ditto velocity
int lineSpacing = n/20;        // Spacing between velocity and normal lines


void setup() {
  size ( n*pixelSize, n*pixelSize, P3D );
  background ( 0 );
  noStroke(); 
  
  gradient.makeDefaultGradient(gradient.DEFAULT_BLACKBODY);
  gradientColours = gradient.makeArrayOfColours(numGradientColours);  
  
  reset();
  
  frameRate(1000);
}

void draw() {
  setForce();
  calculateVelocity(u, v, uPrev, vPrev, viscosity, dt);
  calculateDensity(dens, densPrev, u, v, diff, dt);
  drawField(dens);
}

void reset() {
  initVelocity();
  initDensity();
}

void initField(float[][] f) {
  for ( int i=0; i < gridSize; i++ )
    for ( int j=0; j < gridSize; j++ )
      f[i][j] = 0.0; 
}

void initVelocity() {
  initField(u); 
  initField(v);
  initField(uPrev);
  initField(vPrev);
}

void initDensity() {
  initField(dens);
  initField(densPrev);
}

int ix(int i, int j) {
  return i + j*(n+2); 
}

void addSource ( float[][] x, float[][] s, float dt )
{
  for ( int i=0; i<gridSize; i++ )
    for ( int j=0; j<gridSize; j++ )
      x[i][j] += s[i][j]*dt;
}

void setBnd ( int b, float[][] x ) 
{

  int i;
  for ( i=1; i <= n; i++ ) {
    
    if ( b==1 )  x [0  ][i  ] = -x [1  ][i  ];  else  x [0  ][i  ] = x [1  ][i  ];
    if ( b==1 )  x [n+1][i  ] = -x [n  ][i  ];  else  x [n+1][i  ] = x [n  ][i  ];
    if ( b==2 )  x [i  ][0  ] = -x [i  ][1  ];  else  x [i  ][0  ] = x [i  ][1  ];
    if ( b==2 )  x [i  ][n+1] = -x [i  ][n  ];  else  x [i  ][n+1] = x [i  ][n  ];

  }
  x [0  ][0  ] = 0.5 * ( x [1  ][0  ] + x [0  ][1  ] );
  x [0  ][n+1] = 0.5 * ( x [1  ][n+1] + x [0  ][n  ] );
  x [n+1][0  ] = 0.5 * ( x [n  ][0  ] + x [n+1][1  ] );
  x [n+1][n+1] = 0.5 * ( x [n  ][n+1] + x [n+1][n  ] );

}

void diffuse ( int b, float[][] x, float[][] x0, float diff, float dt ) {
  
  int i, j, k;
  float a = dt * diff * n * n;
  
  for ( k=0; k<20; k++ ) {
    for ( i=1; i <= n; i++ ) {
      for ( j=1; j <= n; j++ ) {
        x[i][j] = (x0[i][j] + a * ( x[i-1][j] + x[i+1][j] + x[i][j-1] + x[i][j+1] ) ) / (1+4*a); 
      }
    }    
    setBnd(b, x);
  }
  
}

void project ( float[][] u, float[][] v, float[][] p, float[][] div ) {
  
  int i, j, k;
  float h;
  
  h = 1.0/n;
  for ( i=1; i<=n; i++ ) {
     for ( j=1; j<=n; j++ ) {
        div [i][j] = -0.5 * h * ( u [i+1][j] - u [i-1][j] + v [i][j+1] - v [i][j-1] );
        p [i][j] = 0;
     }    
  }
  setBnd ( 0, div );
  setBnd ( 0, p );
  
  for ( k=0; k<20; k++ ) {
    for ( i=1; i<=n; i++ ) {
      for ( j=1; j<=n; j++ ) {
        p [i][j] = ( div [i][j] + p [i-1][j] + p [i+1][j] + p [i][j-1] + p [i][j+1] ) / 4; 
      }
    } 
    setBnd ( 0, p );
  }
  
  for ( i=1; i<=n; i++ ) {
    for ( j=1; j<=n; j++ ) {
      u [i][j] -= 0.5 * ( p [i+1][j] - p [i-1][j] ) / h;
      v [i][j] -= 0.5 * ( p [i][j+1] - p [i][j-1] ) / h;
    }    
  }
  setBnd ( 1, u );
  setBnd ( 2, v );
  
}

void advect ( int b, float[][] d, float[][] d0, float[][] u, float[][] v, float dt ) {
  
  int i, j, i0, j0, i1, j1;
  float x, y, s0, t0, s1, t1, dt0;
  
  dt0 = dt*n;
  for ( i=1; i<=n; i++ ) {
    for ( j=1; j<=n; j++ ) {
      x = i - dt0 * u [i][j];
      y = j - dt0 * v [i][j];
      
      x = max (0.5, x);
      x = min (n+0.5, x); 
      
      //i0 = (int)x;
      i0 = floor(x);
      i1 = i0 + 1;
      
      y = max (0.5, y);
      y = min (n+0.5, y);
      
      //j0 = (int)j;
      j0 = floor(y);
      j1 = j0+1;
      
      s1 = x-i0;
      s0 = 1-s1;
      t1 = y-j0;
      t0 = 1-t1;
      
      d [i][j] = s0 * ( t0 * d0 [i0][j0] + t1 * d0 [i0][j1] ) +
                    s1 * ( t0 * d0 [i1][j0] + t1 * d0 [i1][j1] );
    } 
  }
  setBnd ( b, d );
}

void calculateVelocity(float[][] u, float[][] v, float[][] u0, float[][] v0, float visc, float dt) {
  
  addSource ( u, u0, dt );
  addSource ( v, v0, dt );
  
  float[][] tmp;  
  tmp = u;  u = u0;  u0 = tmp;
  tmp = v;  v = v0;  v0 = tmp;
  
  diffuse ( 1, u, u0, visc, dt );
  diffuse ( 2, v, v0, visc, dt );
  
  project ( u, v, u0, v0 );
  
  tmp = u;  u = u0;  u0 = tmp;
  tmp = v;  v = v0;  v0 = tmp;
  
  advect ( 1, u, u0, u0, v0, dt );
  advect ( 2, v, v0, u0, v0, dt );
  
  project ( u, v, u0, v0 );

}

void calculateDensity(float[][] x, float[][] x0, float[][] u, float[][] v, float diff, float dt) {
  float[][] tmp;
  
  addSource ( x, x0, dt );
  tmp = x; x = x0; x0 = tmp;
  diffuse ( 0, x, x0, diff, dt );
  tmp = x; x = x0; x0 = tmp;
  advect ( 0, x, x0, u, v, dt );
}

void drawField(float[][] f) {
  int x,y;
  float s;
  color col;
  
  float ax, ay, az;
  float bx, by, bz;
  float nx=0, ny=0, nz=0;

  float vu, vv;

  float l;

  float lx=0, ly=0, lz=0;
  float vx=0, vy=0, vz=0;
  float hx=0, hy=0, hz=0;

  float ndoth, ndotl;
  
  float w;
  float d;
  
  background(0);

    
  for (y = 1; y <= n; y++ ) {
    for ( x = 1; x <= n; x++ ) {
      
      d = dens[x][y];
      
      if ( showNormals || showLighting ) {
        //ax = 1; 
        //ay = 0; 
        az = d - dens[x+1][y];
        //bx = 0; 
        //by = 1; 
        bz = d - dens[x][y+1];
          
        //nx = ay*bz - az*by;
        //ny = az*bx - ax*bz;
        //nz = ax*by - ay*bx;  
        
        nx = -az;
        ny = -bz;
        nz = 1;
        
        //l = sqrt(nx*nx + ny*ny + nz*nz); if ( l != 0 ) { nx /= l; ny /= l; nz /= l; }
        l = -sqrt(nx*nx + ny*ny + 1); nx /= l; ny /= l; nz /= l;
      }
      
      if ( showDensity ) {
        s = abs(range(numGradientColours * d,0,numGradientColours-1));
        noStroke();
        
        col = gradientColours[int(s)];
        
        if ( showLighting ) {
          /*
          lx = n/2 - x;
          ly = n/2 - y;
          lz = 1000 - 1000*dens[x,y];
          l = sqrt(lx*lx + ly*ly + lz*lz); if ( l != 0 ) { lx /= l; ly /= l; lz /= l; }
          
          vx = n/2 - x;
          vy = n/2 - y;
          vz = n;
          l = sqrt(vx*vx + vy*vy + vz*vz); if ( l != 0 ) { vx /= l; vy /= l; vz /= l; }
          
          lx = 0; ly = 0; lz = 1;
          vx = 0; vy = 0; vz = 1;
          
          hx = (lx + vx)/2;
          hy = (ly + vy)/2;
          hz = (lz + vz)/2;
          l = sqrt(hx*hx + hy*hy + hz*hz); if ( l != 0 ) { hx /= l; hy /= l; hz /= l; }
          
          // ndoth = nx*hx + ny*hy + nz*hz;
          */
          
          ndoth = nz;
          
          w = ((s*512)/numGradientColours) * pow(ndoth, 100000);
          
          col = blendColor ( col, color(w), ADD );
   
        }        
        
        fill ( col );
        rect ( (x-1) * pixelSize, (y-1) * pixelSize, pixelSize, pixelSize );
      }
      
      if ( showVelocity ) {
        if ( (x % lineSpacing) == 0 && (y % lineSpacing) == 0 ) {
          noFill();
          stroke(255,0,0);
          vu = range(500 * u[x][y], -50,50);
          vv = range(500 * v[x][y], -50,50);
          line( (x-1)*pixelSize, (y-1)*pixelSize, (x-1)*pixelSize + vu, (y-1)*pixelSize + vv);
        }
      }
      
      if ( showNormals ) {
        if ( (x % lineSpacing) == 0 && (y % lineSpacing) == 0 ) {
          noFill();
          stroke(255);        
          
          vu = range(500 * nx, -50,50);
          vv = range(500 * ny, -50,50);
          line( (x-1)*pixelSize, (y-1)*pixelSize, (x-1)*pixelSize + vu, (y-1)*pixelSize + vv);
        } 
      }      
    }    
  } 
  
  if ( showGradient ) {
    noStroke();
    for ( int i=0; i < numGradientColours; i++ ) {
      fill(gradientColours[i]);
      rect ( i % width, i / width, 1,10 ); 
    } 
  }
}


void setForce() {
  initField(densPrev);
  initField(uPrev);
  initField(vPrev);
  
  if ( mousePressed ) {
    int x, y;
  
    x = ( mouseX * n ) / ( width ) + 1;
    y = ( mouseY * n ) / ( height ) + 1;
    
    if ( !keyPressed )
      shiftPressed = false;
    
    if ( mouseButton == LEFT && !shiftPressed ) {
      //uPrev [x,y] += (mouseX - prevMouseX); 
      //vPrev [x,y] += (mouseY - prevMouseY);
      
      setForceArea ( uPrev, x, y, mouseX - prevMouseX, velocityBrushSize );
      setForceArea ( vPrev, x, y, mouseY - prevMouseY, velocityBrushSize );
    }
    else {
      //densPrev [x,y] += 5;
      int m = (mouseX - prevMouseX) + (mouseY - prevMouseY);
      setForceArea ( densPrev, x, y, range(abs(m),0,2), densityBrushSize );
    }
  }
  
  prevMouseX = mouseX;
  prevMouseY = mouseY; 

}

float range(float f, float minf, float maxf) {
  return max ( min ( f, maxf ), minf );
}

void setForceArea(float[][] field, int x, int y, float s, float r) {
  
  int i,j, dx, dy;
  float f;
  
  for ( i = int(range(x-r,1,n)); i <= int(range(x+r,1,n)); i++ ) {
    dx = x - i;
    for ( j = int(range(y-r,1,n)); j <= int(range(y+r,1,n)); j++ ) {
      dy = y - j;
      f = 1 - ( sqrt(dx*dx + dy*dy) / r );
      field[i][j] += range(f,0,1) * s;
    }
  } 
  
}


void keyPressed() {
  
  if ( keyCode == 32 ) {
    gradient.makeRandomGradient(4);
    gradientColours = gradient.makeArrayOfColours(numGradientColours);
  }

  if ( key == 'v' )
    showVelocity = !showVelocity;
  
  if ( key == 'n' )
    showNormals = !showNormals;  
  
  if ( key == 'd' )
    showDensity = !showDensity;
    
  if ( key == 'l' )
    showLighting = !showLighting;
    
  if ( key == 'r' )
    reset();
  
  if ( key == '+' )
    viscosity += 0.0001;
  if ( key == '-' )
    viscosity -= 0.0001;
    
  viscosity = max(viscosity, 0);
  
  if ( key >= '0' && key <= '7' ) {
    gradient.makeDefaultGradient(key - '0');
    gradientColours = gradient.makeArrayOfColours(numGradientColours);
  }
  
  if ( key == 'g' )
    showGradient = ! showGradient;
    
  if ( key == 's' )
    save("screenshot-" + year() + month() + day() + hour() + minute() + second() + ".png");
  
  if ( key == CODED )
    if ( keyCode == SHIFT )
      shiftPressed = true;

}

class Gradient {
  
  /*
    Class for generating gradients of arbitrary colours.
    Colours can be positioned to move them closer together or further apart.
    Default and random gradients can be created.
    An array of color objects of any size can be created.
    
    Inspired by Toxi's code here: http://processing.org/discourse/yabb/YaBB.cgi?board=Contribution_Responsive;action=display;num=1051560846
  */
  
  /* Default Gradients - 'borrowed' from http://www.plasmapong.com/ */
  public static final int DEFAULT_BLACK_TO_WHITE = 0;
  public static final int DEFAULT_RANDOM = 1; // makes a new random gradient each time
  public static final int DEFAULT_SPECTRUM = 2;
  public static final int DEFAULT_INFRARED = 3;
  public static final int DEFAULT_BLACKBODY = 4;
  public static final int DEFAULT_NEON = 5;
  public static final int DEFAULT_WINTER = 6;
  public static final int DEFAULT_SUMMER = 7;

  
  private class GradientNode {
    float  location; // placement of this node within the gradient - 0.0 to 1.0
    color  col; // colour of the node
    GradientNode(float l, color c) {
      location = l;
      col = c; 
    }
  }
  
  private GradientNode[] nodes;
  
  Gradient() {
    // create a black to white gradient on construction
    makeDefaultGradient(DEFAULT_BLACK_TO_WHITE);
  }
  
  void addNode(float location, color col) {
    // add a node to the gradient, specifying the location (0.0-1.0) and the colour
    // NOTE HACK colours should be added in ascending order of location - needs to resort the nodes on adding
    
    if ( nodes.length == 0 ) {
      nodes = new GradientNode[1];
      nodes[0] = new GradientNode(location, col); 
    }
    else {
      GradientNode[] newNodes = new GradientNode[nodes.length+1];
      System.arraycopy(nodes,0, newNodes,0, nodes.length);
      newNodes[nodes.length] = new GradientNode(location, col);
      nodes = newNodes; 
    }
  }
  
  void clear() {
    nodes = new GradientNode[0];
  }
  
  void makeDefaultGradient(int defaultGradient) {
  
    clear();
    
    switch ( defaultGradient ) {
      case DEFAULT_BLACK_TO_WHITE:
        addNode ( 0, 0x000000 );
        addNode ( 1, 0xFFFFFF );   
        break;
      case DEFAULT_RANDOM:
        makeRandomGradient(4);
        break;
      case DEFAULT_SPECTRUM:
        addNode ( 0,    0xFF0000 );
        addNode ( 0.25, 0xFFFF00 );
        addNode ( 0.5,  0x00FF00 );
        addNode ( 0.75, 0x00FFFF );
        addNode ( 1,    0x0000FF );
        break;
      case DEFAULT_INFRARED:
        addNode ( 0,    0x000000 );
        addNode ( 1.0/6,0x000080 );
        addNode ( 2.0/6,0x800080 );
        addNode ( 3.0/6,0xFF0000 );
        addNode ( 4.0/6,0xFF8000 );
        addNode ( 5.0/6,0xFFFF00 );
        addNode ( 1,    0xFFFFFF );
        break;
      case DEFAULT_BLACKBODY:
        addNode ( 0,    0x000000 );
        addNode ( 1.0/5,0x0040FF );
        addNode ( 2.0/5,0x00C0FF );
        addNode ( 3.0/5,0xFF4000 );
        addNode ( 4.0/5,0xFFC000 );
        addNode ( 1,    0xFFFFFF );
        break;
      case DEFAULT_NEON:
        addNode ( 0,    0x000000 );
        addNode ( 0.25, 0x3333FF );
        addNode ( 0.5,  0x0099FF );
        addNode ( 0.75, 0xE60080 );
        addNode ( 1,    0xFF00FF );
        break;
      case DEFAULT_WINTER:
        addNode ( 0,    0x4C80FF );
        addNode ( 0.5,  0xE6E6E6 );
        addNode ( 1,    0x999999 );
        break;
      case DEFAULT_SUMMER:
        addNode ( 0,    0x334CFF );
        addNode ( 0.25, 0xFF0080 );
        addNode ( 0.5,  0xFF8033 );
        addNode ( 0.75, 0xCC4C00 );
        addNode ( 1,    0xFFCC00 ); 
        break;       
    }
    
  }
  
  void makeRandomGradient(int numColours) {
    float location, locationMin, locationMax;
    int r,g,b;

    clear();

    for ( int n=0; n < numColours; n++ ) {
      if ( n == 0 )
        location = 0.0;
      else if ( n == numColours-1 )
        location = 1.0;
      else { 
        locationMin = float(n)/numColours;
        locationMax = float(n+1)/numColours;
        location = random ( locationMin, locationMax );
      }

      r = int(random(2.5)) * 128;
      g = int(random(2.5)) * 128;
      b = int(random(2.5)) * 128;
      
      addNode ( location, color(r,g,b) );
    }
  }
  
  color getColour(float location) {
    float bandLocation, bandScale, bandDelta;
    float r,g,b;
    
    for ( int c=0; c < nodes.length-1; c++ ) {
      if ( location >= nodes[c].location && location <= nodes[c+1].location ) {
         bandScale = nodes[c+1].location - nodes[c].location;
         bandLocation = location - nodes[c].location;
         bandDelta = bandLocation / bandScale;

         r = bandDelta * ( red(nodes[c+1].col) - red(nodes[c].col) ) + red(nodes[c].col);
         g = bandDelta * ( green(nodes[c+1].col) - green(nodes[c].col) ) + green(nodes[c].col);
         b = bandDelta * ( blue(nodes[c+1].col) - blue(nodes[c].col) ) + blue(nodes[c].col);
         return color(r,g,b);
      }
    }
    return color(0,0,0);
  }
  
  color[] makeArrayOfColours(int numColours) {
    
    float location, bandLocation, bandScale, bandDelta;
    color[] cols = new color[numColours];
  
    for ( int i=0; i < numColours; i++ ) {
      location = float(i) / (numColours-1);
      cols[i] = getColour(location);
    }
    
    return cols;
  } 
  
}






