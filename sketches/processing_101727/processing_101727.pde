
float xposn = width/2;
float yposn = height/2;
int j = 0;
color from = color(204, 102, 0);
color to = color(0, 102, 153);
float colorpos = 0;
float colorchange = 1;

int runs;
float dist;
int it = 9;
float xtrans;
float ytrans;
float[] attractorx = new float[it];
float[] detractorx = new float[it];
float[] attractory = new float[it];
float[] detractory = new float[it];
float[] centrex = new float[it];
float[] centrey = new float[it];
float[] xlen = new float[it];
float[] ylen = new float[it];
int weight;

float boundmult = .01;
float colorinc = 0.0001;
float linelen = 0.001;

void setup()
{
  size(1350, 720);
  background(0);
  strokeWeight(2);
    
    //dot on first i
  attractorx[0]=.27;
  attractory[0]=.3125;
  detractory[0]=.36;
  
    //line of first i
  attractorx[1]=.27;
  attractory[1]=0.46875;
  detractory[1]=.83;
  
    //first l
  attractorx[2]=.38;
  attractory[2]=.21;
  detractory[2]=.83;
  
    //stalk of k
  attractorx[3]=.52;
  attractory[3]=.26;
  detractory[3]=.83;
  
    //top arm of k
  attractorx[4]=.545;
  attractory[4]=.6;
  detractory[4]=.64;
    
    //bottom arm of k
  attractorx[5]=.52;
  attractory[5]=.68;
  detractory[5]=.72;
  
    //bottom leg of k
  attractorx[6]=.61;
  attractory[6]=.68;
  detractory[6]=.83;
  
    //dot of second i
  attractorx[7]=.73;
  attractory[7]=.3125;
  detractory[7]=.36;
  
    //line of second i
  attractorx[8]=.73;
  attractory[8]=0.46875;
  detractory[8]=.83;
  
  for (int j = 0; j <= it-1; j++) {
    detractorx[j]=attractorx[j]+0.029;
  }
  detractorx[4]=attractorx[4]+0.015;
  detractorx[4]=.63;
  detractorx[5]=.63;
  detractorx[6]=.63;
  for (int j = 0; j <= it-1; j++) {
    attractory[j]=attractory[j]-.03;
    detractory[j]=detractory[j]-.03;
    centrex[j]=int(width*((abs(detractorx[j]-attractorx[j])/2)+min(detractorx[j],attractorx[j])));
    centrey[j]=int(height*((abs(detractory[j]-attractory[j])/2)+min(detractory[j],attractory[j])));
    xlen[j]=abs(attractorx[j]-detractorx[j])*width;
    ylen[j]=abs(attractory[j]-detractory[j])*height;
  }
}

void draw()

{
  
  for (int j = 0; j <= it-1; j++) {
    
    if (colorpos < 1 && colorpos > 0)   {
      colorpos += colorchange * colorinc;
    }
    else{
      if (colorpos >= 1) {
        colorchange = -1;
        colorpos += colorchange * colorinc;
        from = color(random(255),random(255),random(255));
      } else {
        colorchange = 1;
        colorpos += colorchange * colorinc;
        to = color(random(255),random(255),random(255));
      }
    }
    if (abs(mouseY-centrey[j])<ylen[j]/2 && abs(mouseX-centrex[j])<xlen[j]/2) {
      dist = random(5);
    }else{
      dist = 1;
    }
    
    stroke(lerpColor(from, to, colorpos*dist));
    strokeWeight(random(0.1)+dist*2);
    
    pushMatrix();
    translate(random(attractorx[j]*width,detractorx[j]*width),random(attractory[j]*height,detractory[j]*height));
    ellipse(0,0,5,5);
    popMatrix();
    if (mousePressed) {
      if (abs(mouseY-centrey[j])<ylen[j]/2 && abs(mouseX-centrex[j])<xlen[j]/2) {
        strokeWeight(weight);
        pushMatrix();
        translate(mouseX,mouseY);
        ellipse(0,0,5,5);
        popMatrix();
      }
    weight = min(weight+2,28);
  }else{
        weight -= 1;
      }
    //ellipse(mouseX,mouseY,5,5);
  }
}


