
class Waveline implements AudioListener
{
  private float[] left;
  private float[] right;
  short r, g, b;
  PImage[] img;
  short img_i;
  byte modeA;
  byte modeB;
  
  int wavew;
  int wavew_2;
  int waveh;
  PGraphics vscreen;
  
  boolean pause;
  
  Waveline(int vred, int vgreen, int vblue, int ibuff, int abuff)
  {
    left = new float[abuff];
    right = new float[abuff];
    for (int i=0, end=abuff; i < end; i++) {
      left[i]= 1.0; 
      right[i] = 1.0;
    }
    r = (short) vred;
    g = (short) vgreen;
    b = (short) vblue;
    if (ibuff > 0)
      img = new PImage[ibuff];
    img_i = 0;
    modeA = 0;
    modeB = 2;
    
    wavew = width/2;
    wavew_2 = wavew/2;
    waveh = height/2;
    
    vscreen = createGraphics(wavew,waveh, JAVA2D);
    vscreen.beginDraw();
    vscreen.background(0);
    vscreen.text("Hit the SPACE-BAR to begin visualizing...", 1, vscreen.height-8);
    vscreen.endDraw();
    
    background(0);
    pause = false;
  }
  
  Waveline(PImage img1, int ibuff, int abuff)
  {
    left = new float[abuff];
    right = new float[abuff];
    for (int i=0, end=abuff; i < end; i++) {
      left[i]= 1.0; 
      right[i] = 1.0;
    }
    if (ibuff > 0)
      img = new PImage[ibuff];
    img_i = 0;
    PGraphics temp_img = createGraphics(wavew,waveh,JAVA2D);
    temp_img.beginDraw();
    temp_img.image(img1, 0, 0, wavew, waveh);
    temp_img.endDraw();
    img[img_i] = temp_img;
    modeA = 1;
    modeB = 0;
     
    wavew = width;
    wavew_2 = wavew/2;
    waveh = height;
    
    vscreen = createGraphics(wavew_2,waveh, JAVA2D);
    vscreen.beginDraw();
    vscreen.background(0);
    vscreen.endDraw();
    
    pause = false;
    
  }
  
  synchronized void samples(float[] samp)
  {
    left = samp;
  }
  
  synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }
  
  public void change_clr(short vred, short vgreen, short vblue) {
    r = vred;
    g = vgreen;
    b = vblue;
    modeA = 0;
  }
  
  public void load_img(PImage img1, short img_index) {
    img_i = img_index;
    PGraphics temp_img = createGraphics(wavew,waveh,JAVA2D);
    temp_img.beginDraw();
    temp_img.image(img1, 0, 0, wavew, waveh);
    temp_img.endDraw();
    img[img_i] = temp_img;
  }
  
  public void change_img(short img_index) {
    img_i = img_index;
    modeA = 1;
  }
  
  public byte get_mode() {
    return modeA;
  }
  
  public void change_mdB(byte m) {
    modeB = m;
    if (modeB > 2) modeB = 0;
  } 

  public void pauseVid(boolean p) {
    if (p) {
      pause = true;
    } else {
      pause = false;
    }
  }  
  
  synchronized PGraphics draw(int vx, int vy, boolean clear)
  {

    if (!pause) {
      smooth();
      boolean clr_scrn = clear;
      
      // we've got a stereo signal if right or left are not null
      if ( left != null && right != null )
      {
        vscreen.beginDraw();
        vscreen.smooth();
        vscreen.strokeWeight(2);
      
        short y1;

        switch (modeA) {
          case 0:
          if(clr_scrn == true) vscreen.background(0,239);
          // draw the input waveforms
          y1 = (short)(waveh/2);
          for(byte i = 0; i < (wavew/16);i++)
          {
            short x1 = (short)(i * 8);
            short x2 = (short)((i + 1) * 8);
            vscreen.noFill();
            color pal = color(random(i*(r/32)),random(i*(g/32)),random(i*(b/32)));
            if(modeB == 2) vscreen.fill(pal, 27);
            vscreen.stroke(pal);
            draw_shape(x1, y1 + left[x1]*(wavew), x2, y1 + left[x2]*(wavew));
            if (modeB == 0)
              draw_shape(x1, y1 - right[x1]*(wavew), x2, y1 - right[x2]*(wavew));
          }
          break;
        
          case 1:
          tint(255, 239);
          //if(clr_scrn == true) vscreen.image(img[img_i],0,0);
          // draw the input waveforms
          y1 = (short)(waveh/2);
          for(byte i = 0; i < (wavew/16);i++)
          {
            short x1 = (short)(i * 8);
            short x2 = (short)((i + 1) * 8);
            vscreen.noFill();
            color pix = img[img_i].get(x1, (int)(y1 + left[x1]*(wavew_2)));
            if(modeB == 2) vscreen.fill(pix, 27);
            vscreen.stroke(pix);
            draw_shape(x1, y1 + left[x1]*(wavew), x2, y1 + left[x2]*(wavew));
            if (modeB == 0) {
              pix = img[img_i].get(x1, (int)(y1 - right[x1]*(wavew_2)));
              vscreen.stroke(pix);
              draw_shape(x1, y1 - right[x1]*(wavew), x2, y1 - right[x2]*(wavew));
            }
          }  
          break;
        }
        vscreen.endDraw(); 
      
        //image(vscreen, vx, vy, width, height);
      }
      else if ( left != null )
      {
        vscreen.beginDraw();
        vscreen.background(0);
        vscreen.strokeWeight(2);
 
        short y1 = (short)(waveh/2);
 
        switch (modeA) {
          case 0:
          // draw the input waveforms
          for(byte i = 0; i < (wavew);i++)
          {
            short x1 = (short)(i * 8);
            short x2 = (short)((i + 1) * 8);
            color pal = color(random(i*(r/32)),random(i*(g/32)),random(i*(b/32)));
            if(modeB == 2) vscreen.fill(pal, 27);
            vscreen.stroke(pal);
            draw_shape(x1, y1 + left[x1]*(wavew), x2, y1 + left[x2]*(wavew));
            if (modeB == 0)
              draw_shape(x1, y1 - left[x1]*(wavew), x2, y1 - left[x2]*(wavew));
          }
          break;
        
          case 1:
          tint(255, 239);
          //if(clr_scrn == true) vscreen.image(img[img_i],0,0);
          // draw the input waveforms
          for(byte i = 0; i < (wavew/16);i++)
          {
            short x1 = (short)(i * 8);
            short x2 = (short)((i + 1) * 8);
            color pix = img[img_i].get(x1, (int)(y1 + left[x1]*(wavew_2)));
            if(modeB == 2) vscreen.fill(pix, 27);
            vscreen.stroke(pix);
            draw_shape(x1, y1 + left[x1]*(wavew), x2, y1 + left[x2]*(wavew));
            if(modeB == 0) {
              pix = img[img_i].get(x1, (int)(y1 - left[x1]*(wavew_2)));
              vscreen.stroke(pix);
              draw_shape(x1, y1 - left[x1]*(wavew), x2, y1 - left[x2]*(wavew));
            }
          }
          break;
        }
        vscreen.endDraw(); 
      
        //image(vscreen, vx, vy, width, height);
      }
    }
    return vscreen;
  }
  
  public void draw_shape(short ax, float ay, short bx, float by) {
    int mode = (int)modeB;
    switch (mode) {
      case 0:
      vscreen.line(ax*2, ay*1.5, bx*2, by*1.5); 
      break;
      case 1:
      vscreen.rect(ax, ay*2-(by/2), bx, by); 
      break;
      case 2:
      vscreen.ellipse(ax*2, ay*2, bx, by); 
      break;
    }
  }
  
}


