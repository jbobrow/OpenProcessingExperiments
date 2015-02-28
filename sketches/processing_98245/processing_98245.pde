
class Robot_t {

  Entity_t body;

  float wheel_radius = 1;
  float wheel_sep = 1;
  float mv1, mv2, mv3;  // motor velocities
  float ma1, ma2, ma3;  // motor angles
  
  Tracking_dot_t body_trail;
  Tracking_dot_t m1_trail;
  Tracking_dot_t m2_trail;
  Tracking_dot_t m3_trail;

  Robot_t() {
    body = new Entity_t();
    
    // Create tracking dots with rgb colour
    body_trail = new Tracking_dot_t();
    m1_trail = new Tracking_dot_t( 140, 20, 20 );
    m2_trail = new Tracking_dot_t( 20, 140, 20 );
    m3_trail = new Tracking_dot_t( 20, 20, 140 );
    
    // Zero motor speeds
    mv1 = 0;
    mv2 = 0;
    mv3 = 0;
    
    // Set wheel angles 
    ma1 = PI / 3;   
    ma2 = PI;
    ma3 = -PI / 3;
    
    body.a = radians( 0 );
  }


  void VectorToMotorVelocities( float mag, float angle, float rotation ) {
      float vx,vy;
     
      // In each time step, we subtract the robots angular rotation
      // from the desired vector, to correct for an angular momentum
      // (i.e; the robot is spinning whilst it moves on a vector).
      angle =  (  angle - body.a );     

      // Work out the X and Y components of the vector
      vx =  sin( angle );
      vy =  cos( angle );
      
      // Use the angular orientation the wheels to work out
      // an appropriate contribution of X and Y components 
      // for each wheel.
      // Note, we add in a constant angular velocity (if any) 
      // of the robot to each wheel here 
      mv1 = (vx * sin( ma1 )) - (vy * cos( ma1  ) ) - rotation;
      mv2 = (vx * sin( ma2 )) - (vy * cos( ma2 ) ) - rotation;
      mv3 = (vx * sin( ma3  )) - (vy * cos( ma3 ) ) - rotation;
      
      //println("mv 1: "+ mv1 );
      //println("mv 2: "+ mv2 );
      //println("mv 3: "+ mv3 );
      //println("");    
     
  }
  
  
  
