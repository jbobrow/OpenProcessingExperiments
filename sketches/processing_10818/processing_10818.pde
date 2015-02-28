
/**
  * cFigure
  * a collection of cShapes 
  * Square Crow, June 2010
  */
  
/**
  LOG
  ===
  
  TO DO
  =====

  */
  
class cFigure{
  float cenX; float cenY; // center of the figure
  float bearingAbs; // facing direction in rad, 0 == UP
  cShape[] pieces; // shapes in the collection
  float[][] template; // [vertexNumber][{dX, dY, radius, angle}]
  float[][] vertices; // last stored position
  float[] bearingRel;
  int index = 0; // for manual init of points
  
  cFigure(int numShapes, float iX, float iY){
    // contructor for manual init of shapes
    template = new float[numShapes][4];
    vertices = new float[numShapes][2];
    pieces = new cShape[numShapes];
    bearingRel = new float[numShapes];
    cenX = iX; cenY = iY;
    bearingAbs = 0;
  }
  
  void add_cShape(float dX, float dY, cShape cshpRef, float relBearing){
    if(index < template.length){
      template[index][0] = dX; template[index][1] = dY;
      // relative pos expressed as a vector
      template[index][2] = sqrt(pow(dX,2) + pow(dY,2)); // calc radius
      pieces[index] = cshpRef;
      bearingRel[index] = relBearing;
      float quadrant_offset = 0;
      float raw = atan(-dX/dY);
      if(dX > 0 && dY > 0){quadrant_offset = -PI;} else
      if(dX < 0 && dY > 0){quadrant_offset = PI;}
      template[index][3] = raw + quadrant_offset; // calc theta
      index++;
    } else {println("cFigure.add_cShape: attepted to add too many vertices!");}
  }
  
  void add_cShape_with_vector(float radius, float theta, cShape cshpRef, float relBearing){
    // In the case that it is easier to express vertices as a vertex from the center
    if(index < template.length){
      pieces[index] = cshpRef;
      bearingRel[index] = relBearing;
      template[index][0] = -1; template[index][1] = -1; //never used again
      // relative pos expressed as a vector
      template[index][2] = radius; 
      template[index][3] = theta;
      index++;
    } else {println("cShape.add_vertex_as_vector: attepted to add too many vertices!");}
  }
  
  void make_penta_pinwheel(float radius, float cWidth, float cHeight){
    // helper function makes a five-bladed pinwheel with rectangular blades
    // You must first instantiate a cFigure with 5 pieces
    cShape temp;
    for(int i = 0; i < 5; i++){
      temp = new cShape(4,0.0,0.0);
      temp.make_rect(cWidth,cHeight);
      add_cShape_with_vector(radius + cHeight/2.0, i*TWO_PI/5, temp, i*TWO_PI/5);
    }
  }
  
  float normalize_2PI(float raw){
    // Normalize bearing to range 0 - 2*PI
    float rtnBearing = 0;
    if(raw < 0){
      rtnBearing = 2*PI + raw;
    }else if(raw > 2*PI){
      rtnBearing = raw - 2*PI;
    }else{rtnBearing = raw;}
    return rtnBearing;
  }
  
  void set_bearing(float newTheta){
    // set bearing to a specified angle
    bearingAbs = normalize_2PI(newTheta);
    //calc_points();
  }
  
  void change_bearing(float dTheta){
    // change bearing by a specified amount
    bearingAbs = normalize_2PI(bearingAbs + dTheta);
    //calc_points();
  }
  
  void set_center(float iX, float iY){
    // set the absolute position of figure center
    cenX = iX; cenY = iY;
    calc_points();
  }
  
  void move(float dX, float dY){
    // move the figure center by a specified amount
    cenX += dX;
    cenY += dY;
  }
  
  void move_vector(float distance){
    // move the figure center in direction of bearing by amount
    cenX += distance * sin(bearingAbs);
    cenY += distance * cos(bearingAbs) * -1;
  }
  
  void calc_points(){
    // calculate and store absolute position of points in the shape
    for(int i = 0; i < template.length; i++){
      vertices[i][0] = cenX + template[i][2] * sin(bearingAbs+template[i][3]);
      vertices[i][1] = cenY + template[i][2] * cos(bearingAbs+template[i][3]) * -1;
    }
  }
  
  void set_color(int inColor){
    // Set the color for all cShapes in the cFigure
    // Note that it is possible to set the color of shapes individually
    for(int i = 0; i < template.length; i++){
      pieces[i].set_color(inColor);
      // Note that it is possible to set the color of shapes individually
    }
  }
  
  void paint(){
    calc_points();
    for(int i = 0; i < template.length; i++){ 
      // place cShapes and then paint each one
      pieces[i].set_center(vertices[i][0],vertices[i][1]);
      pieces[i].set_bearing(normalize_2PI(bearingAbs + bearingRel[i]));
      pieces[i].paint();
    }
  }
  
}

