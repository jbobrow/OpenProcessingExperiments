
 
int num = 2000;
int mun = 2000;
int yup = 2000;

float range = 300;
float delta = 200;
float bRange = 100;

float[] ax = new float[num];
float[] ay = new float[num]; 

float[] bx = new float[mun];
float[] by = new float[mun];

float[] cx = new float[yup];
float[] cy = new float[yup];




void setup() 
{
  //size(640, 360);
  size(displayWidth, displayHeight);
  background(0);
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
  
  for(int m = 0; m < mun; m++) {
    bx[m] = width/2;
    by[m] = height/2;
  }
  
  
  for(int u = 0; u < yup; u++) {
    cx[u] = width/2;
    cy[u] = height/2;
  }
  frameRate(30);
}

void draw() 
{
  //background(51);
  
  // Shift all elements 1 place to the left
  smooth();
  for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
  }
  
  for(int m = 1; m < mun; m++) {
    bx[m-1] = bx[m];
    by[m-1] = by[m];
  }
  
  
  for(int u = 1; u < yup; u++) {
    cx[u-1] = cx[u];
    cy[u-1] = cy[u];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);
  
  bx[mun-1] += random(-delta, delta);
  by[mun-1] += random(-delta, delta);

  cx[yup-1] += random(-bRange, bRange);
  cy[yup-1] += random(-bRange, bRange);


  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);
  
  bx[mun-1] = constrain(bx[mun-1], 0, width);
  by[mun-1] = constrain(by[mun-1], 0, height);
  
  cx[yup-1] = constrain(cx[yup-1], 0, width);
  cy[yup-1] = constrain(cy[yup-1], 0, height);
  
  
  // Draw a line connecting the points
  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
//    for(int l=1; l<mun; l++){
//    float lav = float(l)/mun * 204.0 +51;
//    }

    strokeWeight(.25);
    noFill();
    stroke(val, 5);
    //bezier(ax[i-1], ay[i-1], ax[i], ay[i], bx[l-1], by[l-1], bx[l], by[1]);
    //bezier(ax[i-1], ay[i-1], ax[i], ay[i], 0, 0, 0, 0);
    //line(ax[i-1], ay[i-1], ax[i], ay[i]);
    line(ax[i-1]+4, ay[i-1]+4, ax[i]+4, ay[i]+4);
    //line(ax[i-1]-4, ay[i-1]-4, ax[i]-4, ay[i]-4);
     bezier(ax[i-1]-4, ay[i-1]-4, ax[i]-4, ay[i]-4, ax[i-1]+4, ay[i-1]+4, ax[i]+4, ay[i]+4);
    //fill(255, 10);
    //rect(ax[i]+4, ay[i]+4, 90, 90);
    //rect(ax[i-1]+4, ay[i-1]+4, 90, 90);
    //stroke(200, 10);
    //line(bx[i-1], by[i-1], bx[i], ay[i]);
    
  }
  for(int m=1; m<mun; m++){
    float lav = float(m)/mun * 204.0 +51;
    strokeWeight(.25);
    stroke(lav, 10, 25, 5);
    line(bx[m-1], by[m-1], bx[m], by[m]);
    }
    
   for(int u=1; u<yup; u++){
    float avl = float(u)/yup * 204.0 +51;
    strokeWeight(1.25);
    stroke(avl, 200, 30, 5);
    //line(cx[u-1], cy[u-1], cx[u], cy[u]);
//    beginShape();
//    curveVertex(cx[u-1], cy[u-1]);
//    curveVertex(cx[u-1], cy[u-1]);
//    curveVertex(cx[u], cy[u]);
//    curveVertex(cx[u-1]+9, cy[u-1]+9);
//    endShape();
    
        //line(cx[u-1]+4, cy[u-1]+3, cx[u]+2, cy[u]+1);
           // line(cx[u-1]+1, cy[u-1]+2, cx[u]+3, cy[u]+4);
            
            //arc(cx[u-1]+1, cy[u-1]+2, cx[u]+3, cy[u]+4, PI, HALF_PI);
           // noFill();
           fill(avl, 200, 30, 5);
            strokeWeight(1.25);
            bezier(cx[u-1], cy[u-1], cx[u], cy[u], cx[u-1]+4, cy[u-1]+4, cx[u]+4, cy[u]+4);
            
    }
}


