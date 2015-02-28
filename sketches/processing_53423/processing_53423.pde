
//// This program show you how to use Spherical coordinate system
//// in Geography in example with the Earth.

Sphere_3D_display s3d;
Sphere_latitude_display sLatD;
Sphere_longitude_display sLonD;


int COLOR_WHITE = 255;
int COLOR_BLACK = 0;
int NBR_DAY = 24;

void setup() {
  size(900, 450, P3D);
  frameRate(30);
  smooth();
  
  PFont f;
  f = createFont("Georgia", 18, true);
  textFont(f);
  
  int rayon = 100;
  
  int MAIN_X = width/2;
  int MAIN_Y = height/2;
  
  int LAT_X = width/6;
  int LAT_Y = height/4;
  
  int LON_X = width/2 + (width/2 - width/6);
  int LON_Y = height/4;
  
  s3d = new Sphere_3D_display(rayon, MAIN_X, MAIN_Y);
  sLatD = new Sphere_latitude_display(rayon, LAT_X, LAT_Y);
  sLonD = new Sphere_longitude_display(rayon, LON_X, LON_Y);
}

void draw() {
  background(COLOR_WHITE);
  noFill();
  
  s3d.init();
  s3d.drawLongitude();
  s3d.drawLatitude();
  s3d.displayCursor();
  s3d.end();
  
  sLatD.init();
  sLatD.display();
  sLatD.end();
  
  sLonD.init();
  sLonD.display();
  sLonD.end();
  
}


//// Abstract Class ////
////////////////////////

class Frame {
  
  int x_init;
  int y_init;
  
  Frame(int x_define, int y_define) {
    x_init = x_define;
    y_init = y_define;
  }
  
  void init() {
    // pmFrameInit
    pushMatrix();
    translate( x_init, y_init, 0 );
  }
  
  void end() {
    //pmFrameInit
    popMatrix();
  }
}

class Sphere_obj extends Frame {
  
  int rayon;
  Coord_sys coord_sys;
  
  Sphere_obj (int rayon_define, int x_define, int y_define) {
    super(x_define, y_define);
    rayon = rayon_define;
    coord_sys = new Coord_sys();
  }
}


//// Instance Class ////
////////////////////////


// interface to use cartesian / polar / spherical coordinate systems
class Coord_sys {
  
  // cartesian
  float x;
  float y;
  float z;
  
  // spherical
  int r;
  // _d -> utilisez cette var en degree
  float alpha_lat_d;
  float beta_lon_d;
  
  // polar
  int p;
  float sigma_d;
  
  Coord_sys () {
    r = 0;
    alpha_lat_d = 0;
    beta_lon_d = 0;
    
    x = 0;
    y = 0;
    z = 0;
  }
  
  void update(int x_, int y_, int z_) {
  }
  
  void update( float alpha_d, float beta_d, int r_ ) {
    alpha_lat_d = alpha_d;
    beta_lon_d = beta_d;
    r = r_;
  }
  
  void update( float sigma_d_, int p_ ) {
    p = p_;
    sigma_d = sigma_d_;
  }
  
  // We choose Geographic coordinates
  void sph_convert_to_cartesian() {
    x = r * sin(radians(beta_lon_d)) * cos(radians(alpha_lat_d));
    y = r * sin(radians(alpha_lat_d));
    z = r * cos(radians(beta_lon_d)) * cos(radians(alpha_lat_d));
  }
  
  void pol_convert_to_cartesian() {
    x = p * cos(radians(sigma_d));
    y = p * sin(radians(sigma_d));
  }
}


class Sphere_3D_display extends Sphere_obj {
  
  Sphere_3D_display(int rayon_define, int x_define, int y_define) {
    super(rayon_define, x_define, y_define);
  }
  
  void drawLatitude() {
    int h = 0;
    
    // pmDrawLon
    pushMatrix();
    
    rotateX(HALF_PI);
    ellipse( 0, 0, rayon*2, rayon*2);
    
    for( h=0; h < rayon; h += rayon/(NBR_DAY/2) ) {
      pushMatrix();
      translate(0, 0, h);
      ellipse( 0, 0, compute_diameter(rayon, h), compute_diameter(rayon, h) );
      popMatrix();
    }
    
    for( h=0; abs(h) < rayon; h -= rayon/(NBR_DAY/2) ) {
      pushMatrix();
      translate(0, 0, h);
      ellipse( 0, 0, compute_diameter(rayon, h), compute_diameter(rayon, h) );
      popMatrix();
    }
    
    // pmDrawLon
    popMatrix();
  }
  
