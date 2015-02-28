
final float MIN_TO_DEG= 1/60f;     
final float SEG_TO_DEG= 1/3600f;
final float SCALE_F= 3e-6;

class DataHolder {  
  String 
  NAME, COUNTRY;
  int 
  VALUE, INDEX;
  float 
  LATITUDE, LONGITUDE;
  PVector 
  START, END;
  boolean 
  hovered=false;
  
  DataHolder (int i){
    INDEX     = i+1;  
    NAME      = t.getString (i+1,0);
    COUNTRY   = t.getString (i+1,1);
    VALUE     = t.getInt    (i+1,2);
    LATITUDE  = parseCoord  (t.getString(i+1,3));
    LONGITUDE = parseCoord  (t.getString(i+1,4));
    START     = polarToCartesian (LATITUDE,LONGITUDE,-1);
    END       = polarToCartesian (LATITUDE,LONGITUDE,VALUE*SCALE_F);
  }

  //A custom method to parse GeoNames´s database coordinates 
  float parseCoord(String a){
    //Split the string using whitespace characters as delimiters.
    String[] c= split(a," ");
    //Match a regular expresion in order to exclude any symbol
    for (int i=1;i<c.length;i++) c[i]= match(c[i],"\\d++")[0]; 
    //Transform the coordinates into a single floating value
    float coord= int(c[1]) + int(c[2])*MIN_TO_DEG + int(c[3])*SEG_TO_DEG; 
    //And check orientation: if first char is 'S' or 'W' set a negative sign
    char orientation=c[0].charAt(0);
    if  (orientation==87 || orientation==83) coord*=-DEG_TO_RAD; else coord*=DEG_TO_RAD;
    return coord;  
  }

  void setHoveredTo (boolean booleanToSet){
    hovered= booleanToSet;
  }

   // returns a Pvector representing the lat, long and altitude in 3d space
   // altitude is relative to the surface of the globe
  PVector polarToCartesian(float lat, float lng, float hght) {
    float shift_lat = lat + HALF_PI;                     // shift the lat by 90 degrees
    float tot_hght  = w.globeRadius + hght;
    
    float x = -tot_hght * sin(shift_lat) * cos(lng);     // -1 needed cause of the orientation of the processing 3d cartesian coordinate system
    float z =  tot_hght * sin(shift_lat) * sin(lng);
    float y =  tot_hght * cos(shift_lat);
    return  new PVector(x,y,z);
  }
  
  void render(PGraphics canvas, boolean buffered){    
    canvas.strokeWeight(LINES_WEIGHT);
    if      (buffered) {canvas.strokeWeight(BUFF_LINES_W); canvas.stroke(INDEX);} 
    else if  (hovered) canvas.stroke(HOVER_COL); 
    else               canvas.stroke(DATA_COL);  
    canvas.line(START.x,START.y,START.z,END.x,END.y,END.z);
  }
      
}

