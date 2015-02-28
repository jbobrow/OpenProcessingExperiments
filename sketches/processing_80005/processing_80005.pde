
class Ke extends Layer {
  
  void draw() {
    noStroke();

  int np = n / maxage;
  for(int i=0; i<np & c<n; i++, c++) newp(c);
  // draw particle traces
  for(int i=0; i<c; i++) {
    age[i]++;
    float[] p = a[i];
    if (age[i] > maxage) newp(i);
    else {
      float[] f = f(p[0], p[1]);     
      // opacity based on speed (soft mode) or age (hard mode) 
      int m = maxage/2;
      float o = soft ? mag(f[0], f[1]) * 2 * opacity : (m - abs(m - age[i])) * opacity/m;
      // hue based on direction
      float h =  atan2(f[0], f[1]) + PI;   
      stroke(h, crayons ? 1 : 0, crayons ? 1 : 0, o); 
      // draw line while updating position
      line(p[0], p[1], p[0] += s*f[0],  p[1] += s*f[1]);
      
    }    
  }
  filter(BLUR, 1);
 
  }
  
}




class Ichi extends Layer {
  
  void draw() {
    noStroke();
//        background(0,0,1);
      image(ichipic, mouseX, mouseY);  
  }
  
}


