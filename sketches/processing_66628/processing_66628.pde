

class spring
{
  // attributs
  float pxi, pyi, pxo, pyo;
  float vxi, vyi, vxo, vyo;
  float len, m, k, damp, Cv;

  spring[] links;

  spring(float X1, float Y1, float X2, float Y2) {
    pxi = X1;
    pyi = Y1;
    pxo = X2;
    pyo = Y2;

    vxi = 0;
    vyi = 0;
    vxo = 0;
    vyo = 0;

    len  = 10;
    k    = 1;
    m    = 1;
    damp = 0.8;
    Cv   = 1e-3;

    links = new spring[0];
  }

  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////

  void addLink(spring S) {
    links = (spring[])append(links, S);
  }

  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////

  void update() {

    float a = atan2(pyi-pyo, pxi-pxo);
    float d = dist(pxi,pyi,pxo,pyo);
    
    float fx = -k/m*((d-len) + Cv*(vxi-vxo))*(pxi-pxo);
    float fy = -k/m*((d-len) + Cv*(vyi-vyo))*(pyi-pyo);

    if (dist(0, 0, fx, fy) > 30) {
      fx *= 0.98;
      fy *= 0.98;
    }

    vxi  = damp*(vxi) + fx*dt;
    vyi  = damp*(vyi) + fy*dt;

    vxo  = damp*(vxo) - fx*dt;
    vyo  = damp*(vyo) - fy*dt;

    if (dist(0, 0, vxi, vyi) > 50) {
      vxi *= 0.98;
      vyi *= 0.98;
    }

    if (dist(0, 0, vxo, vyo) > 50) {
      vxo *= 0.98;
      vyo *= 0.98;
    }

    pxi += vxi*dt;
    pyi += vyi*dt;  
    pxo += vxo*dt;
    pyo += vyo*dt;  

    if (links.length>0) {
      for (int l=0; l<links.length; l++) {
        pxi = links[l].pxo;
        pyi = links[l].pyo;
        vxi = links[l].vxo;
        vyi = links[l].vyo;
      }
    }

    noFill();
    stroke(0, 255, 255);
    ellipse(pxi, pyi, 10, 10);
    line(pxi, pyi, pxo, pyo); 
    ellipse(pxo, pyo, 10, 10); 
    bounce();
  }

  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////

  void bounce() {
    if (pyi > height-10) { 
      pyi = height-10; 
      vyi = -vyi * 0.75;
    }
    else if (pyi < -10) { 
      pyi = -10; 
      vyi = -vyi * 0.75;
    }
    
    if (pyo > height-10) { 
      pyo = height-10; 
      vyo = -vyo * 0.75;
    }
    else if (pyo < -10) { 
      pyo = -10; 
      vyo = -vyo * 0.75;
    }


    if (pxi > width-10) { 
      pxi = width-10; 
      vxi = -vxi * 0.75;
    }
    else if (pxi < -10) { 
      pxi = -10; 
      vxi = -vxi * 0.75;
    }
    
    if (pxo > width-10) { 
      pxo = width-10; 
      vxo = -vxo * 0.75;
    }
    else if (pxo < -10) { 
      pxo = -10; 
      vxo = -vxo * 0.75;
    }
  }

  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////

  void blockIn(float x, float y) {
    pxi = x;
    pyi = y;
    vxi = 0;
    vyi = 0;
  }
}


