
// Program to simulate the archimede principle with different volume & density in the same object

Material mFloatingObject;

float DENSITY_SHELL = 2.5;
float DENSITY_CONTENT = 0.1;
int EDGE = 50;
int THINKNESS = 5;
float GRAVITY = 9.81;

int WATER_LINE;
float WATER_DENSITY = 1;

void setup() {
  size(720, 640);
  smooth();
  
  WATER_LINE = height/4;
  
  float vol_shell = compute_shell_volume(EDGE, THINKNESS);
  float vol_content = compute_content_volume(EDGE, THINKNESS);
  
  mFloatingObject = new Material(EDGE, width/2, 0, DENSITY_SHELL, vol_shell, DENSITY_CONTENT, vol_content);
}

void draw() {
  background(255);
  line(0, WATER_LINE, width, WATER_LINE);
  
  mFloatingObject.update();
  mFloatingObject.display();
  
  if( mousePressed ) {
    mFloatingObject.restart();
  }
}


float compute_shell_volume( int edge, int thinkness ){
  return (6*sq(edge)*thinkness);
}

float compute_content_volume( int edge, int thinkness ) {
  return pow((edge - thinkness), 3);
}


class Material {
  
  int posX;
  int posY;
  int edge;
  
  Volume vShell;
  Volume vContent;
  
  Material (int edge_, int iniX, int iniY, float density_shell, float vol_shell, float density_content, float vol_content) {
    vShell = new Volume(density_shell, vol_shell);
    vContent = new Volume(density_content, vol_content);
    
    posX = iniX;
    posY = iniY;
    edge = edge_;
  }
  
  void update() {
    float ratio = (float)(posY - WATER_LINE) / edge;
    if ( ratio > 1 ) {
      ratio = 1;
    }
    
    float sVol_submerged = ratio * vShell.volume ;
    float cVol_submerged = ratio * vContent.volume;
    
    float mass = ((vShell.volume * vShell.density) + (vContent.volume * vContent.density));
    
    float gravity_force = mass * GRAVITY;
    float archimede_force = WATER_DENSITY * (sVol_submerged + cVol_submerged) * GRAVITY;
    
    
    if ( posY < WATER_LINE ) {
      posY = posY + (int)(gravity_force/mass);
    } else {
      posY = posY + (int)((gravity_force - archimede_force) / mass);
    }
  }
  
  void display() {
    strokeWeight(THINKNESS);
    rect( width/2 - (edge/2), posY - edge, edge, edge);
    strokeWeight(1);
  }
  
  void restart() {
    posY = 0;
  }
}

class Volume {
  
  float density;
  float volume;
  
  Volume (float density_, float volume_) {
    density = density_;
    volume = volume_;
  }
}


