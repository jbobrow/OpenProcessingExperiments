
class PondVisualizationWithCubes
{
  Minim minim;
  AudioPlayer sound;
  FFT fft;

  float[][] ripplemapOld;
  float[][] ripplemapNew;
  color[] colors = new color[10];
  int transparancy = 0x70;

  int rows = 50;
  int columns = 50;
  
  float cellsize = 40;

  int nrOfBands = 10;

  float rz = 0;
  float sc = 5.0f;

  color c1;
  color c2;
  
  float dr,dg,db;
  
  PImage img;

  PondVisualizationWithCubes(Minim minim)
  {
    ripplemapOld = new float[rows][columns];
    ripplemapNew = new float[rows][columns];
    this.minim = minim;
    sound = minim.loadFile("song2.mp3", 2048);
    sound.loop();

    fft = new FFT(sound.bufferSize(), sound.sampleRate());
    fft.logAverages(60,nrOfBands);

    c1 = #000000;
    //c2 = #FF1234;
    c2 =color(255,18,52);
    
    dr = red(c2)-red(c1);
    dg = green(c2)-green(c1);
    db = blue(c2)-blue(c1);
    
    print ("dr :"+dr+",dg :"+dg+",db :"+db);
  
    colors[0]= color(128,128,128,transparancy);
    colors[1]= color(45,120,237,transparancy);
    colors[2]= color(53,160,8,transparancy);
    colors[3]= color(0,233,0,transparancy);
    colors[4]= color(245,15,195,transparancy);
    colors[5]= color(229,154,63,transparancy);
    colors[6]= color(63,216,44,transparancy);
    colors[7]= color(54,80,242,transparancy);
    colors[8]= color(43,162,162,transparancy);
    colors[9]= color(119,54,242,transparancy);


    perspective(PI/4, float(width)/float(height), 
    1.0f, 3000.0F);
    
    img = loadImage("tex_logo.png");
  }

  void draw(){
    background(c1);
    float xpos =cellsize*columns/2 + (cellsize+5)*columns/2 * cos ( millis() / 2000.0f );
    float ypos =cellsize*rows/2 + (cellsize+5)*rows/2 * sin ( millis() / 2000.0f);
    camera(xpos, ypos, 1200+ 200*(sin(millis() /500.0f)),cellsize*columns/2,cellsize*rows/2,0, 0.0, 0.0, -1.0);
    // swaps maps
    fft.forward(sound.mix);

    float[][] temp = ripplemapOld;
    ripplemapOld = ripplemapNew;
    ripplemapNew = temp;
    
     // add sound impulses

    for ( int band = 0; band < nrOfBands; band++)
    {
      float angle = (band * 2 * PI) / nrOfBands;
      float radius = columns * .4f ;//+ columns*.03f*cos(millis()/2000.0f);
      int x = (int)(radius * cos (angle)) + rows / 2;
      int y = (int)(radius * sin (angle)) + columns /2;
      float h = fft.getAvg(band);
      ripplemapOld[x][y] = fft.getAvg(band)/2.5f;

      if ( band == 1 ){
        rz += h / 500.0f;
      }
    }
    
    for (int y=0;y<rows;y++) {
      for (int x=0;x<columns;x++) {
         float sum = 0;
         
         if ( x > 0 ){
            sum += ripplemapOld[x-1][y];
         }
         if ( y > 0 ){
           sum += ripplemapOld[x][y-1];
         }
         if ( x < columns - 1 ){
           sum += ripplemapOld[x+1][y];
         } 
         if ( y < rows - 1 ){
           sum += ripplemapOld[x][y+1];
         }
         
         /*
         for( int dx=-1 ; dx < 2 ; ++dx)
         {
           for ( int dy=-1;dy<2;++dy)
           {
             int cellx = x+dx;
             int celly = y+dy;
             if ( cellx > 0 && cellx < columns && celly > 0 && celly < rows && !(cellx == x && celly == y))
               sum+= ripplemapOld[cellx][celly]; 
           }
         }*/
         
         sum /= 2.0f;  

         sum -= ripplemapNew[x][y];
         sum *= .96f;
        
         ripplemapNew[x][y] = sum;
         
      }
    }
    
   
    
   
    /*
    for (int x = 0; x < columns-1; ++x){
      for (int y = 0; y < rows-1 ; ++y){
        float p = (ripplemapNew[x][y])/5.0f;
        if ( p > 1.0f ) 
          p = 1.0f;
        if ( p < 0.0f )
          p = 0.0f;
        float newr = red(c1) + dr*p;
        float newg = green(c1) + dg* p;
        float newb = blue(c1) + db * p;

        int ir = (int)newr;
        int ig = (int)newg;
        int ib = (int)newb;
        c= (transparancy << 24)|(ir<<16)|(ig<<8)|ib;
        //int nrBlocks = (int)(ripplemapNew[x][y]/10+1);

        tekenKubus(c,20, 20,20 ,x * 20, y*20,ripplemapNew[x][y]*2, 0,0,rz);
      }
    }*/
    
    pushMatrix();
    translate(0,0,0);
    rotateZ(0);
    beginShape(QUADS);
    for (int x = 0; x < columns-1; ++x){
      for (int y = 0; y < rows-1 ; ++y){  
        color top =  getColor(ripplemapNew[x][y]);
        tekenKubus(c1,top,cellsize,cellsize, ripplemapNew[x][y]*sc,x*cellsize,y*cellsize,0,0,0,0);
      }
    }
    endShape();
    popMatrix();
    
    pushMatrix();
    translate(0,0,0);
    rotateZ(0);
     beginShape(QUADS);
    texture(img);
    for (int x = 0; x < columns-1; ++x){
      for (int y = 0; y < rows-1 ; ++y){        
        float tcx = x*1.0f/(columns-1)*img.width;
        float tcy = y*1.0f/(rows-1)*img.height;
        float tcx1 = (x+1.0f)/(columns-1)*img.width;
        float tcy1 = (y+1.0f)/(rows-1)*img.height;
        float h= ripplemapNew[x][y]*sc+20.0F;
        vertex(x*cellsize    ,(y+1)*cellsize,h,tcx,tcy1);
        vertex((x+1)*cellsize,(y+1)*cellsize,h  ,tcx1,tcy1);
        vertex((x+1)*cellsize,y*cellsize    ,h    , tcx1, tcy);
        vertex(x*cellsize    ,y*cellsize    ,h      , tcx, tcy);
      }
    }
    endShape();
    popMatrix();
  }
  
