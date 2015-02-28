
//////////////////////////////////
// Bus Tops Fluid
//////////////////////////////////
// copyright: Daniel Erickson 2012
float[][] xvels;
float[][] yvels;
float[][] dens;
float SCALE = 0.09;
float DIFFUSE = 0.001;
float MOUSE_MULTIPLIER = 4;
float SPEED = 5;
float DENSITY_SPEED = 20;
int PIXELS = 2;
int WIDTH;
int HEIGHT;

PVector[] ball_pos;
PVector[] ball_vel;
int N = 20;
void setup() {
    //do not change, this is fixed for LED screens.
    size(512, 160);
    //do not change, this is the refresh rate of LEDs.
    frameRate(8);
    
    noStroke();
 
    WIDTH = width/PIXELS;
    HEIGHT = height/PIXELS;
    xvels = new float[WIDTH][HEIGHT];
    yvels = new float[WIDTH][HEIGHT];
    dens = new float[WIDTH][HEIGHT];
    for (int x=0; x<WIDTH; x++) {
        for (int y=0; y<HEIGHT; y++) {
            xvels[x][y] = 0;
            yvels[x][y] = 0;
            dens[x][y] = 0;
        }
    }
    
    ball_pos = new PVector[N];
    ball_vel = new PVector[N];
    for (int i=0; i<N/2; i++) {
        float velx = random(-1, 1);
        float vely = random(-1, 1);
        ball_pos[i] = new PVector(random(WIDTH), random(HEIGHT));
        ball_vel[i] = new PVector(velx, vely);
        ball_vel[i].normalize();
        ball_pos[i+N/2] = new PVector(random(WIDTH), random(HEIGHT));
        ball_vel[i+N/2] = new PVector(-velx, -vely);
        ball_vel[i+N/2].normalize();
    }
}

void draw() {
    background(0); //keep background black (LEDs are brightness based)
    fill(255,0,0);   //LEDs are on the scale of red
    
    /*for(int i=0; i<3; i++) {
      int x = (int)random(WIDTH);
      int y = (int)random(HEIGHT);
      dens[x][y] += 10;
      xvels[x][y] = random(-5, 5);
      yvels[x][y] = random(-5, 5);
    }*/
    for (int i=0; i<N; i++) {
        PVector ball = ball_pos[i];
        PVector vel = ball_vel[i];
        ball.add(vel);
        if (ball.x < 0) {
            ball.x += WIDTH;
        }
        if (ball.x >= WIDTH) {
            ball.x -= WIDTH;
        }
        if (ball.y < 0) {
            ball.y += HEIGHT;
        }
        if (ball.y >= HEIGHT) {
            ball.y -= HEIGHT;
        }
        dens[(int)ball.x][(int)ball.y] = 3;
        xvels[(int)ball.x][(int)ball.y] = vel.x*3;
        yvels[(int)ball.x][(int)ball.y] = vel.y*3;
    }
    
    update(0.3);
    
    for (int x=0; x<WIDTH; x++) {
        for (int y=0; y<HEIGHT; y++) {
            fill(255.0*dens[x][y], 0, 0);
            rect(x*PIXELS, y*PIXELS, (x+1)*PIXELS, (y+1)*PIXELS);
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

float[][] lin_solve(float[][] arr, float wsurrounding, float drag) {
    float[][] ret = new float[WIDTH][HEIGHT];
    float wcenter = drag-(wsurrounding*4);
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

float[][] diffuse(float[][] arr, float dt, float drag) {
    return lin_solve(arr, dt*DIFFUSE, drag);
}

void project(float[][] xarr, float[][] yarr, float dt) {
    float[][] proj = new float[WIDTH][HEIGHT];
     
    for (int x=0; x<WIDTH; x++) {
        for (int y=0; y<HEIGHT; y++) {
            proj[x][y] = -0.5 * ((sample(xarr, x+1, y) - sample(xarr, x-1, y)) +
                                 (sample(yarr, x, y+1) - sample(yarr, x, y-1)));
        }
    }
    
    proj = lin_solve(proj, 0.1, 1);
     
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
    float[][] dens1 = new float[WIDTH][HEIGHT];
     
    xvels = diffuse(xvels, dt, 0.995);
    yvels = diffuse(yvels, dt, 0.995);
    dens = diffuse(dens, dt, 0.98);
    
    project(xvels, yvels, dt);
     
    // advect
    for (int x=0; x<WIDTH; x++) {
        for (int y=0; y<HEIGHT; y++) {
            xvels1[x][y] = sample_surrounding(xvels, (float)x-xvels[x][y]*dt*SPEED, (float)y-yvels[x][y]*dt*SPEED);
            yvels1[x][y] = sample_surrounding(yvels, (float)x-xvels[x][y]*dt*SPEED, (float)y-yvels[x][y]*dt*SPEED);
            dens1[x][y] = sample_surrounding(dens, (float)x-xvels[x][y]*dt*DENSITY_SPEED, (float)y-yvels[x][y]*dt*DENSITY_SPEED);
        }
    }
    
    project(xvels1, yvels1, dt);
    
    xvels = xvels1;
    yvels = yvels1;
    dens = dens1;
}

