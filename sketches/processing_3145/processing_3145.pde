
class Arc {
  float cx1, cy1, cx2, cy2, start_x, start_y, end_x, end_y;
  
  // separate each instance of this object from each other
  int noise_offset = (int) random(1000, 1000000);
  float time = 200;
  
  int h, s, b;
  
  // controls the "smoothness" of the noise as time progresses
  // higher values make the random numbers "change" faster
  float noise_time_mult;
  
  Arc(int start_x, int start_y, float noise_time_mult, int h, int s, int b) {
    this.start_x = this.end_x = this.cx1 = this.cx2 = start_x;
    this.start_y = this.end_y = this.cy1 = this.cy2 = start_y;
    
    this.noise_time_mult = noise_time_mult;
    this.h = h;
    this.s = s;
    this.b = b;
    
    update();
  }
  
  void update() {
    cx1 += scaled_noise(5, 1);
    cx2 += scaled_noise(5, 2);
    cy1 += scaled_noise(5, 3);
    cy2 += scaled_noise(5, 4);
    end_x += scaled_noise(2, 5);
    end_y += scaled_noise(2, 6);
    start_x += scaled_noise(1, 7);
    start_y += scaled_noise(1, 8);
    
    time -= attempted_fps/frameRate;
  }
  
  void draw() {
    stroke(h, s, b, time);
    if (fill) {
      fill(h, s, b, time / 2);
    }
    
    /*beginShape();
    vertex(start_x, start_y);
    
    bezierVertex(cx1, cy1, cx2, cy2, end_x, end_y);
    
    endShape();*/
    bezier(start_x, start_y, cx1, cy1, cx2, cy2, end_x, end_y);
  }
  
  private float scaled_noise(int range, int offset) {
    return range * (1 - 2 *
      noise(offset * 1000000 + noise_offset + time * noise_time_mult));
  }
}

