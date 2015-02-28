
//Nicholas Tang
//3/9/11
class fish {
  
  int len = 98;
  float[][] tailPath;
  float[] pos, target;
  float dx = 0.4/3, th, nth, dTh = 4*dx/60, phi0, fisht, randt;
  color fcolor;
  PGraphics fishskin;
  boolean chasingfood;
  
  fish(float pos1, float pos2, float th1, color fcolor1, PGraphics fishskin1) {
    tailPath = new float[4][len];
    pos = new float[2];
    phi0 = random(2*PI);
    th = th1;
    nth = th;
    for (int i = 1; i < len; i++) {
      tailPath[1][i] = (i-1)*dx*sin(th)+pos1;
      tailPath[2][i] = (i-1)*dx*cos(th)+pos2;
      tailPath[3][i] = th;
    }
    pos[0] = pos1;
    pos[1] = pos2;
    fcolor = fcolor1;
    fishskin = fishskin1;
    fisht = 0;
    randt = round(random(50));
    boolean chasingfood = false;
    target = new float[2];
  }
  
  void display(float t) {
    int len2 = -31;
    int lenfin = 40;
    float[] y2 = new float[len];
    float[] thickness = new float[len];
    float[] tailR = new float[len];
    float[] tailL = new float[len];
    float[][] pHeadR = new float[3][abs(len2)];
    float[][] pHeadL = new float[3][abs(len2)];
    float[][] pFinR = new float[3][lenfin];
    float[][] pFinL = new float[3][lenfin];
    float[][] pEyeR = new float[3][lenfin];
    float[][] pEyeL = new float[3][lenfin];
    float[][] pTailR = new float[3][len];
    float[][] pTailL = new float[3][len];
    float squareScale = (60/8)*3;
    float phi = t*(PI/15)*(sp/17)+phi0;
    float w = 0.2*squareScale;
    for (int i = 1; i < len; i++) {
      y2[i] = (squareScale*exp(0.1/1.25*((i-1)*dx-30))-squareScale*exp(0.1/1.25*(-30)))*cos(0.2*(i-1)*dx-phi);
      thickness[i] = w*(cos(PI/(len*dx)*(i-1)*dx)+1)*0.5*int((i-1)<len);
      tailR[i] = y2[i] + thickness[i];
      tailL[i] = y2[i] - thickness[i];
      pTailR[1][i] = tailR[i]*cos(tailPath[3][i])+3*tailPath[1][i]-3*pos[0];
      pTailR[2][i] = tailR[i]*sin(tailPath[3][i])+3*tailPath[2][i]-3*pos[1];
      pTailL[1][i] = tailL[i]*cos(tailPath[3][i])+3*tailPath[1][i]-3*pos[0];
      pTailL[2][i] = tailL[i]*sin(tailPath[3][i])+3*tailPath[2][i]-3*pos[1];
    }
    for (int i = 1; i < abs(len2); i++) {
      pHeadR[1][i] = (sqrt(1-pow(((i+len2)*dx),2)/pow(4,2))*w)*cos(th)+3*((i+len2)*dx)*cos(th-PI/2);
      pHeadR[2][i] = (sqrt(1-pow(((i+len2)*dx),2)/pow(4,2))*w)*sin(th)+3*((i+len2)*dx)*sin(th-PI/2);
      pHeadL[1][i] = -(sqrt(1-pow(((i+len2)*dx),2)/pow(4,2))*w)*cos(th)+3*((i+len2)*dx)*cos(th-PI/2);
      pHeadL[2][i] = -(sqrt(1-pow(((i+len2)*dx),2)/pow(4,2))*w)*sin(th)+3*((i+len2)*dx)*sin(th-PI/2);
    }
    float scfin = (PI/3)/lenfin;
    float sceye = (2*PI)/lenfin;
    float ecc = 1.25;
    float sc = 0.15*3;
    float eyex = 2.5*3;
    float eyey = (7*w)/16;
    for (int i = 1; i < lenfin; i++) {
      pFinR[1][i] = w*cos(th)+3*2*sin(3*(i-1)*scfin)*sin((i-1)*scfin+PI/6+PI/2+PI/24-th);
      pFinR[2][i] = w*sin(th)+3*2*sin(3*(i-1)*scfin)*cos((i-1)*scfin+PI/6+PI/2+PI/24-th);
      pFinL[1][i] = -w*cos(th)+3*2*sin(3*(i-1)*scfin)*sin((i-1)*scfin+PI/6+PI/3+PI/2-PI/24-th); 
      pFinL[2][i] = -w*sin(th)+3*2*sin(3*(i-1)*scfin)*cos((i-1)*scfin+PI/6+PI/3+PI/2-PI/24-th);
      pEyeR[1][i] = eyey*cos(th)+eyex*sin(-th)+sc*(ecc*sin((i-1)*sceye)*cos(th+PI/2)-cos((i-1)*sceye)*sin(th+PI/2)); 
      pEyeR[2][i] = eyey*sin(th)+eyex*cos(-th)+sc*(cos(th+PI/2)*cos((i-1)*sceye)+ecc*sin((i-1)*sceye)*sin(th+PI/2));
      pEyeL[1][i] = -eyey*cos(th)+eyex*sin(-th)+sc*(ecc*sin((i-1)*sceye)*cos(th+PI/2)-cos((i-1)*sceye)*sin(th+PI/2)); 
      pEyeL[2][i] = -eyey*sin(th)+eyex*cos(-th)+sc*(cos(th+PI/2)*cos((i-1)*sceye)+ecc*sin((i-1)*sceye)*sin(th+PI/2));
    }
    pg.colorMode(HSB,360);
    pg.pushMatrix();
    pg.translate(width/2+sp*pos[0],height/2+sp*pos[1]);
    
    pg.fill(color(hue(fcolor),saturation(fcolor)-50,brightness(fcolor),300));
    pg.stroke(color(hue(fcolor),saturation(fcolor)-50,brightness(fcolor),300));
    drawShape(lenfin,pFinR);
    drawShape(lenfin,pFinL);
    pg.noStroke();
    pg.beginShape(TRIANGLE_STRIP);
    pg.texture(fishskin);
    for (int i = 1; i < abs(len2); i++) {
      pg.vertex(pHeadL[1][i]/.4,pHeadL[2][i]/.4,fishskin.width-i,fishskin.height);
      pg.vertex(pHeadR[1][i]/.4,pHeadR[2][i]/.4,fishskin.width-i,0);
    }
    for (int i = 1; i <= len-15; i++) {
      pg.vertex(pTailL[1][i]/.4,pTailL[2][i]/.4,fishskin.width-(i-1+abs(len2)),fishskin.height);
      pg.vertex(pTailR[1][i]/.4,pTailR[2][i]/.4,fishskin.width-(i-1+abs(len2)),0);
    }
    pg.endShape();
    pg.beginShape();
    for (int i = len-15; i < len; i++) {
      pg.vertex(pTailR[1][i]/.4,pTailR[2][i]/.4);
    }
    for (int i = len-1; i > len-1-15; i--) {
      pg.vertex(pTailL[1][i]/.4,pTailL[2][i]/.4);
    }
    pg.endShape();
    pg.fill(0);
    pg.stroke(0);
    drawShape(lenfin,pEyeR);
    drawShape(lenfin,pEyeL);
    pg.popMatrix();
  }
  
