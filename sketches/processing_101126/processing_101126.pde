

// author: thomas diewald
// date: 17.06.2013
//
// quadtree image compression
//    the compression is done during quadtree-traversal but
//    the nodes are never stored.
//    to save the compression the leafes would be stored during
//    a depth-first traversal (morton order) saving the color and
//    the morton code (interlafed node coordinates) or the nodes-depth.
//
// MouseX ... quantization threshold
// SPACE  ... toggle node display




import java.util.Arrays;

PGraphics img_tree;
PImage img_src;
PImage img_qnt;
int w, h;
int[] SAT_R, SAT_G, SAT_B;


boolean SHOW_NODES = true;
int COUNTER = 0;


public void setup(){
  size(512,512, JAVA2D);
  img_src = loadImage("lena.png");
  w = img_src.width;
  h = img_src.height;
  
  //size(w,h, JAVA2D);
  
  img_qnt  = createImage   (w,h, ARGB);
  img_tree = createGraphics(w,h,P2D);
  
  img_src.loadPixels();
  createSAT();
  
  textFont(createFont("calibri", 12));
  textLeading(14);
}


void clear(){
  img_tree.loadPixels();
  Arrays.fill(img_tree.pixels, 0);
  img_tree.updatePixels();
}









public void draw(){
  background(255);
  clear();

  COUNTER = 0;
  int mse = (int)map(mouseX, 0, width, 0, 160);
  int pot = (int)Math.ceil(Math.log(Math.max(w, h))/Math.log(2));

  img_src.loadPixels();
  img_qnt.loadPixels();
  img_tree.beginDraw();
  img_tree.strokeWeight(1f);

  quantizePrecise_topDown(0, 0, 1<<pot, mse*mse);
  
  img_tree.endDraw();
  img_qnt.updatePixels();
  
  if(!SHOW_NODES ){
    image(img_qnt, 0,0);
  } else {
    image(img_tree, 0,0);
  }
  
  
  
  String t_num_srcpix  = String.format("pixels src:  %d", img_src.pixels.length);
  String t_num_qntpix  = String.format("pixels qnt: %d", COUNTER);
  String t_compression = String.format("compression: %f", COUNTER/(float)(img_src.pixels.length));
  String t_fps         = String.format("fps: %f", frameRate);
  String txt = ""
    + t_num_srcpix +"\n"
    + t_num_qntpix +"\n"
    + t_compression +"\n"
    + t_fps +"\n"
    ;
  noStroke();
  fill(0,150);
  rect(0,0,150,70);
  fill(255);
  text(txt, 10, 16);
}



// Quadtree Compression
private void quantizePrecise_topDown(int px, int py, int ps, float mse){
  if( ps == 1 ){
    if( px < w && py < h ){
      if( !SHOW_NODES ) {
        img_qnt.pixels[py*w+px] = img_src.pixels[py*w+px];
      } else {
        img_tree.noStroke();
        img_tree.fill(img_src.pixels[py*w+px]);
        img_tree.rect(px, py, ps, ps);
      }
      COUNTER++;
    }
  } else {
    
    final int hs   = ps>>1;
    final int area = ps*ps;
    final int yend = py+ps;
    final int xend = px+ps;
    
    // split node if it doesn't fit into the image
    if( xend > w || yend > h ){
      if( px < w && py < h ){
        quantizePrecise_topDown(px,    py,    hs, mse);
        quantizePrecise_topDown(px+hs, py,    hs, mse);
        quantizePrecise_topDown(px,    py+hs, hs, mse);
        quantizePrecise_topDown(px+hs, py+hs, hs, mse);
      }
      return;
    }
    
    // get mean color
    int A = py  *(w+1)+px;
    int B = py  *(w+1)+xend;
    int C = yend*(w+1)+xend;
    int D = yend*(w+1)+px;
    
    int mr = Math.round(  (SAT_R[C] + SAT_R[A] - SAT_R[B] - SAT_R[D]) /((float)area));
    int mg = Math.round(  (SAT_G[C] + SAT_G[A] - SAT_G[B] - SAT_G[D]) /((float)area));
    int mb = Math.round(  (SAT_B[C] + SAT_B[A] - SAT_B[B] - SAT_B[D]) /((float)area));

    // needs split? (MSE)
    for(int y = py; y < yend; y++){
      for(int x = px; x < xend; x++){
        int argb = img_src.pixels[y*w+x];

        int dr = mr - ((argb >> 16 )&0xFF); 
        int dg = mg - ((argb >>  8 )&0xFF); 
        int db = mb - ((argb       )&0xFF); 

        if( (dr*dr) >= mse || (dg*dg) >= mse || (db*db) >= mse ){
          quantizePrecise_topDown(px,    py,    hs, mse);
          quantizePrecise_topDown(px+hs, py,    hs, mse);
          quantizePrecise_topDown(px,    py+hs, hs, mse);
          quantizePrecise_topDown(px+hs, py+hs, hs, mse);
          return;
        }
        
      }
    }
    
    // MSE was ok, so apply mean color to image pixels (node-size)
    int mean_col = 0xFF000000 | mr<<16 | mg<<8 | mb;
    
    if( !SHOW_NODES ) {
      for(int y = py; y < yend; y++){
        for(int x = px; x < xend; x++){
          img_qnt.pixels[y*w+x] = mean_col;
        }
      }
    } else {
      img_tree.stroke(0,100);
      img_tree.fill(mean_col);
      img_tree.rect(px, py, ps, ps);
    }
    COUNTER++;
  }
}



// Summe Area Table
void createSAT(){
  final int w1 = w+1;
  final int h1 = h+1;

  SAT_R = new int[w1*h1];
  SAT_G = new int[w1*h1];
  SAT_B = new int[w1*h1];

  int ps = 0, pd = w1+1;
  for(int y = 1; y <= h; y++){
    for(int x = 1; x <= w; x++){    
      SAT_R[pd] = ((img_src.pixels[ps]>>16)&0xFF) + SAT_R[pd-w1]+SAT_R[pd-1] - SAT_R[pd-w1-1];
      SAT_G[pd] = ((img_src.pixels[ps]>> 8)&0xFF) + SAT_G[pd-w1]+SAT_G[pd-1] - SAT_G[pd-w1-1];
      SAT_B[pd] = ((img_src.pixels[ps]    )&0xFF) + SAT_B[pd-w1]+SAT_B[pd-1] - SAT_B[pd-w1-1];
      ps++;
      pd++;
    }
    pd++;
  }

}

public void keyPressed(){
  if(  online && key == ESC) key = 0;
}

public void keyReleased(){
  if( online && key == ESC) key = 0;
  if( key == ' ') SHOW_NODES = !SHOW_NODES;
}
  


