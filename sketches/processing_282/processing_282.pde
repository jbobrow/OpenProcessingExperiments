
/**
* optical flow 
*
* binarymillenium
*
* June 2008
*
* Licensed under the latest version of the GNU GPL
*
*/

PImage a;

color old_pixels[];

    
// weight the center pixel most heavily, make this a gaussian later
float weight(int i,int j) {
      
        float div = (flow_point.s/2);
        float x = (i - div)/div;
        float y = (j - div)/div;
        
        return 1.0-(sqrt(x*x + y*y)/sqrt(2.0));
        
        
        //return 1.0;
             
}

class flow_point {
    float x;
    float y;
    
    /// size of the window to look at - the size needs to match the granularity of 
    /// edges in the image being tracked- lots of small features should have small windows,
    /// big features need big windows (actually small ones still work there I think)
    static final int s = 12;
    
    PImage pixel_block;
    PImage old_pixel_block;
    
    PImage diff_x;
    PImage diff_y;
    PImage diff_t;

    
    flow_point(float x, float y) {
      this.x = x;
      this.y = y;
      
      pixel_block = new PImage();
      pixel_block.width = s;
      pixel_block.height = s;
      pixel_block.pixels = new color[s*s];
      
      old_pixel_block = new PImage();
      old_pixel_block.width = s;
      old_pixel_block.height = s;
      old_pixel_block.pixels = new color[s*s];
      
      diff_x = new PImage();
      diff_x.width = s;
      diff_x.height = s;
      diff_x.pixels = new color[s*s];
      
      diff_y = new PImage();
      diff_y.width = s;
      diff_y.height = s;
      diff_y.pixels = new color[s*s];
      
      diff_t = new PImage();
      diff_t.width = s;
      diff_t.height = s;
      diff_t.pixels = new color[s*s];
      
      der_x = new float[s*s];
      der_y = new float[s*s];
      der_t = new float[s*s];
     
    } 
    
    float[] der_x;
    float[] der_y;
    float[] der_t;
    

    
    void draw() {
      
      float max_dx = 0;
      float max_dy = 0;
      float max_dt = 0;
      
      float min_dx = 0;
      float min_dy = 0;
      float min_dt = 0;
    
        for (int i = 0; i < diff_x.pixels.length; i++) {
            if (der_x[i] > max_dx) {max_dx = der_x[i];}
            if (der_y[i] > max_dx) {max_dy = der_y[i];}
            if (der_t[i] > max_dx) {max_dt = der_t[i];}
            
            if (der_x[i] < min_dx) {min_dx = der_x[i];}
            if (der_y[i] < min_dx) {min_dy = der_y[i];}
            if (der_t[i] < min_dx) {min_dt = der_t[i];}
            
        }
          
       for  (int i = 0; i < diff_x.pixels.length; i++) {
         
         color cdx;
         color cdy;
         color cdt;
         
           if (der_x[i] > 0) {
             int d = (int)(255*der_x[i]/max_dx);
             cdx = color(d, 0,0);
           } else {
             int d = (int)(255*der_x[i]/min_dx);
             cdx = color(0, d,0);
           }
           
           if (der_y[i] > 0) {
             int d = (int)(255*der_y[i]/max_dy);
             cdy = color(d, 0,0);
           } else {
             int d = (int)(255*der_y[i]/min_dy);
             cdy = color(0, d,0);
           }
           
           if (der_t[i] > 0) {
             int d = (int)(255*der_t[i]/max_dt);
             cdt = color(d, 0,0);
           } else {
             int d = (int)(255*der_t[i]/min_dt);
             
             cdt = color(0, d,0);
           }
          
           diff_x.pixels[i] = cdx;
           diff_y.pixels[i] = cdy; 
           diff_t.pixels[i] = cdt; 
        }
      
         /// this will screw with the optical flow, since in the next step these markers may not be covered up
         fill(color(255,0,0,90));
        rect(x , y, s,s);
        
        
        
        if(false) {
         /// draw debugging info
        image(pixel_block,0, s, s, s);
        image(diff_x,s, s, s, s);
        image(diff_y,0, 2*s, s, s);
        image(diff_t,s, 0, s, s);
        image(old_pixel_block,0, 0, s, s);
        }
     
    }
    
    void limit_bounds() {
        if (x >= width - flow_point.s - 1 ) x = width -flow_point.s - 1;
    if (x < 0) x = 0;
    if (y >= height - flow_point.s - 1 ) y = height -flow_point.s -1;    
    if (y < 0) y = 0;  
    }
};

flow_point fp[];
/////////////////////////////////////////////////////////////////////////


