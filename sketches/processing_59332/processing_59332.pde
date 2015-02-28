
// bola No 1
float bola_x;
float bola_y;
float bola_dir = 1;
float bola_size = 15;  
float dx = 0; 

// bola No 2
float bola_x_2;
float bola_y_2;
float bola_dir_2 = 1;
float bola_size_2 = 25;  
float dx_2 = 0;  

// raqueta
int raqueta_width = 70;
int raqueta_height = 10;

// raqueta2
int raqueta_width2 = 70;
int raqueta_height2 = 10;

int dist_wall = 15;

void setup()
{
  size(400, 400);
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  noStroke();
  smooth();
  bola_x = width/2;
  bola_y = height/2;
  bola_x_2 = width/3;
  bola_y_2 = height/2;
}

void draw() 
{
  background(#2E9AFE);
  bola_y += bola_dir * 2;
  bola_x += dx;
  if(bola_y > height+bola_size+50 || bola_y < -50) {
    bola_y = height/2;
    bola_x = random(15, width-15);
    dx = 0;
  }
  
  // limitar la raqueta
  float raqueta_x = constrain(mouseX, raqueta_width, height-raqueta_width);
  float raqueta_x2 = constrain(mouseX, raqueta_width2, height-raqueta_width2);

  // Golpe con la raqueta 1  
  float rx = height-dist_wall-raqueta_height-bola_size;
  if(bola_y == rx && bola_x > raqueta_x - raqueta_width - bola_size && bola_x < raqueta_x + raqueta_width + bola_size) 
  {
    bola_dir *= -1;
    if(mouseX != pmouseX) {
      dx = (mouseX-pmouseX)/2.0;
      if(dx >  5) { dx =  5; }
      if(dx < -5) { dx = -5; }
    }
  } 
  
  // Golpe con la raqueta 2
  float rx2 = dist_wall+raqueta_height2+bola_size;
  if(bola_y == rx2 && bola_x > raqueta_x2 - raqueta_width2 - bola_size && bola_x < raqueta_x2 + raqueta_width2 + bola_size) 
  {
    bola_dir *= -1;
    if(mouseX != pmouseX) {
      dx = (mouseX-pmouseX)/2.0;
      if(dx >  5) { dx =  5; }
      if(dx < -5) { dx = -5; }
    }
  } 
  
  // Direccion al momento de partes laterales
  if(bola_x > width-bola_size) {
    dx = dx * -1;
  }
  if(bola_x < bola_size) {
    dx = dx * -1;
  }

  // dibujar bola 1
  fill(#01DF3A);
  ellipse(bola_x, bola_y, bola_size, bola_size);
  
  //BOLA 2
  
  bola_y_2 += bola_dir_2 * 1;
  bola_x_2 += dx_2;
  if(bola_y_2 > height+bola_size_2+50 || bola_y_2 < -50) {
    bola_y_2 = height/2;
    bola_x_2 = random(25, width-25);
    dx_2 = 0;
  }

  // Golpe con la raqueta
  float rx_2 = height-dist_wall-raqueta_height-bola_size_2;
  if(bola_y_2 == rx_2 && bola_x_2 > raqueta_x - raqueta_width - bola_size_2 && bola_x_2 < raqueta_x + raqueta_width + bola_size_2) 
  {
    bola_dir_2 *= -1;
    if(mouseX != pmouseX) {
      dx_2 = (mouseX-pmouseX)/2.0;
      if(dx_2 >  5) { dx_2 =  5; }
      if(dx_2 < -5) { dx_2 = -5; }
    }
  } 
  
  // Golpe con la raqueta 2
  float rx2_2 = dist_wall+raqueta_height2+bola_size_2;
  if(bola_y_2 == rx2_2 && bola_x_2 > raqueta_x2 - raqueta_width2 - bola_size_2 && bola_x_2 < raqueta_x2 + raqueta_width2 + bola_size_2) 
  {
    bola_dir_2 *= -1;
    if(mouseX != pmouseX) {
      dx_2 = (mouseX-pmouseX)/2.0;
      if(dx_2 >  5) { dx_2 =  5; }
      if(dx_2 < -5) { dx_2 = -5; }
    }
  } 
   
  // Direccion al momento de partes laterales
  if(bola_x_2 > width-bola_size_2) {
    dx_2 = dx_2 * -1;
  }
  if(bola_x_2 < bola_size_2) {
    dx_2 = dx_2 * -1;
  }

  // dibujar bola 2
  fill(#01DF3A);
  ellipse(bola_x_2, bola_y_2, bola_size_2, bola_size_2);
  
  
  // dibujar raquetas
  fill(#DF0101);
  rect(raqueta_x, height-dist_wall, raqueta_width, raqueta_height);  
  
  fill(#DF0101);
  rect(raqueta_x2, dist_wall, raqueta_width2, raqueta_height2);
}


import netscape.javascript.*;




