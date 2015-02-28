
int WIDTH = 500;
int HEIGHT = 500;

//------ PDE (Partial Differential Equation) parameters begin -------
int gzX = 200;  //Gridsize x
int gzY = 200;  //Gridsize y
int gzT = 1000000;
float c = 2;    //Parameter för pde:n
float dx = 1/((float)gzX);
float dy = 1/((float)gzY);
float dt = 1/((float)gzT);
float a = sq(c)*dt/sq(dx);
float b = sq(2)*dt/sq(dy);

//------ PDE (Partial Differential Equation) parameters end-------

float kx = 2*PI/WIDTH;
float ky = 2*PI/HEIGHT;
float amp = 2;    //Amplitude of the mouse stroke

color[] colors = new color[2000];

float angX = 0;
float angY = 0;
float x1 = -1;
float x2 = 1;
float y1 = -1;
float y2 = 1;
float sx = x1;
float sy = y1;

float mX;
float mY;

float cci;      //current color index
color col;
boolean tg = true;    //toggle color


float h = 5;    //z amplitude for rendering
float g = 200;    //Scale factor for x and y when rendering the verticies, NOT g as in gravity
float incX = (x2 - x1)/gzX;
float incY = (y2 - y1)/gzY;

float[] x = new float[(int)gzX];  //Array with x-values, used when rendering
float[] y = new float[(int)gzY];  //Array with y-values, used when rendering


int lineSpace = 5;  //This signifies how many steps between each rendered line; if 
                    //lineSpace == 2, then we will only render every second line, i.e. skipping one line

boolean keyB = true;

float d = 0;
float damping = 0.05;

float[][] prev = new float[gzX][gzY];  //Arrays to store the amplitude of the surface
float[][] curr = new float[gzX][gzY];  //Prev, Curr and Next is due to the solution method,
float[][] next = new float[gzX][gzY];  // it uses the previos and current surface to calculate the next

//------------------- Setup begin -------------------
void setup() {
  size(WIDTH, HEIGHT, P3D); 
  frameRate(100);
  
  rainbow(true);      //Initiate colors array
  
  if(a > 0.5 || b > 1)                  //Check if the current parameters of the PDE
    println("Stability not ensured!");  // ensures stability with the numeric solution
  
  
  for(int i = 0; i < (int)gzX; i++) {  //Make the x and y axis
    x[i] = sx;
    y[i] = sy;
    sx =  sx + incX;
    sy =  sy + incY;

  }
  
  for(int i = 0; i < gzX; i++) {  //Zero the initial arrays
    for(int j = 0; j < gzY; j++) {
      prev[i][j] = 0;
      curr[i][j] = 0;
     
    } 
  }
  
}
//------------------- Setup end -------------------