void setup() {
  
  frameRate(15);
  
  size(500,500,P3D);
  
  old_pixels = new color[width*height];
  
  /// create high contrast texture
  //randomSeed(0);
  //noiseSeed(0);
  //loadPixels();
  
    final float div = 42.0;
    final float div2 = 25.0;
     final float div3 = 115.0;
    
    a = new PImage();
     a.width = width;
     a.height = height;
     a.pixels = new color[a.width*a.height];
     
     for (int i = 0; i < a.width; i++) {
       for (int j = 0; j < a.height; j++) {
         
         float val = (0.4*noise(i/div,j/div) + 
                            0.4*noise(i/div2,j/div2) + 
                            0.4*cos(PI*noise(i/div3,j/div3)) + 
                            0.4*cos(PI*noise(i/150.0,j/100.0)) +
                            0.4*cos(PI*noise(i/25.0,j/55.0)));
         
         val*=val;
         if (val > 1.0) val = 1.0;

         
         int c = (int)(255*val);
        // float trans = noise(i/div,j/div);
        
        //trans *= trans*trans*trans*0.5;
      
         a.pixels[i*a.height +j] = color(c,c,c);//,(int)(255*trans));
         
     }}
  

  /// setup initial optical flow points
  fp = new flow_point[16];
  
  int len = (int)(sqrt(fp.length));
  for (int i = 0; i < fp.length; i++) {
    
    int ind = i%len;
    fp[i] = new flow_point( width/4 + width/2*(float)ind/len,
                            height/4 + height/2*(float)floor(i/len)/(floor(fp.length/len)) );
                            
    fp[i].limit_bounds();
                            
                            //fp[i] = new flow_point(width/4 + random(width/2),
    //                       height/4 + random(height/2));
                           
                           
  }
  
  colorMode(RGB); //,255,255,255,100);
  
  //smooth();
  background(0);
  
}

/////////////////////////////////////////////////////////////////////////////////////////
/// send a pixel block in and compute the partial derivative of it with a sobel operator
float[][] i_xy(color[][] pixel_block) {

  float der_xy[][] = new float[2][0]; 
  
    // add row of zeros to make der_xy same size as source pixel blocks
  for (int j = 0; j < pixel_block.length; j++) {
    der_xy[0] = append(der_xy[0], 0);
    der_xy[1] = append(der_xy[1], 0);
  }
  
  for (int i = 1; i < pixel_block.length-1; i++) {
    der_xy[0] = append(der_xy[0], 0);
    der_xy[1] = append(der_xy[1], 0);
  for (int j = 1; j < pixel_block[i].length-1; j++) {
    
    ///
    float sobel_x, sobel_y = 0;
   
    float b00 = brightness(pixel_block[i-1][j-1]);
    float b01 = brightness(pixel_block[i-1][j]);
    float b02 = brightness(pixel_block[i-1][j+1]);
    float b10 = brightness(pixel_block[i][j-1]);
    ///float b11 = brightness(pixel_block[i][j]); // don't need this for either direction
    float b12 = brightness(pixel_block[i][j+1]);
    float b20 = brightness(pixel_block[i+1][j-1]);
    float b21 = brightness(pixel_block[i+1][j]);
    float b22 = brightness(pixel_block[i+1][j+1]);    
   
   /// the weight of the filter is 8, so divide it out
    sobel_x = (b00 + 2*b01 + b02 - b20 - 2*b21 - b22)/8.0;  
    sobel_y = (b00 + 2*b10 + b20 - b02 - 2*b12 - b22)/8.0;                     
                                                  
    der_xy[0] = append(der_xy[0],  sobel_x*weight(i,j));
    der_xy[1] = append(der_xy[1],  sobel_y*weight(i,j));
  }
    der_xy[0] = append(der_xy[0], 0);
    der_xy[1] = append(der_xy[1], 0);
  } 
  
  // add row of zeros to make der_xy same size as source pixel blocks
  for (int j = 0; j < pixel_block.length; j++) {
    der_xy[0] = append(der_xy[0], 0);
    der_xy[1] = append(der_xy[1], 0);
  }
  
  
  return der_xy;
}



/// send a pixel block in and compute the partial derivative of it
float[] i_t(color[][] pixel_block,color[][] old_pixel_block) {
  
  float der_y[] = new float[0]; 
  

  for (int i = 0; i < pixel_block.length; i++) {
  for (int j = 0; j < pixel_block[i].length; j++) {
    
    float diff = brightness(pixel_block[i][j]) -  brightness(old_pixel_block[i][j]);
                              
    der_y = append(der_y, diff*weight(i,j)  );
  }} 
  
  return der_y;
}