  void drawLongitude() {
    int theta_d = 0; // _d -> use this var in degree
    
    for( theta_d = 0; theta_d <= 180; theta_d += 15 ) {
      pushMatrix();
      rotateY(radians(theta_d));
      ellipse(0, 0, rayon*2, rayon*2 );
      popMatrix();
    }
  }
  
  void displayCursor() {
    float curs_x_lon_d; // _d degree
    float curs_y_lat_d; // _d degree
    
    curs_x_lon_d = map( mouseX, 0, width, -90 -1, 90 +1);
    curs_y_lat_d = map( mouseY, 0, height, -90 -1, 90 +1);
    
    
    coord_sys.update(curs_y_lat_d, curs_x_lon_d, rayon);
    coord_sys.sph_convert_to_cartesian();
    
    pushMatrix();
    translate( coord_sys.x, coord_sys.y, coord_sys.z );
    sphere(1);
    line(0, 0, -coord_sys.x, -coord_sys.y);
    popMatrix();
    
  }
  
  // pythagoras
  float compute_diameter(int equator_rayon, int h ) {
    return 2*sqrt( sq(rayon) - sq(h) );
  }
  
}


class Sphere_latitude_display extends Sphere_obj {
  
  Sphere_latitude_display(int rayon_define, int x_define, int y_define) {
    super(rayon_define, x_define, y_define);
  }
  
  void display() {
    float curs_y_lat_d; // _d degree
    float cursor_y, cursor_x;
    
    curs_y_lat_d = map( mouseY, 0, height, -90 -1, 90 +1);
    
    
    // we inverse the angle sign to display on the left part
    coord_sys.update(-curs_y_lat_d, rayon + 30);
    coord_sys.pol_convert_to_cartesian();
    
    ellipse(0, 0, rayon*2, rayon*2);
    line( - (rayon+40), 0, 0, 0);
    line(0, 0, -coord_sys.x, -coord_sys.y);
    cursor_y = -coord_sys.y;
    cursor_x = -coord_sys.x;
    
    // display sunsets
    for( int i = 0; i <= (NBR_DAY/2); i++ ) {
      coord_sys.update(i*(360/NBR_DAY) + degrees(HALF_PI), rayon);
      coord_sys.pol_convert_to_cartesian();
      line( - (rayon+40), coord_sys.y, coord_sys.x, coord_sys.y);
      
      if ( abs(cursor_y - coord_sys.y) <= 1 ) {
        ellipse(cursor_x, cursor_y, 5, 5);
        fill(COLOR_BLACK);
        text(abs((int)curs_y_lat_d)+"°", -10, 10);
        text(abs((int)curs_y_lat_d)+"°", coord_sys.x -30, coord_sys.y);
        noFill();
      }
    }
    
    fill(COLOR_BLACK);
    textAlign(CENTER);
 
    if( curs_y_lat_d <= 0 ) {
      text("Latitude : alpha angle "+abs((int)curs_y_lat_d)+"°N", 0, rayon+30);
    } else {
      text("Latitude : alpha angle "+abs((int)curs_y_lat_d)+"°S", 0, rayon+30);
    }
    noFill();
  }
}


class Sphere_longitude_display extends Sphere_obj {
  
  Sphere_longitude_display(int rayon_define, int x_define, int y_define) {
    super(rayon_define, x_define, y_define);
  }
  
  void display() {
    float curs_x_lon_d; // _d degree
    
    curs_x_lon_d = map( mouseX, 0, width, -90 -1, 90 +1);
    
    int local_h, local_m;
    float diff_h, diff_m;
    
    diff_h = curs_x_lon_d / (360/NBR_DAY);
    diff_m = map( (diff_h - floor(diff_h)), 0, 1, 0, 60);
    
    float tmp_h;
    local_h = hour() + (int)diff_h;
    local_m = minute() + (int)diff_m;
    
    if ( local_m < 0 ) {
      local_m = 60 - abs(local_m);
      local_h--;
    } else if ( local_m > 59 ) {
      local_m = local_m - 59;
      local_h++;
    }
    
    if ( local_h < 0 ) {
      local_h = 24 - abs(local_h);
    } else if ( local_h > 24 ) {
      local_h = local_h - 24;
    }
    
    fill(0);
    textAlign(CENTER);
    
    // meridian on the PC clock
    text("Reference Meridian : "+ 0 + "°" + hour() + "h" + minute(), 0, 0);
    if ( curs_x_lon_d <= 0 ) {
      text("Longitude : beta angle "+ abs((int)curs_x_lon_d) + "°W " + local_h + "h" + local_m, 0, 30);
    } else {
      text("Longitude : beta angle "+ abs((int)curs_x_lon_d) + "°E " + local_h + "h" + local_m, 0, 30);
    }
    
    noFill();
  }
}


