
/**
 * binarymillenium 
 * November-December 2010
 * GNU GPL v3 
 *
 * 'w','a','s','d' to move.
 * 
 * Art from http://opengameart.org/content/isometric-64x64-outside-tileset
 * Yar
 * CC-BY 3.0
 *
 */ 


PImage tiles[];
PImage dec[];
PImage elev[];
PImage slope[];

/*
PImage[] loadTiles(String path) {
  File dir = new File(path); 
  PImage tiles[];
  tiles = new PImage[dir.list().length];
  for (int i = 0; i < dir.list().length; i++) {
    println( dir.list()[i]);
    try {
    tiles[i] = loadImage(path + "/" + dir.list()[i]);
    } catch (Exception e) {
       tiles[i] = null; 
    }
  }
  return tiles;
}
*/

String[] dec_names = {
"dec/iso2_62.png",
"dec/iso2_63.png",
"dec/iso2_70.png",
"dec/iso2_71.png",
"dec/iso2_72.png",
"dec/iso2_73.png",
"dec/iso_110.png",
"dec/iso_111.png",
"dec/iso_112.png",
"dec/iso_113.png",
"dec/iso_114.png",
"dec/iso_115.png",
"dec/iso_116.png",
"dec/iso_117.png",
"dec/iso_118.png",
"dec/iso_119.png",
"dec/iso_120.png",
"dec/iso_121.png",
"dec/iso_124.png",
"dec/iso_125.png",
"dec/iso_126.png",
"dec/iso_127.png",
"dec/iso_128.png",
"dec/iso_129.png",
"dec/iso_66.png",
"dec/iso_67.png",
"dec/iso_68.png",
"dec/iso_69.png",
"dec/iso_70.png"
};

String[] elev_names = {
"elev/iso_34.png",
"elev/iso_54.png",
"elev/iso_55.png",
"elev/iso_60.png",
"elev/iso_61.png",
"elev/iso_62.png",
"elev/iso_63.png",
"elev/iso_64.png",
"elev/iso_65.png",
"elev/iso_71.png",
"elev/iso_72.png",
"elev/iso_73.png",
"elev/iso_74.png",
"elev/iso_75.png",
"elev/iso_76.png",
"elev/iso_77.png",
"elev/iso_78.png",
"elev/iso_79.png"
};

String[] slope_names = {
"slope/iso_30.png",
"slope/iso_31.png",
"slope/iso_32.png",
"slope/iso_33.png",
"slope/iso_35.png",
"slope/iso_36.png",
"slope/iso_37.png",
"slope/iso_38.png",
"slope/iso_40.png",
"slope/iso_41.png",
"slope/iso_42.png",
"slope/iso_43.png",
"slope/iso_50.png",
"slope/iso_51.png",
"slope/iso_52.png",
"slope/iso_53.png",
"slope/iso_56.png",
"slope/iso_57.png",
"slope/iso_58.png",
"slope/iso_59.png"
};

String[] tile_names = {
"tiles/iso_0.png",
"tiles/iso_1.png",
"tiles/iso_10.png",
"tiles/iso_11.png",
"tiles/iso_12.png",
"tiles/iso_13.png",
"tiles/iso_14.png",
"tiles/iso_15.png",
"tiles/iso_16.png",
"tiles/iso_17.png",
"tiles/iso_2.png",
"tiles/iso_20.png",
"tiles/iso_21.png",
"tiles/iso_22.png",
"tiles/iso_23.png",
"tiles/iso_3.png",
"tiles/iso_4.png",
"tiles/iso_5.png",
"tiles/iso_6.png"
};

String[] water_names = {
"water/iso_100.png",
"water/iso_101.png",
"water/iso_102.png",
"water/iso_80.png",
"water/iso_81.png",
"water/iso_82.png",
"water/iso_83.png",
"water/iso_84.png",
"water/iso_85.png",
"water/iso_86.png",
"water/iso_87.png",
"water/iso_88.png",
"water/iso_89.png",
"water/iso_90.png",
"water/iso_91.png",
"water/iso_92.png",
"water/iso_93.png",
"water/iso_94.png",
"water/iso_95.png",
"water/iso_96.png",
"water/iso_97.png",
"water/iso_98.png",
"water/iso_99.png"
};

PImage[] loadTiles(String[] paths) {
  
  PImage tiles[];
  tiles = new PImage[paths.length];
  
  for (int i = 0; i < paths.length; i++) {

    try {
    tiles[i] = loadImage(/*dataPath*/(paths[i]));
    } catch (Exception e) {
       tiles[i] = null; 
    }
  }
  return tiles;
}

void setup() {
  size(940,560);
  //tiles = loadImage("iso-64x64-outside.png");
  
  String path;
   
 /* tiles = loadTiles(dataPath("tiles"));
  dec   = loadTiles(dataPath("dec"));
  elev  = loadTiles(dataPath("elev"));
  slope  = loadTiles(dataPath("slope"));
  */
  
  tiles = loadTiles(tile_names);
  dec   = loadTiles(dec_names);
  elev  = loadTiles(elev_names);
  slope  = loadTiles(slope_names);
  
  //println("dec size " + dir.list().length);
  //noLoop();
  frameRate(8);
}

int ew_mv_size = 32;
int ns_mv_size = 0;