  void DoKinematics() {
     int i,j;
     
    // Wheel (C)onstraint matrix
    float[][] c_matrix = new float[3][3];
    c_matrix[0][0] = 1 / (sqrt(3));        c_matrix[0][1] = 0;                    c_matrix[0][2] = - 1 / (sqrt(3));
    c_matrix[1][0] = 0 - (1.0 / 3.0);      c_matrix[1][1] = 2.0/3.0;              c_matrix[1][2] =  0 - (1.0 / 3.0);
    c_matrix[2][0] = -1 / (3 * wheel_sep); c_matrix[2][1] = -1 / (3 * wheel_sep); c_matrix[2][2] = -1 / (3 * wheel_sep); 
    
    //println(" c matrix:\t[ " + c_matrix[0][0] + " ][ " + c_matrix[0][1] + " ][ " + c_matrix[0][2] + " ]");
    //println("          \t[ " + c_matrix[1][0] + " ][ " + c_matrix[1][1] + " ][ " + c_matrix[1][2] + " ]");
    //println("          \t[ " + c_matrix[2][0] + " ][ " + c_matrix[2][1] + " ][ " + c_matrix[2][2] + " ]");
    
    
    // (V)elocity matrix, defines contributions to
    // motion in the ideal situation, when the
    // robot is aligned to the global reference.
    float[] v_matrix = new float[3];
    v_matrix[0] = mv1 * wheel_radius;
    v_matrix[1] = mv2 * wheel_radius;
    v_matrix[2] = mv3 * wheel_radius;
    
    //println("V Matrix: \t[ " + v_matrix[0] + " ][ " + v_matrix[1] + " ][ " + v_matrix[2] + "]");
    
    // Store the result in r_matrix
    float[] r_matrix = new float[3];
   
    // Matrix Calculation
    for ( i = 0; i < 3; i++ ) {
      r_matrix[i] = 0;
      for ( j = 0; j < 3; j++ ) {
        r_matrix[i] = r_matrix[i] + (( c_matrix[i][j] * v_matrix[j] ));
      }
    }
    
    
    
    //println("R matrix 2 = (" + c_matrix[2][0] + " * " + v_matrix[0] + ")+(" + c_matrix[2][1] + " * " + v_matrix[1] + ")+(" + c_matrix[2][2] + " * " + v_matrix[2] + ")"); 
    //println("R matrix 2 = " + ( (c_matrix[2][0] * v_matrix[0]) + (c_matrix[2][1] * v_matrix[1]) + (c_matrix[2][2] * v_matrix[2]) ) );
    //println(" R matrix:\t[ " + r_matrix[0] + " ][ " + r_matrix[1] + " ][ " + r_matrix[2] + " ]");
    
    
    // (T)ranslation matrix
    // Converts between local and global reference.
    float[][] t_matrix = new float[3][3];

    t_matrix[0][0] = cos(body.a);
    t_matrix[0][1] = sin(body.a);
    t_matrix[0][2] = 0.0;

    t_matrix[1][0] = sin(body.a);
    t_matrix[1][1] = -cos(body.a);
    t_matrix[1][2] = 0.0;

    t_matrix[2][0] = 0;
    t_matrix[2][1] = 0;
    t_matrix[2][2] = 1;
    
    //println(" T matrix:\t[ " + t_matrix[0][0] + " ][ " + t_matrix[0][1] + " ][ " + t_matrix[0][2] + " ]");
    //println("          \t[ " + t_matrix[1][0] + " ][ " + t_matrix[1][1] + " ][ " + t_matrix[1][2] + " ]");
    //println("          \t[ " + t_matrix[2][0] + " ][ " + t_matrix[2][1] + " ][ " + t_matrix[2][2] + " ]");
    
    double[] result = new double[3];

    // Matrix Calculation
    for ( i = 0; i < 3; i++ ) {
      result[i] = 0;
      for ( j = 0; j < 3; j++ ) {
        result[i] += (t_matrix[i][j] * r_matrix[j]);
      }
    }
    
    //println(" Result: \t[ " + result[0] + " ][ " + result[1] + " ][ " + result[2] + " ]");
    //println("");
    body.x += result[0];
    body.y += result[1];
    body.a += result[2];
    
    // Constrain the co-ordinates to the screen.
    body.x = constrain( body.x, -200, 200 );
    body.y = constrain( body.y, -200, 200 );
    
  }

  void Draw() {
    stroke(100);
    strokeWeight(1);
    line( -150, 0, 150, 0);
    line( 0, -150, 0, 150);
    
    
   
    stroke(0);
    fill( 255 );

    
    ellipse( body.x, body.y, 40,40);
    fill(120,120,120);
    
    // Draw the wheels rotated around the body.
    fill( 120, 20, 20 );
    ellipse( body.x + 20*sin(ma1 + body.a), body.y + 20*cos(ma1 + body.a), 10,10);
    
    fill( 20, 100, 20 );
    ellipse( body.x + 20*sin(ma2 + body.a), body.y + 20*cos(ma2 + body.a), 10,10);
    
    fill( 20, 20, 120 );
    ellipse( body.x + 20*sin(ma3 + body.a), body.y + 20*cos(ma3 + body.a), 10,10);


    // Push the data into our tracking dots.
    body_trail.push( body.x, body.y );
    m1_trail.push( body.x + 20*sin(ma1 + body.a), body.y + 20*cos(ma1 + body.a) );
    m2_trail.push( body.x + 20*sin(ma2 + body.a), body.y + 20*cos(ma2 + body.a) );
    m3_trail.push( body.x + 20*sin(ma3 + body.a), body.y + 20*cos(ma3 + body.a) );
    
  }
  
  void DrawTrails() {
     body_trail.Draw();
     m1_trail.Draw();
     m2_trail.Draw();
     m3_trail.Draw(); 
  }
}


