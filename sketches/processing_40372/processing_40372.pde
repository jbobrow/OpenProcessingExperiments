
void draw() {
  background(255);
  noStroke();

  //bright yellow
  for (int n = 0; n<partCount; n+=1) {
    pushMatrix();
    translate(x6[n], y6[n]);
    fill(random(200, 255), random(200, 255), 0, 100*.3);
    rect(-w6[n]/2, -h6[n]/2, w6[n], h6[n]);
    x6[n] += xs6[n];
    y6[n] += ys6[n];

    if (x6[n] > width - w6[n]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      x6[n] = width - w6[n]/2;
      xs6[n] *= -1;
    } 
    else if (x6[n] < w6[n]/2) {
      x6[n] = w6[n]/2;
      xs6[n] *= -1;
    }


    if (y6[n] > height - h6[n]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      y6[n] = height - h6[n]/2;
      ys6[n] *= -1;
    } 
    else if (y6[n] < h6[n]/2) {
      ys6[n] *= -1;
    }
    popMatrix();
  }


  //orange-yellow?
  for (int m = 0; m<partCount; m+=1) {
    pushMatrix();
    translate(x5[m], y5[m]);
    fill(random(240, 255), random(90, 110), random(30, 60), 100*.3);
    rect(-w5[m]/2, -h5[m]/2, w5[m], h5[m]);
    x5[m] += xs5[m];
    y5[m] += ys5[m];

    if (x5[m] > width - w5[m]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      x5[m] = width - w5[m]/2;
      xs5[m] *= -1;
    } 
    else if (x[m] < w5[m]/2) {
      x5[m] = w5[m]/2;
      xs5[m] *= -1;
    }


    if (y5[m] > height - h5[m]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      y5[m] = height - h5[m]/2;
      ys5[m] *= -1;
    } 
    else if (y5[m] < h5[m]/2) {
      ys5[m] *= -1;
    }
    popMatrix();
  }


  //orange-red
  for (int l = 0; l<partCount4; l+=1) {
    pushMatrix();
    translate(x4[l], y4[l]);
    fill(random(200, 255), random(10, 60), random(50, 100), 100*.3);
    rect(-w2[l]/2, -h2[l]/2, w2[l], h2[l]);
    x4[l] += xs4[l];
    y4[l] += ys4[l];

    if (x4[l] > width - w4[l]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      x4[l] = width - w4[l]/2;
      xs4[l] *= -1;
    } 
    else if (x4[l] < w4[l]/2) {
      x4[l] = w4[l]/2;
      xs4[l] *= -1;
    }


    if (y4[l] > height - h4[l]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      y4[l] = height - h4[l]/2;
      ys4[l] *= -1;
    } 
    else if (y4[l] < h4[l]/2) {
      ys4[l] *= -1;
    }
    popMatrix();
  }

  //red-purple
  for (int j = 0; j<partCount2; j+=1) {
    pushMatrix();
    translate(x2[j], y2[j]);
    fill(random(20, 90), 0, random(80, 180), 100*.3);
    rect(-w2[j]/2, -h2[j]/2, w2[j], h2[j]);
    x2[j] += xs2[j];
    y2[j] += ys2[j];

    if (x2[j] > width - w2[j]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      x2[j] = width - w2[j]/2;
      xs2[j] *= -1;
    } 
    else if (x2[j] < w2[j]/2) {
      x2[j] = w2[j]/2;
      xs2[j] *= -1;
    }


    if (y2[j] > height - h2[j]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      y2[j] = height - h2[j]/2;
      ys2[j] *= -1;
    } 
    else if (y2[j] < h2[j]/2) {
      ys2[j] *= -1;
    }
    popMatrix();
  }

  //dark purple
  for (int k = 0; k<partCount3; k+=1) {
    pushMatrix();
    translate(x3[k], y3[k]);
    fill(random(55, 155), random(0, 12), random(55, 200), 100*.2);
    rect(-w3[k]/2, -h3[k]/2, w3[k], h3[k]);
    x3[k] += xs3[k];
    y3[k] += ys3[k];

    if (x3[k] > width - w3[k]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      x3[k] = width - w3[k]/2;
      xs3[k] *= -1;
    } 
    else if (x3[k] < w3[k]/2) {
      x3[k] = w3[k]/2;
      xs3[k] *= -1;
    }


    if (y3[k] > height - h3[k]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      y3[k] = height - h3[k]/2;
      ys2[k] *= -1;
    } 
    else if (y3[k] < h3[k]/2) {
      ys3[k] *= -1;
    }
    popMatrix();
  }

  //dark blue
  for (int i = 0; i<partCount; i+=1) {
    pushMatrix();
    translate(x[i], y[i]);
    fill(0, 0, random(15, 115), 100*.3);
    rect(-w[i]/2, -h[i]/2, w[i], h[i]);
    x[i] += xs[i];
    y[i] += ys[i];


    if (x[i] > width - w[i]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      x[i] = width - w[i]/2;
      xs[i] *= -1;
    } 
    else if (x[i] < w[i]/2) {
      x[i] = w[i]/2;
      xs[i] *= -1;
    }


    if (y[i] > height - h[i]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      y[i] = height - h[i]/2;
      ys[i] *= -1;
    } 
    else if (y[i] < h[i]/2) {
      ys[i] *= -1;
    }
    popMatrix();
  }


 pushMatrix();
  translate(x8, y8);
  translate(width/2, height/2+400);
  rotate (rot);
  fill(255, 220, 0, 130);
  star(20, 650, 130, color(0), color(0), 5, 0.0);
  x8 += xs8;
  y8 += ys8;

  rot +=theta;
  popMatrix();
}


