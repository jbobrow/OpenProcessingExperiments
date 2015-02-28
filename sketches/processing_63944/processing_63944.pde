



class Particle {

  float x;
  float y;
  float vx;
  float vy;



  Particle() {
    x = random(10, width-10);
    y = random(10, height-10);
  }


  void update() {


    if (mousePressed) {
      int rx = mouseX;
      int ry = mouseY;

      float radius = dist(x, y, rx, ry);

      if (radius < 150) {
        float angle = atan2(y-ry, x-rx);

        vx -= (150 - radius) * 0.01 * cos(angle + (0.7 + 0.0005 * (150 - radius)));
        vy -= (150 - radius) * 0.01 * sin(angle + (0.7 + 0.0005 * (150 - radius)));
      }
    }



    /* x and y are increased by our velocities. This completes our formula c + r * cos(a) or sin(a), with vx/vy being the r * cos(a) or sin(a) */
    x += vx;
    y += vy;

    /* The velocities are decreased by 3% to simulate friction. */
    vx *= 0.97;
    vy *= 0.97;

    /* 
     Boundary collision is calculated here. If the particle is beyond the boundary, its velocity is reversed and the particle is moved back into the main area.
     */
    if (x > width-10) {
      vx *= -1;
      x = width-11;
    }
    if (x < 10) {
      vx *= -1;
      x = 11;
    }
    if (y > height-10) {
      vy *= -1;
      y = height-11;
    }
    if (y < 10) {
      vy *= -1;
      y = 11;
    }


   //point((int)x, (int)y);


    fft.forward(jingle.mix);
    int w = int(fft.specSize()/128);
    for (int i = 0; i < fft.avgSize(); i++)
    {
      //ellipse(i*w, height - fft.getAvg(i)*5, 10, 10);
     // point(i*w, height - fft.getAvg(i)*5);
      
     point((int)x, (int)y+fft.getAvg(i)*5);      
    }

  }
}  