/// return Vx Vy of 
float[] optical_flow(flow_point tfp) {
  
  float[][] a_mat = new float[2][2];
  
  float[] b_vec = new float[2];
  
  
  int [][] new_pix = new int[flow_point.s][flow_point.s];
  int [][] old_pix = new int[flow_point.s][flow_point.s];
  
  for (int j = 0; j < flow_point.s; j++) {
  for (int k = 0; k < flow_point.s; k++) {
    new_pix[j][k] = tfp.pixel_block.pixels[j*flow_point.s + k];
    old_pix[j][k] = tfp.old_pixel_block.pixels[j*flow_point.s + k];  
  }}  
  
  float der_xy[][] = i_xy(new_pix);
  tfp.der_y = der_xy[0];
  tfp.der_x = der_xy[1];
  tfp.der_t = i_t(new_pix, old_pix);
  
  /// the pixel_block should be square, ignore anything but largest square inside it
  //print("der ");
    for (int i = 0; i < min(tfp.der_y.length,tfp.der_x.length, tfp.der_t.length); i++) {
    //    print(der_x[i] + " " + der_y[i] + " " + der_t[i] + ", ");
      
        a_mat[0][0] += tfp.der_x[i] * tfp.der_x[i];
        a_mat[0][1] += tfp.der_x[i] * tfp.der_y[i];
        a_mat[1][0] += tfp.der_x[i] * tfp.der_y[i];
        a_mat[1][1] += tfp.der_y[i] * tfp.der_y[i];
        
        b_vec[0] += tfp.der_x[i]*tfp.der_t[i];
        b_vec[1] += tfp.der_y[i]*tfp.der_t[i];
      }
     // print("\n");
     // print("\n");
      
      float vel_vec[] = new float[2];
      
      /// invert a_mat
      float[][] inv_a_mat = new float[2][2];
      
      /// if this is zero this is probably a bad point- just move around manually or don't 
      /// move at all until something happens with it.
      float det_div = a_mat[0][0]*a_mat[1][1] - a_mat[1][0]*a_mat[0][1];
      
      if (det_div != 0.0) {
      float det_a = 1/det_div;
      
      
      inv_a_mat[0][0] = det_a * a_mat[1][1];
      inv_a_mat[0][1] = det_a * inv_a_mat[1][0];
      inv_a_mat[1][0] = det_a * inv_a_mat[1][1];
      inv_a_mat[1][1] = det_a * a_mat[0][0];
        
      /// multiply inv_a_mat * b_vec to get vel_vec;
      
      vel_vec[0] = inv_a_mat[0][0] * b_vec[0] + inv_a_mat[1][0] * b_vec[1]; 
      vel_vec[1] = inv_a_mat[0][1] * b_vec[0] + inv_a_mat[1][1] * b_vec[1];     
      
      //print("det_a " + det_a + ", " + vel_vec[0] + " " + vel_vec[1] + ", ");
      } 
  
    return vel_vec;
}
////////////////////////////////////////////////////////////////////////////////

boolean has_initted = false;
void process_flow_points()
{
   for (int i = 0; i < fp.length; i++) {
    //arraycopy( fp[i].pixel_block.pixels, fp[i].old_pixel_block.pixels );
    
    
    for (int j = 0; j < flow_point.s; j++) {
      for (int k = 0; k < flow_point.s; k++) {
         
        int pix_ind = (int)(fp[i].y + j)*width  + (int)(fp[i].x + k);
        fp[i].pixel_block.pixels[j*flow_point.s + k] = pixels[pix_ind];
        
         fp[i].old_pixel_block.pixels[j*flow_point.s + k] = old_pixels[pix_ind];
       
  }}
    
    /// on the first frame, the old_pixels will be meaningless so don't do the
    /// optical flow on it.
    
    if (has_initted == true) {
        
    float[] vxy = optical_flow(fp[i]);
    
    /// so far this seems to be handling negative motions by scaling down the 
    /// vxy - 0.6* value that would be seen in opposite direction
    
    fp[i].x += vxy[0];
    fp[i].y += vxy[1];
    }
    
    
    /// this movement will invalidate what's in the old_pixel
    
    //print(vxy[0] + " " + vxy[1] + "\n");
    
    
    fp[i].limit_bounds();
    
    
  }
  //print("\n");
    
    /// need to keep a buffer of the entire screen around
    arraycopy(pixels, old_pixels ); 
}


///////////////////////////////////////////////////////////////////////////////

float t = 0.0;

void draw() {
  
  background(0);
  
  //t += 4.0;
  t += 0.008;
  
  float ofs[] = new float[8];
  for (int i = 0; i< ofs.length; i++) {
    ofs[i] = noise(t,i/10.0)-0.5;
    
    float f = 500.0;
    float fade_end = 0.4;
    if (t < fade_end) { ofs[i] *= f*t/fade_end; } 
    else { ofs[i] *= f;}
  }

//ofs[1] = -t;
//ofs[3] = ofs[1];
//ofs[5] = ofs[1];
//ofs[7] = ofs[1];

//ofs[0] = 0;
//ofs[2] = ofs[0];
//ofs[4] = ofs[0];
//ofs[6] = ofs[0];

beginShape();
texture(a);
vertex( 0+ofs[0], ofs[1], 0, 0);
vertex(width+ofs[2], 0+ofs[3], a.width,0);
vertex(width + ofs[4], height+ofs[5], a.width, a.height);
vertex( 0+ofs[6], height+ofs[7], 0, a.height);
endShape();

///////////////////////////////////
  /// do optical flow, copy areas of screen in to little buffers to be processed
  loadPixels();

process_flow_points();
has_initted = true;
    
    /// draw points to indicate flow point locations.
  for (int i = 0; i < fp.length; i++) {
    fp[i].draw();

  }
  
  
}