void keyPressed() 
{
  int maxmv = 32;
  
  if (key == 'a') {
    ew_mv_size -= 32;
    
    if (ew_mv_size > maxmv) ew_mv_size = maxmv;
  } 
  if (key == 'd') {
    ew_mv_size += 32;
    
    if (ew_mv_size < -maxmv) ew_mv_size = -maxmv;
  } 
  
  if (key == 'w') {
    ns_mv_size += 16;
    
    if (ns_mv_size > maxmv) ns_mv_size = maxmv;
  } 
  if (key == 's') {
    ns_mv_size -= 16;
    
    if (ns_mv_size < -maxmv) ns_mv_size = -maxmv;
  } 
  
  
}


float t = 0.0;
int xoff = 0;
int yoff = 0;
int dec_ind_max = 0;
int dec_ind_min = 100000;

final int MAX_HEIGHT=8;
int getElevation(int x_noise,int y_noise)
{
   float frac = 3.0;
        
      
   int elevation = (int) (MAX_HEIGHT*noise( x_noise/frac+2000, y_noise/frac,t));
   
   elevation -=4;
   
   if (elevation <0) elevation = 0;
   
   return elevation;
      
}


void draw() {
  background(0);
  
  //t += 0.00001;
  xoff += ew_mv_size;
  yoff -= ns_mv_size;
  
  ew_mv_size =0;
  ns_mv_size =0;
  
  int x_part = xoff % 32;
  int x_rnd  = xoff/32;
  
  int y_part = yoff % 16;
  int y_rnd  = yoff/16;
  //println(x_part);
  

  for (int i = 7; i>= -7/*-2; i < width/32+1*/; i--) {
    // diagonal down to right
    for (int j = -7; j <=7; j++) {
      float x =  j*32 - x_part;
      float y = -i*32 + y_part;
           
      float x_rot = x   - y/2 + width/2 + i*16 -32;
      float y_rot = x/2 + y   + height/2 + i*16 -16*3;
      
      int x_noise = (i + x_rnd);
      int y_noise = (j + y_rnd);
      
      int offset = 0;
      //////////////////////////////////////
      // get a random flat tile for base
      float frac = 9.0;  
     // random(tiles.length); 
      int tile_ind = offset+ (int) ((tiles.length-offset) * 3.0*noise( x_noise/frac, y_noise/frac,t))%(tiles.length-offset);
     
      if (tiles[tile_ind] != null) {
        image(tiles[tile_ind], x_rot, y_rot);
      }
      
      if (true) {
      ///////////////////////////////////////
      // raise the elevation
      int elevation = getElevation(x_noise,y_noise);
       
      int elev_factor = 32;
      // draw elev tiles upwards
      for (int k = 0; k < elevation; k++) {
        
        float nval =  3.0*noise( x_noise/frac,y_noise/frac, k/frac + t);
        int ind = (int) (elev.length * nval) % elev.length;
        if (elev[ind] != null) {
          image(elev[ind], x_rot, y_rot - k*elev_factor);
        }
      }
      
      boolean is_slope = false;
      
      /// put a slope if neighboring tiles are elevated differently
      if        (getElevation(x_noise+1,y_noise) > elevation) {
         image(slope[1], x_rot, y_rot - elevation*elev_factor );
         is_slope = true;
      } else if (getElevation(x_noise, y_noise-1) > elevation) {
         image(slope[2], x_rot, y_rot - elevation*elev_factor );
         is_slope = true;
      }  else if (getElevation(x_noise-1,y_noise) > elevation) {
         image(slope[6], x_rot, y_rot - elevation*elev_factor );
         is_slope = true;
      } else if (getElevation(x_noise, y_noise+1) > elevation) {
         image(slope[5], x_rot, y_rot - elevation*elev_factor );
         is_slope = true;
      } 
      
        else if (getElevation(x_noise+1,y_noise-1) > elevation) {
        /// directly above
         image(slope[0], x_rot, y_rot - elevation*elev_factor );
         is_slope = true;
      } else if (getElevation(x_noise+1,y_noise+1) > elevation) {
        ///
         image(slope[3], x_rot, y_rot - elevation*elev_factor );
         is_slope = true;
      } else if (getElevation(x_noise-1,y_noise-1) > elevation) {
        ///
         image(slope[4], x_rot, y_rot - elevation*elev_factor );
         is_slope = true;
      } 
      
      else
      //////////////////////////
      /// now put a tree on it
      if ((!is_slope) && (noise( 500 + x_noise/frac, y_noise/frac,t) > 0.55)) {
        frac = 11.0;
        
        float nval =  3.0*noise( 100 + x_noise/frac,y_noise/frac,t);
        int ind = 1+ (int) ((dec.length-1) * nval) % (dec.length-1);
        if (dec[ind] != null) {
          image(dec[ind], x_rot, y_rot - (elevation-2)*elev_factor - dec[ind].height);
        }
        
        if (ind > dec_ind_max){ 
          dec_ind_max = ind; 
          println(dec.length + " max " + ind + " " + nval); 
        }
        if (ind < dec_ind_min){ 
          dec_ind_min = ind; 
          println(dec.length + "  min " + ind + " " + nval); 
        }
      }
      
      } // extra terrain
      
    }  // i loop
  } // j loop
  
}

