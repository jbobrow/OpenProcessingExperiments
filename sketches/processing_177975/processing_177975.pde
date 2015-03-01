
int r3 = 200;
int r2 = 100;
int r1 = 20;
int raw = 18  ;
int col = 18;
int step = 30;
float[]xLine = new float[raw*col];
float[]yLine = new float[raw*col];
void setup(){
  
  
  size(1000,1000);
  background(0);
  smooth(8);
}

void draw(){
  if (mousePressed == true) {
    colorMode(HSB, 255);
  } else {
    colorMode(RGB,255);
  }
  
  //
  float[]x = new float[col];
  float[]y = new float[raw];
  float[][]xy = {x,y};
  
  float[]colorDotR = new float[raw*col];
  float[]colorDotB = new float[raw*col];
  float[]colorDotG = new float[raw*col];
  
  float[]distMouse = new float[raw*col];
  float[]weight = new float[raw*col];
  //
  noCursor();
  for(int n = 0; n<2; n++){
    for(int m = 0; m<col; m++){
      xy[n][m] = (m+1)*step+200;
    }
  }
//
  fill(0,50);
  noStroke();
  rect(0,0,width,height);
  //makePoint(xy);
  //
  for(int p = 0; p<xy[0].length; p++){
    for(int q = 0; q<xy[1].length; q++){
    distMouse[p*col+q] = dist(xy[0][q],xy[1][p],mouseX,mouseY);
     weight[p*col+q] = map(distMouse[p*col+q],0,r3,10,0.1);
       colorDotR[p*col+q] = map(distMouse[p*col+q],0,r3,255,14);
      colorDotG[p*col+q] = map(distMouse[p*col+q],0,r3,0,170);
      colorDotB[p*col+q] = map(distMouse[p*col+q],0,r3,0,255);  
       if(distMouse[p*col+q]<r3){
       //stroke(255);  
       stroke(colorDotR[p*col+q],colorDotG[p*col+q],colorDotB[p*col+q],weight[p*col+q]*20);
       strokeWeight(weight[p*col+q]);
       }
       else{
       stroke(colorDotR[p*col+q],colorDotG[p*col+q],colorDotB[p*col+q],weight[p*col+q]*20);
         strokeWeight(0.1);
       }
    //stroke(255,weight[p*col+q]*10);
     //strokeWeight(1);
    if(p<(col-1) & q<(col -1)){
    line(xLine[p*col + q +1],yLine[p*col + q +1],xLine[p*col + q],yLine[p*col + q]);
    //line(xLine[q*col + p +col],yLine[q*col + p +col],xLine[q*col + p],yLine[q*col + p]);  
  line(xLine[(p+1)*col+q],yLine[(p+1)*col+q],xLine[p*col+q],yLine[p*col+q]);  
  }
    if(q < (col)& (q!= 0) & p==(col-1)){
       line(xLine[p*col + q ],yLine[p*col + q ],xLine[p*col + q-1],yLine[p*col + q-1]);
  }
  if(q==(col-1)&p<(col-1)){
  line(xLine[p*col +q+ col ],yLine[p*col +q+col ],xLine[p*col+q],yLine[p*col+q]);  
  }
}
}
  for(int i = 0; i<xy[0].length; i++){
    for(int j = 0; j<xy[1].length; j++){
      
      distMouse[i*col+j] = dist(xy[0][j],xy[1][i],mouseX,mouseY);
      weight[i*col+j] = map(distMouse[i*col+j],0,r3,30,2);
      colorDotR[i*col+j] = map(distMouse[i*col+j],0,r3,255,14);
      colorDotG[i*col+j] = map(distMouse[i*col+j],0,r3,0,170);
      colorDotB[i*col+j] = map(distMouse[i*col+j],0,r3,0,255);
      
      if(distMouse[i*col+j]<r3){
          if(distMouse[i*col+j]>r1){
            float dotDistance = map(distMouse[i*col+j],r3,r2,0,r1);
            float x2 = dotDistance*( mouseX - xy[0][j])/distMouse[i*col+j] + xy[0][j];
            float y2 = dotDistance*( mouseY - xy[1][i])/distMouse[i*col+j] + xy[1][i];
            xy[0][j] = x2;
            xy[1][i] = y2;
            stroke(colorDotR[i*col+j],colorDotG[i*col+j],colorDotB[i*col+j]);
            strokeWeight(weight[i*col+j]);
            point(xy[0][j],xy[1][i]);
            xLine[i*col+j] = x2;
            yLine[i*col+j] = y2;
          }
//if(distMouse[i*col+j]<r2){
//stroke(255);
//    strokeWeight(weight[i*col+j]*0.1);
//   stroke(colorDotB[i*col+j],120,colorDotG[i*col+j]);
//   line(xy[0][j],xy[1][i],mouseX,mouseY);
//}
//    if((distMouse[i*col+j]>r1) & (distMouse[i*col+j]<r2)){
//        float dotDistance = map(distMouse[i*col+j],r2,0,0,r1);
//        float x2 = dotDistance*( mouseX - xy[0][j])/distMouse[i*col+j] + xy[0][j];
//        float y2 = dotDistance*( mouseY - xy[1][i])/distMouse[i*col+j] + xy[1][i];
//        xy[0][j] = x2;
//        xy[1][i] = y2;
//        point(xy[0][j],xy[1][i]);
//    }
    
    else{
      float dotDistance = map(distMouse[i*col+j],0,r1,0,r1);
      float x2 = dotDistance*( mouseX - xy[0][j])/distMouse[i*col+j] + xy[0][j];
      float y2 = dotDistance*( mouseY - xy[1][i])/distMouse[i*col+j] + xy[1][i];
      xy[0][j] = x2;
      xy[1][i] = y2;
      strokeWeight(weight[i*col+j]);
      stroke(colorDotR[i*col+j],0,colorDotB[i*col+j]);
      point(xy[0][j],xy[1][i]);
      xLine[i*col+j] = x2;
            yLine[i*col+j] = y2;
      }
  }
  for(int n = 0; n<2; n++){
    for(int m = 0; m<col; m++){
      xy[n][m] = (m+1)*step+200;
    }
  }
  if(distMouse[i*col+j]>=r3){
    stroke(14,170,255);
    strokeWeight(2); 
    point(xy[0][j],xy[1][i]);
    xLine[i*col+j] = xy[0][j];
    yLine[i*col+j] = xy[1][i]; 
  }
}
}




}
void makePoint(float[][]pts){
  stroke(255);
  smooth();
  
  for(int i = 0; i<pts[0].length; i++){
    for(int j = 0; j<pts[0].length; j++){
    strokeWeight(10);
    
    point(pts[0][j],pts[1][i]);
    }
  }
}


