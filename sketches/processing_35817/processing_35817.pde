
int amo = 336;

int[] xpos = new int[amo];
int[] ypos = new int[amo];
float[] csize = new float[amo];

int[] sxpos = new int[amo];
int[] sypos = new int[amo];
float[] ssize = new float[amo];

float[] tpoint1 = new float [amo];
float[] tpoint2 = new float [amo];
float[] tpoint3 = new float [amo];
float[] tpoint4 = new float [amo];
float[] tpoint5 = new float [amo];
float[] tpoint6 = new float [amo];

int[] xpos2 = new int[amo];
int[] ypos2 = new int[amo];
float[] csize2 = new float[amo];

void setup() { 
  //--------------CIRCLE-------------------
  size (700,400);  
  background (255);

  int i = 0;
  int x = 0;
  int y = 0;

  while (i < amo) {
    if(x >= 350) {
      x = 0;
      y = y + 15;
    }
    
    xpos[i] = 0 + x;
    ypos[i] = y;
    csize[i] = 15;
    
    x = x + 15;
    i = i + 1;
  }
  //--------------SQUARE---------------
    int a = 0;
    int sx = 355;
    int sy = -5;

  while (a < amo) {
    if(sx >= 700) {
      sx = 355;
      sy = sy + 15;
    }
    
    sxpos[a] = 0 + sx;
    sypos[a] = sy;
    ssize[a] = 12;
    
    sx = sx + 15;
    a = a + 1;
  }
  //------------TRIANGLE-----------------
     int t = 0;
    int tx = 0;
    int ty = 200;

  while (t < amo) {
    if(tx >= 350) {
      tx = 0;
      ty = ty + 15;
    }
    
    tpoint1[t] = 0 + tx;
    tpoint2[t] = ty;
    tpoint3[t] = 0 + tx - 6;
    tpoint4[t] = ty + 12;
    tpoint5[t] = 0 + tx + 6;
    tpoint6[t] = ty + 12;
    
    tx = tx + 15;
    t = t + 1;
}  
 //--------------CIRCLE-------------------
  size (700,400);  
  background (255);

  int i2 = 0;
  int x2 = 360;
  int y2 = 210;

  while (i2 < amo) {
    if(x2 >= 700) {
      x2 = 360;
      y2 = y2 + 15;
    }
    
    xpos2[i2] = 0 + x2;
    ypos2[i2] = y2;
    csize2[i2] = 15;
    
    x2 = x2 + 15;
    i2 = i2 + 1;
  }
}

void draw() {
  background(255);  
  fill(0,0,0,100);
  
  strokeWeight(2); 
//    stroke(0);
//    line(0,200,700,200);
//    line(350,0,350,400);
  
  //------------CIRCLE----------------
  noStroke();
  //Draws the graphic
  int j = 0;
  while (j < amo){
    ellipse(xpos[j],ypos[j], csize[j], csize[j]);
    j = j + 1;
  }
  
  //Checks size
  int i = 0;
  while (i < amo){
    
    float distance = dist(xpos[i], ypos[i], mouseX, mouseY);
    if(distance < csize[i]/2) {
      if(csize[i] <= 15) {
        csize[i] = csize[i] + 80;
      }
    } else {
      if(csize[i] > 15) {
        csize[i] = csize[i]*0.98;
      }
    }
    i = i + 1;
  }
  //----------------SQUARE--------------------
  
//  if (ssize < 13){
//  fill(0,0,0,100);}
//  
//  else{
//  fill(170,2,193,100);
// }
  
   //Draws the graphic
  int k = 0;
  while (k < amo){
    rect(sxpos[k],sypos[k], ssize[k], ssize[k]);
    k = k + 1;
  }
  
  //Checks size
  int a = 0;
  while (a < amo){
    
    float distance = dist(sxpos[a], sypos[a], mouseX, mouseY);
    if(distance < ssize[a]) {
      if(ssize[a] <= 13) {
        ssize[a] = ssize[a] + 50;
      }
    } else {
      if(ssize[a] > 13) {
        ssize[a] = ssize[a]*0.98;
      }
    }
    a = a + 1;
  }
  //-----------------TRIANGLE----------------
  fill(0,0,0,100);
     //Draws the graphic
  int tr = 0;
  while (tr < amo){
    triangle(tpoint1[tr],tpoint2[tr], tpoint3[tr], tpoint4[tr], tpoint5[tr], tpoint6[tr]);
    tr = tr + 1;
  }
  
  //Checks size
  int t = 0;
  int tsize = 6;
  while (t < amo){
    
    float distance = dist(tpoint1[t], tpoint2[t] + 6, mouseX, mouseY);
    if(distance < tsize) {
      if(tsize <= 6) {
      tpoint1[t] = tpoint1[t] + 20;
      tpoint3[t] = tpoint3[t] - 20;
        tpoint5[t] = tpoint5[t] + 20;
        tsize = tsize + 10;
        
      }
    } else {
      if(tsize > 6) {
         tpoint1[t] = tpoint1[t] - 20;
        tpoint3[t] = tpoint3[t]+20;
        tpoint5[t] = tpoint5[t]-20;
        tsize = tsize - 10;
      }
    }
    t = t + 1;
  }
    //------------CIRCLE----------------
  noStroke();
  //Draws the graphic
  int j2 = 0;
  while (j2 < amo){
    ellipse(xpos2[j2],ypos2[j2], csize2[j2], csize2[j2]);
    j2 = j2 + 1;
  }
  
  //Checks size
  int i2 = 0;
  while (i2 < amo){
    
    float distance = dist(xpos2[i2], ypos2[i2], mouseX, mouseY);
    if(distance < csize2[i2]/2) {
      if(csize2[i2] <= 15) {
        csize2[i2] = csize2[i2] + 80;
      }
    } else {
      if(csize2[i2] > 15) {
        csize2[i2] = csize2[i2]*0.98;
      }
    }
    i2 = i2 + 1;
  }
}

 

void mousePressed() { 
 //-------------CIRCLE---------------------- 
  int i = 0;
  while (i < amo){
    
    float distance = dist(xpos[i], ypos[i], mouseX, mouseY);
    if(distance < csize[i]/2) {
      csize[i] = 0;
    }
    i = i + 1;
  }
  //----------------SQUARE-----------------
    int a = 0;
  while (a < amo){
    
    float distance = dist(sxpos[a], sypos[a], mouseX, mouseY);
    if(distance < ssize[a]/2) {
      ssize[a] = 0;
    }
    a = a + 1;
  }

}

void mouseMoved() {  

} 


