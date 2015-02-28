
int sx = 500, sy = 500;
float[] rnd = {};
int rnd_pos = 0;
float mDist = 0;
boolean mClose = false;

float[][] col_1 = {{0.6, 0, 0.2}, {1, 0, 0}};
float[][] col_2 = {{0.2, 0.2, 1}, {0, 0, 1}};
float rnd_str = 0, delta_str = 0.01, max_str = 2;

void setup() {
  size(sx, sy);
  colorMode(RGB, 1.0);
  background(0);
  //frameRate(999);
  init_rnd(1000);
}

void draw() {
  fill(0,1);
  rect(0,0,sx,sy);
  mDist = dist(mouseX, mouseY, sx/2, sy/2);
  rnd_str = mDist*delta_str;
  mClose = (mDist < 30);
  restart_rnd();
  flower(sx/2,sy/2,100,15,sx/20,1.05,col_1,col_2,rnd_str,7,1);
  //println(frameRate);
}

void init_rnd(int len){
  rnd = new float[0];
  for (int i=0; i<len; i++){
    rnd = append(rnd, random(1));
  }
}

float get_rnd(){
  float result = rnd[rnd_pos++];
  if (rnd_pos>=rnd.length){
    restart_rnd();
  }
  return result;
}

void restart_rnd(){
  rnd_pos = 0;
}

void flower(float start_x, float start_y, int paths, int steps, float step_length, float step_divider, float[][] color_1, float[][] color_2, float random_strength, float start_width, float end_width){
  float[] c1,c2;
  for (int i=0; i<=paths; i++){
    c1 = randomize_list(color_1[0],color_1[1]);
    c2 = randomize_list(color_2[0],color_2[1]);
    draw_path(start_x,start_y,get_rnd()*2*PI,steps,step_length,step_divider,c1,c2,random_strength,start_width,end_width);
  }
}

void draw_path(float start_x, float start_y, float direction, int steps, float step_length, float step_divider, float[] color_1, float[] color_2, float random_strength, float start_width, float end_width){
    float x = start_x;
    float y = start_y;
    float nx = 0, ny = 0;
    for (int i=0; i<=steps; i++){
        stroke((color_2[0]-color_1[0])*i/float(steps)+color_1[0], (color_2[1]-color_1[1])*i/float(steps)+color_1[1], (color_2[2]-color_1[2])*i/float(steps)+color_1[2]);
        strokeWeight(start_width + (end_width-start_width)*(i/float(steps)));        
        nx = x + step_length * cos(direction);
        ny = y + step_length * sin(direction);
        line(x,y,nx,ny);
        direction += random_strength*(get_rnd()-0.5);
        step_length = step_length / step_divider;
        x = nx;
        y = ny;
    }
}

float[] randomize_list(float[] list,float[] mask){
    float[] result = {};
    float rnd;
    for (int i=0;i<list.length;i++) {
        if (mask[i]==1) {
            rnd = get_rnd();
            result = append(result, (mClose?random(1):rnd)*list[i]);
        } else {
            result = append(result, list[i]);
        }
    }
    return result;
}


