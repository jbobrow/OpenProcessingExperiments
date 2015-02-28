

  final int col_BG = 0xFFFFFFFF;
  final int col_FG = 0xFF000000;
  
  int DISPLAY_IMG = 1; // 0=FG, 1=DT

  PGraphics img_FG; // foreground image
  PImage    img_DT; // distance image
  float[]   map_DT; // distance map
  
  
  public void setup(){
    size(800, 800, P2D);
   
    img_FG = createGraphics(width, height, P2D);
    img_DT = createImage(width, height, RGB);
    map_DT = new float[width*height];

    reset();
  }
  
  
  void reset(){
    img_FG.beginDraw();
    img_FG.background(col_BG);
    img_FG.endDraw();
    
    for(int i = 0; i < img_DT.pixels.length; i++){
      img_DT.pixels[i] = col_BG;
    }
  }

  
  static float min(float d1, float d2, float d3, float d4){
    float a = (d1<d2) ? d1:d2;
    float b = (d3<d4) ? d3:d4;
    return (a<b) ? a:b;
  }
  
  
  // distance transform
  void createDistanceMap(){

    // init FG
    img_FG.loadPixels();
    for(int i = 0; i < map_DT.length; i++){
      map_DT[i] = ( img_FG.pixels[i] == col_FG ) ? 0 : Integer.MAX_VALUE;
    }
    
    // setup mask (L,R)
    float M1L = 1;                   float M1R = M1L;
    float M2L = (float)Math.sqrt(2); float M2R = M2L;
    float M3L = 1 ;                  float M3R = M3L;
    float M4L = (float)Math.sqrt(2); float M4R = M4L;

    int   px, p1, p2, p3, p4; // indices
    float dx, d1, d2, d3, d4; // distances
    
    int w = img_FG.width;
    int h = img_FG.height;
    
    // L->R pass
    for(int y = 1; y < h; y++){
      for(int x = 1; x < w-1; x++){
        if( map_DT[ px = y*w+x ] > 0 ){
          d1 = M1L + map_DT[ p1 = px-1 ];
          d2 = M2L + map_DT[ p2 = p1-w ];
          d3 = M3L + map_DT[ p3 = p2+1 ];
          d4 = M4L + map_DT[ p4 = p3+1 ];
          dx = min(d1, d2, d3, d4);
          map_DT[px] =dx;
        }
      }
    }
    
    // R->L pass
    for(int y = h-2; y >= 0; y--){
      for(int x = w-2; x >= 1; x--){
        if( map_DT[ px = y*w+x ] > 0 ){
          d1 = M1R + map_DT[ p1 = px+1 ];
          d2 = M2R + map_DT[ p2 = p1+w ];
          d3 = M3R + map_DT[ p3 = p2-1 ];
          d4 = M4R + map_DT[ p4 = p3-1 ];
          dx = min(d1, d2, d3, d4);
          if( map_DT[px] > dx ) map_DT[px] = dx;
        }
      }
    }
    
    
    // find max distance, to create color [0,255];
    float max = 0;
    for(int i = 0; i < map_DT.length; i++){
      if( map_DT[i] < Integer.MAX_VALUE){
        if( max < map_DT[i] ) max = map_DT[i];
      }
    }
    max = 255/max;
    
    // create dt-image
    img_DT.loadPixels();
    for(int i = 0; i < img_DT.pixels.length; i++){
      int g = (int)( map_DT[i] * max);
      img_DT.pixels[i] = 0xFF000000 | g<<16 | g<<8 | g;
    }
    img_DT.updatePixels();
  }
  
  
  
  
  
  public void draw(){
    background(255);
   
    float draw_radius = 6;
    float clear_radius = 150;
    
    boolean ADD_FG = mousePressed && mouseButton == LEFT;
    boolean REM_FG = mousePressed && mouseButton == RIGHT;
    
    if( ADD_FG || REM_FG ){
      img_FG.beginDraw();
      if( ADD_FG ){
        img_FG.noFill();
        img_FG.stroke(col_FG);
        img_FG.strokeWeight(draw_radius);
        img_FG.line(mouseX, mouseY, pmouseX, pmouseY);
        
        img_FG.noStroke();
        img_FG.fill(col_FG);
        img_FG.ellipse(mouseX, mouseY, draw_radius, draw_radius);
        img_FG.ellipse(pmouseX, pmouseY, draw_radius, draw_radius);
      } 
      if( REM_FG ){
        img_FG.fill(col_BG);
        img_FG.noStroke();
        img_FG.ellipse(mouseX, mouseY, clear_radius, clear_radius); 
      }    
      img_FG.endDraw();
      
      createDistanceMap();
    }
//    createDistanceMap();

    
    if( DISPLAY_IMG == 0 ) image(img_FG, 0, 0);
    if( DISPLAY_IMG == 1 ) image(img_DT, 0, 0);

    
    if( REM_FG && DISPLAY_IMG == 0 ){
      noFill();
      stroke(0);
      ellipse(mouseX, mouseY, clear_radius, clear_radius);
    }
    
    if( !online ){
      frame.setTitle("distance transform | "+frameRate);
    }
  }
  
  
  public void keyPressed(){
    if(  online && key == ESC) key = 0;
  }
  
  public void keyReleased(){
    if( key == ' ') DISPLAY_IMG ^= 1;
    if( key == 'r') reset();
    if(  online && key == ESC) key = 0;
    if( !online && key == 's') save("data/distance_transform.png");

  }
  
  