  void update() {
    float diffth = nth-th;
    diffth = diffth%(2*PI);
    if (sign(diffth) == -1){
      diffth = diffth+2*PI;
    }
    if (diffth > PI){
      diffth = diffth-2*PI;
    }
    if (abs(diffth)>abs(dTh)){
        th = th + sign(diffth)*dTh;
    }
    pos[0] = pos[0]+dx*cos(th+PI/2);
    pos[1] = pos[1]+dx*sin(th+PI/2);
    float[][] newtailPath = new float[4][len];
    newtailPath[1][1] = pos[0];
    newtailPath[2][1] = pos[1];
    newtailPath[3][1] = th;
    for (int i = 1; i < len-1; i++) {
      newtailPath[1][i+1] = tailPath[1][i];
      newtailPath[2][i+1] = tailPath[2][i];
      newtailPath[3][i+1] = tailPath[3][i];
    }
    tailPath = newtailPath;
  }
}

void drawShape(int len, float[][] shapes){
  pg.beginShape();
  for (int i = 1; i < len; i++) {
    pg.vertex(shapes[1][i]/.4,shapes[2][i]/.4);
  }
  pg.endShape();
}

float sign(float a){
  if (a > 0){
    return 1;
  } else if (a == 0){
    return 0;
  } else{
    return -1;
  }
}

