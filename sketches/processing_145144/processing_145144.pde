
//////////////////////////////////
// Fluid
//////////////////////////////////
// copyright: Daniel Erickson 2012
 
float[][] xvels;
float[][] yvels;
float SCALE = 0.09;
float DIFFUSE = 0.4;
float MOUSE_MULTIPLIER = 4;
float SPEED = 10;
int PIXELS = 16;
  
int WIDTH;
int HEIGHT;
  
void setup() {
    noStroke();
    size(300, 300);
    WIDTH = floor(width/PIXELS);
    HEIGHT = floor(height/PIXELS);
    xvels = new float[width][height];
    yvels = new float[width][height];
    for (int x=0; x<width; x++) {
        for (int y=0; y<height; y++) {
            xvels[x][y] = 0;//SPEED*(noise(x*SCALE, y*SCALE)-0.4);
            yvels[x][y] = 0;//SPEED*(noise(x*SCALE, y*SCALE)-0.4);
        }
    }
}
  
float sample(float[][] arr, int x, int y) {
    int w = WIDTH;
    int h = HEIGHT;
    return arr[(x + w) % w][(y + h) % h];
}
  
float sample_surrounding(float[][] arr, float x, float y) {
    float w = WIDTH-1;
    float h = HEIGHT-1;
    x = (x + 3*w) % w;
    y = (y + 3*h) % h;
    int fx = floor(x);
    int fy = floor(y);
    int cx = fx+1;
    int cy = fy+1;
    float wx1 = cx - x;
    float wx2 = x - fx;
    float wy1 = cy - y;
    float wy2 = y - fy;
      
    return  arr[fx][fy] * wx1*wy1 +
            arr[fx][cy] * wx1*wy2 +
            arr[cx][fy] * wx2*wy1 +
            arr[cx][cy] * wx2*wy2;
}
 
float[][] lin_solve(float[][] arr, float wsurrounding) {
    float[][] ret = new float[WIDTH][HEIGHT];
    float wcenter = 1.0-(wsurrounding*4);
    for (int x=0; x<WIDTH; x++) {
        for (int y=0; y<HEIGHT; y++) {
            ret[x][y] = wcenter*sample(arr, x, y) +
                          wsurrounding*sample(arr, x, y-1) +
                          wsurrounding*sample(arr, x, y+1) +
                          wsurrounding*sample(arr, x-1, y) +
                          wsurrounding*sample(arr, x+1, y);
        }
    };
    return ret;
}
 
float[][] diffuse(float[][] arr, float dt) {
    return lin_solve(arr, dt*DIFFUSE);
}
 
void project(float[][] xarr, float[][] yarr, float dt) {
    float[][] proj = new float[WIDTH][HEIGHT];
      
    for (int x=0; x<WIDTH; x++) {
        for (int y=0; y<HEIGHT; y++) {
            proj[x][y] = -0.5 * ((sample(xarr, x+1, y) - sample(xarr, x-1, y)) +
                                 (sample(yarr, x, y+1) - sample(yarr, x, y-1)));
        }
    }
     
    proj = lin_solve(proj, 0.1);
      
    for (int x=0; x<WIDTH; x++) {
        for (int y=0; y<HEIGHT; y++) {
            xarr[x][y] += -0.5 * (sample(proj, x+1, y) - sample(proj, x-1, y));
            yarr[x][y] += -0.5 * (sample(proj, x, y+1) - sample(proj, x, y-1));
        }
    }
}
  
void update(float dt) {
    float[][] xvels1 = new float[WIDTH][HEIGHT];
    float[][] yvels1 = new float[WIDTH][HEIGHT];
      
    xvels = diffuse(xvels, dt);
    yvels = diffuse(yvels, dt);
     
    project(xvels, yvels, dt);
      
    // advect
    for (int x=0; x<WIDTH; x++) {
        for (int y=0; y<HEIGHT; y++) {
            xvels1[x][y] = sample_surrounding(xvels, (float)x-xvels[x][y]*dt*SPEED, (float)y-yvels[x][y]*dt*SPEED);
            yvels1[x][y] = sample_surrounding(yvels, (float)x-xvels[x][y]*dt*SPEED, (float)y-yvels[x][y]*dt*SPEED);
        }
    }
     
    project(xvels1, yvels1, dt);
      
    xvels = xvels1;
    yvels = yvels1;
}
  
int old_mousex;
int old_mousey;
void draw() {
    int mousex = floor((mouseX-1) / PIXELS);
    int mousey = floor((mouseY-1) / PIXELS);
    if (mousex == old_mousex && mousey == old_mousey) {
        old_mousex = 0;
        old_mousey = 0;
    } else {
        if (old_mousex > 0 && old_mousey > 0 &&
            mousex < WIDTH && mousey < HEIGHT) {
          xvels[mousex][mousey] = MOUSE_MULTIPLIER * (mousex - old_mousex);
          yvels[mousex][mousey] = MOUSE_MULTIPLIER * (mousey - old_mousey);
        }
        old_mousex = mousex;
        old_mousey = mousey;
    }
     
    update(0.1);
    
    for (int x=0; x<WIDTH; x++) {
        for (int y=0; y<HEIGHT; y++) {
            fill(100.0*(abs(yvels[x][y])+abs(xvels[x][y])));
            rect(x*PIXELS, y*PIXELS, (x+1)*PIXELS, (y+1)*PIXELS);
        }
    }
}

