
class Building { 
  float x, y, z; 
  float w, h, d;

  Building(float nx, float ny, float nz) { 
    x= nx; 
    y=ny;
    z=nz; 

    w=80; 
    h=random(40, 500); 
    d=80;
  }

  void display() { 
    pushMatrix(); 
    translate(x, y-h/2,z); 
    box(w, h, d);
    popMatrix();
  }
}


