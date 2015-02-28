
import controlP5.*;

public ControlP5 control;
public ControlWindow w;

int gridColour = 255;
float gridZScale = 0.05;
int bckgrd = 255;
float res = 0.01;
float fa = 0.4;
float dfa=1;
int sd=2;


void makeControls() {
  control = new ControlP5(this);

  w = control.addControlWindow("controlWindow", 10, 10, 350, 200);
  w.hideCoordinates();
  w.setTitle("Parameters");

  //control.addSlider("grid_colour",0,255,255,20,20,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height
  control.addSlider("grid_z_scale",-0.2,0.2,0.05,20,40,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height
  control.addSlider("background_colour",0,255,255,20,60,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height
  control.addSlider("grid_res",0.005,0.02,0.01,20,80,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height
  control.addSlider("orbit_speed",0.1,5.0,0.4,20,20,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height
  control.addSlider("sys_scale",1,4,1,20,100,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height
  control.addSlider("planet_detail",2,5,2,20,120,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height
  control.addSlider("bspl_transparency",0,255,20,20,140,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height
  control.addSlider("grid_extent",10,50,30,20,160,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height

  control.setAutoInitialization(true);
}

void grid_colour(int gc_)
{
  gridColour = gc_;
}

void grid_z_scale(float gs_)
{
  gridZScale = gs_;
}

void background_colour(int bk)
{
  bckgrd = bk;
}

void grid_res(float gr)
{
  res = gr;
}

void orbit_speed(float sp_)
{
  fa = sp_;
}

void sys_scale(float ss_)
{
  n = ss_;
}

void planet_detail(int pd_)
{
  sd = pd_;
}

void bspl_transparency(int alp_)
{
  alph = alp_;
}

void grid_extent(int ge_)
{
  siz = ge_;
}


