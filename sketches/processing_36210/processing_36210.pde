
int amo = 336;

int[] xpos = new int[amo];
int[] ypos = new int[amo];
float[] csize = new float[amo];

int[] xpos2 = new int[amo];
int[] ypos2 = new int[amo];
float[] csize2 = new float[amo];

int[] xpos3 = new int[amo];
int[] ypos3 = new int[amo];
float[] csize3 = new float[amo];

int[] xpos4 = new int[amo];
int[] ypos4 = new int[amo];
float[] csize4 = new float[amo];

void setup() { 
  //--------------CIRCLE-------------------
  size (700,400);  
   fill(0);
 rect(350,0,700,200);
 rect(0,200,350,400);
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
 //--------------CIRCLE-------------------
  size (700,400);  
  background (255);
  
  int i2 = 0;
  int x2 = 358;
  int y2 = 208;

  while (i2 < amo) {
    if(x2 >= 705) {
      x2 = 358;
      y2 = y2 + 15;
    }
  
  
    
    xpos2[i2] = 0 + x2;
    ypos2[i2] = y2;
    csize2[i2] = 15;
    
    x2 = x2 + 15;
    i2 = i2 + 1;
  }
  //--------------circle right top
   size (700,400);  
  background (0);
 noStroke();
  
  int i3 = 0;
  int x3 = 358;
  int y3 = 0;

  while (i3 < amo && y3 < 200) {
    if(x3 >= 705) {
      x3 = 358;
      
      y3 = y3 + 15;
    }  
    
    xpos3[i3] = 0 + x3;
    ypos3[i3] = y3;
    csize3[i3] = 15;
    
    x3 = x3 + 15;
    i3 = i3 + 1;
  }
   //--------------circle left bottom
   size (700,400);  
  background (0);
 noStroke();
  
  int i4 = 0;
  int x4 = 0;
  int y4 = 208;

  while (i4 < amo) {
    if(x4 >= 350) {
      x4 = 0;
      y4 = y4 + 15;
    }  
    
    xpos4[i4] = 0 + x4;
    ypos4[i4] = y4;
    csize4[i4] = 15;
    
    x4 = x4 + 15;
    i4 = i4 + 1;
  }
}

void draw() {
 background(255); 
 fill(0);
 rect(350,0,700,200);
 rect(0,200,350,400);
  fill(0,0,0,100);
  
  //------------CIRCLE----------------
  noStroke();
  //Draws the graphic
  int j = 0;
  while (j < amo){
     fill(0,0,0,100); 
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

  //------------CIRCLE----------------

  //Draws the graphic
  int j2 = 0;
  while (j2 < amo){
     fill(0,0,0,100); 
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
    

  
  //--------------2nd square-----------------
  
   //Draws the graphic
  int j3 = 0;
  while (j3 < amo){
     fill(255,255,255,100); 
    ellipse(xpos3[j3],ypos3[j3], csize3[j3], csize3[j3]);
    j3 = j3 + 1;
  }
  
  //Checks size
  int i3 = 0;
  while (i3 < amo){
    
    float distance = dist(xpos3[i3], ypos3[i3], mouseX, mouseY);
    if(distance < csize3[i3]/2) {
      if(csize4[i3] <= 15) {
        csize4[i3] = csize4[i3] + 80;
      }  }  
     
    if(distance > csize3[i3]){
      if(csize4[i3] > 15) {
        csize4[i3] = csize4[i3]*0.98;
      }}
    i3 = i3 + 1;
  }
   //--------------left bottom-----------------
  
   //Draws the graphic
  int j4 = 0;
  while (j4 < amo){
     fill(255,255,255,100); 
    ellipse(xpos4[j4],ypos4[j4], csize4[j4], csize4[j4]);
    j4 = j4 + 1;
  }
  
  //Checks size
  int i4 = 0;
  while (i4 < amo){
    
    float distance = dist(xpos4[i4], ypos4[i4], mouseX, mouseY);
    if(distance < csize4[i4]/2) {
      if(csize3[i4] <= 15) {
        csize3[i4] = csize3[i4] + 80;
      }  }  
    
    if(distance > csize4[i4]){
      if(csize3[i4] > 15) {
        csize3[i4] = csize3[i4]*0.98;
      }}
    i4 = i4 + 1;
  }
 }

 

void mousePressed() {  
  //-------------------------------------------------
  int i = 0;
  while (i < amo){
    
    float distance = dist(xpos[i], ypos[i], mouseX, mouseY);
    if(distance < csize[i]/2) {
      csize2[i] = 0;
    }
    i = i + 1;
  }
  //-------------------------------------------------
  int i2 = 0;
  while (i2 < amo){
    
    float distance2 = dist(xpos2[i2], ypos2[i2], mouseX, mouseY);
    if(distance2 < csize2[i2]/2) {
      csize[i2] = 0;
    }
    i2 = i2 + 1;
  }  //-------------------------------------------------
  int i3 = 0;
  while (i3 < amo){
    
    float distance3 = dist(xpos3[i3], ypos3[i3], mouseX, mouseY);
    if(distance3 < csize3[i3]/2) {
      csize3[i3] = 0;
    }
    i3 = i3 + 1;
  }
    //-------------------------------------------------
  int i4 = 0;
  while (i4 < amo){
    
    float distance4 = dist(xpos4[i4], ypos4[i4], mouseX, mouseY);
    if(distance4 < csize4[i4]/2) {
      csize4[i4] = 0;
    }
    i4 = i4 + 1;
  }
    
}

