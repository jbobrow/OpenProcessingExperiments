
//I wanted to make a moving scene, so I made a boat which floats up and down on the sea,
//with a simple background of the sun and a few clouds in the sky.
//Click the mouse or press b to begin.  The l, r, u and down keys can be used to move the boat
//left, right, p and down respectively and the mouse can be clicked in the left half of the screen
//to increase the speed of the boat's bobbing and the right half of the screen to slow it down.
//Type c to change the size of the boat randomly.
//Type s to take a screenshot.

//create some colour palettes
int n_wood_palette=10;
color wood_palette[]= {
  #893B00, #894715, #623B1D, #894816, #8B5831, #A54E0C, #71492A, #765A44, #A77853, #98785F
};
int n_sun_palette=6;
color sun_palette[]= {
  #FCC200, #FFD858, #FFE358, #FFE76F, #FFEA6F, #FFEE8B
};
int n_cloud_palette=5;
color cloud_palette[]= {
  #FFFFFF, #2F2F2F, #4F4F4F, #6F6F6F, #8F8F8F
};
int n_sea_palette=12;
color sea_palette[]= {
  #0343FF, #1C56FF, #396BFF, #5581FF, #7498FF, #8BA9FF, #A2BAFF, #B7C9FF, #CBD9FF, #E0E8FF, #F2F5FF, #FFFFFF
};

//define some global variables which are initialized such that the canvas is just a blank blue
//but can be modified by the keyboard and mouse inputs
float boat_width=0;
float boat_height=0;
float boat_pos_x=320;
float boat_pos_y=300;
float sea_height=0;
float boat_angle=0;
float speed=0.5;
int speed_fac=1;
int cloud_direction=1;
float cloud_speed=5;
//some parameters to define the cloud features, these could be used to make the clouds animate as well
int nclouds=5;
float cloud_pos_x[]= {
  20.0, 150.0, 260.0, 430.0, 650.0
};
float cloud_pos_y[]= {
  20.0, 140.0, 70.0, 180.0, 120.0
};
float cloud_size[]= {
  150.0, 80.0, 200.0, 170.0, 55.0
};
int cloud_colour[]= {
  0, 1, 2, 3, 4
};

