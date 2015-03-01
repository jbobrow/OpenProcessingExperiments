
float pol[][] = new float[4][2];
float spikes[][][][] = new float[4][][][];
float w = 100;
float h = 200;

float zoom = 1;
float delta_x = 0, delta_y = 0;

int num_spikes = 4;
float spike_min = 40;
float spike_max = 100;
float spike_angle = 30;
float half_base = 10;
float rand_corner_min = 5;
float rand_corner_max = 20;
int spikes_side[] = new int[4];

void setup () {
  size(600, 600);
  randomPol();
}

void randomPol() {
  int nspikes_side = 0;
  float rand_x, rand_y, rand_len, random_delta;
  float x_left, x_right, y_left, y_right, y_top, y_bottom, x_top, x_bottom;
  float alpha, spike_len, spike_delta;

  /* Create random noise in corners */
  pol[0][0] = -w/2 + random(rand_corner_min, rand_corner_max);
  pol[0][1] = -h/2 + random(rand_corner_min, rand_corner_max);
  pol[1][0] = w/2 + random(rand_corner_min, rand_corner_max);
  pol[1][1] = -h/2 + random(rand_corner_min, rand_corner_max);
  pol[2][0] = w/2 + random(rand_corner_min, rand_corner_max);
  pol[2][1] = h/2 + random(rand_corner_min, rand_corner_max);
  pol[3][0] = -w/2 + random(rand_corner_min, rand_corner_max);
  pol[3][1] = h/2 + random(rand_corner_min, rand_corner_max);

  /* For each side of the quadrilateral... */
  for (int i = 0; i < 4; ++i) {
    /* Number of spikes in the side */
    nspikes_side = int(random(1, num_spikes));
    /* And save it for posterior use */
    spikes_side[i] = nspikes_side;
    /* Create the array of three points for the spike */
    spikes[i] = new float[nspikes_side][3][2];
    spikes_side[i] = nspikes_side;

    /* Create random points in polygon side */
    for (int j = 0; j < nspikes_side; ++j) {
      spike_len = random(spike_min, spike_max);

      /* Is it a top/bottom side or left/right side? */

        /* Top or bottom */
        if (i == 0 || i == 1) {
          x_left = pol[i][0];
          y_left = pol[i][1];
          x_right = pol[(i + 1) % 4][0];
          y_right = pol[(i + 1) % 4][1];
        } else {
          x_left = pol[(i + 1) % 4][0];
          y_left = pol[(i + 1) % 4][1];
          x_right = pol[i][0];
          y_right = pol[i][1];
        }
        
        if ((i + 2) % 2 == 0) {
        
            rand_x = random(x_left + half_base, x_right - half_base);
            rand_y = map(rand_x, x_left, x_right,  y_left, y_right);
    
            /* Ponto esquerdo da base do spike */
            spikes[i][j][0][0] = rand_x - half_base;
            spikes[i][j][0][1] = map(spikes[i][j][0][0], x_left, x_right,  y_left, y_right);
    
            /* Ponto direito da base do spike */
            spikes[i][j][2][0] = rand_x + half_base;
            spikes[i][j][2][1] = map(spikes[i][j][2][0], x_left, x_right,  y_left, y_right);
    
            /* Ponto mais externo do spike */
            random_delta = random(-spike_angle, spike_angle);
    
            spikes[i][j][1][0] = rand_x + random_delta;
            spikes[i][j][1][1] = rand_y - (1 - i)*spike_len;
    
        } else {

            rand_y = random(y_left + half_base, y_right - half_base);
            rand_x = map(rand_y, y_left, y_right,  x_left, x_right);
    
            /* Ponto esquerdo da base do spike */
            spikes[i][j][0][1] = rand_y - half_base;
            spikes[i][j][0][0] = map(spikes[i][j][0][1],  y_left, y_right,  x_left, x_right);
    
            /* Ponto direito da base do spike */
            spikes[i][j][2][1] = rand_y + half_base;
            spikes[i][j][2][0] =  map(spikes[i][j][2][1],  y_left, y_right,  x_left, x_right);
    
            /* Ponto mais externo do spike */
            random_delta = random(-spike_angle, spike_angle);
    
            spikes[i][j][1][0] = rand_x + i*(2 - i)/i*spike_len;
            spikes[i][j][1][1] = rand_y + random_delta;

        }
      }
    }    
}

void draw() {
  background(255, 255, 255);
  translate(width/2, height/2);
  noStroke();
  fill(0,0,0);

  translate(delta_x, delta_y);
  scale(zoom, zoom);

  beginShape();
    vertex(pol[0][0], pol[0][1]);
    vertex(pol[1][0], pol[1][1]);
    vertex(pol[2][0], pol[2][1]);
    vertex(pol[3][0], pol[3][1]);
  endShape();

  for (int i = 0; i < 4; ++i) {
    for (int j = 0; j < spikes_side[i]; ++j) {
      color (0,0,0);
      beginShape();
      vertex(spikes[i][j][0][0], spikes[i][j][0][1]);
      vertex(spikes[i][j][1][0]/zoom - delta_x/zoom, spikes[i][j][1][1]/zoom - delta_y/zoom);
      vertex(spikes[i][j][2][0], spikes[i][j][2][1]);
      endShape();
    }
  }
}

void keyPressed() {
  switch (key) {
    case ' ':
      zoom = 1;
      delta_x = 0;
      delta_y = 0;
      randomPol();
      break;
    case 'z':
      zoom += 0.1;
      break;
    case 'x':
      zoom -= 0.1;
      break;
    case 'h':
      delta_x -= 5;
      break;
    case 'l':
      delta_x += 5;
      break;  
    case 'k':
      delta_y -=5;
      break;
    case 'j':
      delta_y +=5;
      break; 
  }
}