  color getColor( float h ){
    float value = (h + 15.0f) / 30.0f;
    
    if ( value > 1.0f ) {
          value = 1.0f;
          //print( "height:" + h );
    }if ( value < 0.0f ){
          value = 0.0f;
      //print("height:"+ h);
    }
    float newr = red(c1) + dr*value;
    float newg = green(c1) + dg*value;
    float newb = blue(c1) + db*value;

    int ir = (int)newr;
    int ig = (int)newg;
    int ib = (int)newb;
    return color(ir,ig,ib,128);
  }

  void tekenKubus( color bottom, color top,float w, float l, float h, float tx,float ty, float tz, float rx, float ry,float rz ){
    pushMatrix();
    translate(tx,ty,tz);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    beginShape(QUAD);
    // grondvlak 
    fill (bottom);
    vertex(w/2, l/2, 0);
    vertex(w/2, -l/2, 0);
    vertex(-w/2, -l/2, 0);
    vertex(-w/2, l/2, 0);
    // een van de zijvlakken

    vertex(w/2,l/2,0);
    vertex(w/2,-l/2,0);
    fill (top);
    vertex(w/2,-l/2,h);
    vertex(w/2,l/2,h);
    // een andere zijvlak
    fill (bottom);
    vertex(-w/2,-l/2,0);
    vertex(-w/2,l/2,0);
    fill (top);
    vertex(-w/2,l/2,h);
    vertex(-w/2,-l/2,h);
    // een van de zijvlakken
    fill (bottom);
    vertex(w/2,l/2,0);
    vertex(-w/2,l/2,0);
    fill (top);
    vertex(-w/2,l/2,h);
    vertex(w/2,l/2,h);
    // een andere zijvlak
    fill (bottom);
    vertex(w/2,-l/2,0);
    vertex(-w/2,-l/2,0);
    fill (top);
    vertex(-w/2,-l/2,h);
    vertex(w/2,-l/2,h);
    // bovenvlak 
    vertex(w/2, l/2, h);
    vertex(w/2, -l/2, h);
    vertex(-w/2, -l/2, h);
    vertex(-w/2, l/2, h);
    endShape();
    popMatrix();
  }


  void stop()
  {
    // always close Minim audio classes when you are done with them
    sound.close();
    minim.stop();
  }
}