//------------------- Draw begin -------------------
void draw() {
  
  
  next = de(curr, prev); 
  for(int i = 0; i < gzX; i++) {
    for(int j = 0; j < gzY; j++) {
      prev[i][j] = curr[i][j];
      curr[i][j] = next[i][j];
    }
  }
  
  //--------- Keyboard stuff begin -----------
  
  if(keyPressed) {
    
    if(key == 'r' && keyB) {
      for(int i = 0; i < gzX; i++) {  //Nolla arrayerna
        for(int j = 0; j < gzY; j++) {
          prev[i][j] = 0;
          curr[i][j] = 0;
        }
      }
    }
    else if(keyCode == RIGHT && keyB)
      damping = damping + 0.001;

    else if(keyCode == LEFT && keyB)
      damping = damping - 0.001;
        
    else if(keyCode == UP && keyB)
      amp = amp + 1;
    
    else if(keyCode == DOWN && keyB)
      amp = amp - 1;
    
    else if(key == 'u' && keyB)
      lineSpace = lineSpace - 1;
   
    else if(key == 'j' && keyB)
      lineSpace = lineSpace + 1;
    
    else if(key == 't' && keyB) {
      tg = !tg;
      rainbow(tg);
    }
    
    else if(key == 'd' && keyB) {
    
      if(d == 0)
        d = 1;
      else if(d == 1)
        d = 0; 
    }
    
    if(lineSpace < 1)
      lineSpace = 1;
    
    if(damping < 0.0)
      damping = 0.0;
    
    if(amp < 1.0)
      amp = 1.0;
      
    keyB = false;
  }
  //--------- Keyboard stuff begin -----------
  
  
  //--------- Mouse stuff begin -----------
  
  mX = ((float)(mouseX))*2.0f/5.0f;
  mY = ((float)(mouseY))*2.0f/5.0f;
  
  if(mX < 1)
    mX = 2;
  if(mX > (gzX-1))
    mX = gzX-3;
    
  if(mY < 1)
    mY = 2;
  if(mY > gzY-1)
    mY = gzY-3;

  if(mousePressed && mouseButton == LEFT) {
    
    curr[(int)mX - 1][ (int)mY ] = amp;
    curr[(int)mX    ][ (int)mY ] = amp;
    curr[(int)mX + 1][ (int)mY ] = amp;
    curr[(int)mX    ][ (int)mY - 1 ] = amp;
    curr[(int)mX    ][ (int)mY + 1 ] = amp;

  }
  
  else if(mousePressed && mouseButton == RIGHT) {
    
    curr[(int)mX - 1][ (int)mY ] = -amp;
    curr[(int)mX    ][ (int)mY ] = -amp;
    curr[(int)mX + 1][ (int)mY ] = -amp;
    curr[(int)mX    ][ (int)mY - 1 ] = -amp;
    curr[(int)mX    ][ (int)mY + 1 ] = -amp;

  }
  
  else if(mousePressed && mouseButton == CENTER) {
 
    angX = mouseY*ky;
    angY = mouseX*kx;

  }
  
  //--------- Mouse stuff end -----------
  
  if(tg)
    background(0);
  else
    background(200);
  
  translate(WIDTH/2, HEIGHT/2);
  rotateY(angY);
  rotateX(angX);

  for(int i = 0; i < (int)(gzX)-1; i = i + lineSpace) {
    
    for(int j = 0; j < (int)(gzY)-1; j++) {
            
      beginShape(LINES);
      vertex(x[i]*g,   y[j]*g,   curr[i][j]*h    );
      vertex(x[i]*g,   y[j+1]*g,   curr[i][j+1]*h    );
      cci = 10*(curr[i][j]+20);
      if(cci < 0)
        cci = 0;
      stroke( colors[ (int)cci] );
      
      endShape();
      
    }
    
  }
  
  for(int i = 0; i < (int)(gzX)-1; i = i + lineSpace) {
    
    for(int j = 0; j < (int)(gzY)-1; j++) {
   
      beginShape(LINES);
      
      vertex(x[j]*g,   y[i]*g,   curr[j][i]*h    );
      vertex(x[j+1]*g,   y[i]*g,   curr[j+1][i]*h    );
      cci = 10*(curr[j][i]+20);
      if(cci < 0)
        cci = 0;
      stroke( colors[ (int)cci] );
      endShape();

    }
  }
  
}
//------------------- Draw end -------------------


float[][] de(float[][] cur, float[][] pre) {  //This is where the magic happens, calculates the next "surface frame"
  int i;
  int j;

  float[][] u = new float[gzX][gzY];
  
    for(i = 2; i < (gzX-1); i++) {
      for(j = 2; j < (gzY-1); j++) {
            
        // -0.04*(curr[i][j] - pre[i][j]) damping part
        
        u[i][j] = -damping*(curr[i][j] - pre[i][j])*d + 2*cur[i][j] - pre[i][j] +
                     a*(  cur[i+1][j] - 2*cur[i][j] + cur[i-1][j] ) + 
                     b*(  cur[i][j+1] - 2*cur[i][j] + cur[i][j-1] );
          
        }
    }

    return u;
  
}

void rainbow(boolean b) {

int index = 0;
int j = 4;
int i = 0;


  if(b) {
    for(i = 0; i < 256; i = i + j) {
      colors[index] = color(255, i, 0);
      index++;
    } 
     
    for(i = 255; i >= 0; i = i - j) {
      colors[index] = color(i, 255, 0);
      index++;
    }
    
    for(i = 0; i < 256; i = i + j) {
      colors[index] = color(0, 255, i);
      index++;    
    }
    
    for(i = 255; i >= 0; i = i - j) {
      colors[index] = color(0, i, 255);
      index++;
    }
    
    for(i = 0; i < 256; i = i + j) {
      colors[index] = color(i, 0, 255);
      index++;
    }
  }
  else {                        //toggle the color array back to black
    for(i = 0; i < 1000; i++)
      colors[i] = 50; 
    
  }
}

void keyReleased() {
  keyB = true; 
}