//Create setup code block
void setup() {
  size(800, 600);
  background(#FFFFFF);
  //slow down the refresh rate a bit so the sea doesn't refresh so quickly
  frameRate(5);
}

void draw() {
  //call the functions to draw the sky, sea and the boat
  draw_sky(0);
  draw_sea(800, sea_height);
  draw_boat(boat_pos_x, boat_pos_y, boat_width, boat_height);

}

//draw the sky, including the sun and clouds, but only if the user has clicked or typed to begin
void draw_sky(int dummy) {
  fill(#4F9FFF);
  stroke(#4F9FFF);
  rect(0, 0, width, height);
  if (boat_width>0) draw_sun(width*0.75, height*0.25, 100);
  if (boat_width>0) draw_clouds(nclouds);
}

//daw the sun with colour changes using the sun palette
void draw_sun(float x, float y, float rad) {
  float cur_rad=rad;
  for (int i=n_sun_palette-1; i>=0; i--) {
    fill(sun_palette[i]);
    stroke(sun_palette[i]);
    //ellipse shrinks each time around the loop (and gets paler)
    cur_rad -= 0.5*(rad / n_sun_palette);
    ellipse(x, y, cur_rad, cur_rad);
  }
}

//draw the clouds
void draw_clouds(int nclouds) {
  for (int i=0; i<nclouds; i++) {
    int colour=cloud_colour[i];
    fill(cloud_palette[colour]);
    stroke(cloud_palette[colour]);
    float xs=cloud_size[i];
    float ys=xs/2;
    float xr=cloud_pos_x[i];
    float yr=cloud_pos_y[i];

    translate(xr, yr);
    beginShape();
    vertex(0, 0);
    bezierVertex(0.0, -ys/2, xs/2, -ys/2, xs/2, 0.0);
    vertex(xs/2, 0);
    bezierVertex(xs/2, -ys/2, xs, -ys/2, xs, 0.0);
    vertex(xs, 0);
    bezierVertex(xs+ys/2, 0.0, xs+ys/2, ys, xs, ys);
    vertex(xs, ys);
    bezierVertex(xs, ys+ys/2, xs-xs/2, ys+ys/2, xs-xs/2, ys);
    vertex(xs/2, ys);
    bezierVertex(xs/2, ys+ys/2, 0.0, ys+ys/2, 0.0, ys);
    vertex(0, ys);
    bezierVertex(-ys/2, ys, -ys/2, 0.0, 0.0, 0.0);
    vertex(0, 0);
    endShape();
    translate(-xr, -yr);
    
    cloud_pos_x[i]=(cloud_pos_x[i]+cloud_direction*random(0.8,1.2)*cloud_speed)%(width+10);
    cloud_pos_y[i]+=random(-1,1)*0.5;
    float maxv, minv;
    if (cloud_size[i]<400.0){
      maxv=1.0;
    }
    else{
      maxv=0.0;
    }
    if (cloud_size[i]>50.0){
      minv=-1.0;
    }
    else{
      minv=0.0;
    }
    cloud_size[i]*=(random(minv,maxv)*0.1+1.0);
  }
}

//draw the sea
void draw_sea(float w, float h) {
  if (h==0) return;
  fill(#002FFF);
  stroke(#002FFF);
  strokeWeight(4);
  int n_waves=40;
  rect(0, height-h, w, h);
  float wh=h/n_waves;
  float yp=height-h;
  float xp=0.0;
  float xl;
  //draw some curves to indicate waves using random colours and lengths to imply motion
  for (int i=0; i<=n_waves; i++) {
    while (xp<w) {
      xl=random(0, w/4);
      stroke(sea_palette[int(random(0, n_sea_palette))]); 
      bezier(xp, yp, xp-wh/2, yp-wh/2, xp+xl, yp-wh/2, xp+xl+wh/2, yp);
      xp=xp+xl+15;
    }
    xp=0.0;
    yp+=wh;
  }
}

//draw the boat
void draw_boat(float x, float y, float w, float h) {
  float xw=0.2*w;
  float yw=0.4*h;
  strokeWeight(2);
  stroke(wood_palette[0]);
  fill(wood_palette[1]);
  //modify the angle so the boat moves
  boat_angle += speed_fac*speed;
  if (boat_angle > PI/10) {
    speed_fac=-1;
  } else if (boat_angle < -PI/10) {
    speed_fac=1;
  }

  //use a combination of translate and rotate for the motion
  translate(x, y+h/4);
  rotate(boat_angle);
  beginShape();
  vertex(-xw-w/2, 0);
  vertex(xw/2-w/2, 0);
  vertex(xw-w/2, -yw);
  vertex(w/2-xw, -yw);
  vertex(w/2-4*xw/5, 0);
  vertex(w/2+xw/2, 0);
  bezierVertex(w/2+xw, xw, w/2, h, w/2, h);
  vertex(w/2, h);
  vertex(-w/2, h);
  bezierVertex(-w/2, h, -xw-w/2, xw, -xw-w/2, 0);
  endShape();
}

//define the key functions for boat movement, initialization and changing the boat size
void keyPressed() {
  if (key == 'L' || key == 'l') {
    if (boat_pos_x > 0) boat_pos_x -= 5;
  } else if (key == 'R' || key == 'r') {
    if (boat_pos_x < width) boat_pos_x += 5;
  } else if (key == 'D' || key == 'd') {
    if (boat_pos_y < 310) {
      boat_pos_y += 2;
    }
  } else if (key == 'U' || key == 'u') {
    if (boat_pos_y > 290) {
      boat_pos_y -= 2;
    }
  } else if (key == 'B' || key == 'b') {
    sea_height = height/2.5;
    boat_width=200;
    boat_height=80;
  } else if (key == 'C' || key == 'c') {
    int i = round(random(0, 1)); 
    if (i==1 && boat_width < 300) {
      boat_width *= 1.1;
      boat_height *= 1.1;
    } else if (i==0 && boat_width > 100) {
      boat_width *= 0.9;
      boat_height *= 0.9;
    }
  } else if (key == 'S' || key == 's') {
    saveFrame("boat.png");
  }
}

//mouse click function to change the speed of the boat depending on location of the click
//and initiate the drawing if it hasn't already been done
void mouseClicked() {
  sea_height = height/2.5;
  boat_width=200;
  boat_height=80;
  if (mouseX < width/2 && speed < 0.1) {
    speed *= 1.2;
    cloud_speed *= 1.2;
  } else if (mouseX > width/2 && speed > 0.0001) {
    speed *= 0.8;
    cloud_speed *= 0.95;
  }

}



