
//Nicholas Tang
//3/25/11
class fish {

  int len = 98, sp1, cp = 7, r = int(len/(cp-1));
  float[][] tailPath, cpoints;
  PVector pos, target, npos, vel;
  float dx = 0.4/3, th, vth, fisht, randt, ath, halfth, nth1, vth0 = 4*dx/60, acc, nsp, twist, newth, phi0, twist0, sz;
  color fcolor;
  PGraphics fishskin;
  boolean chasingfood;

  fish(float pos1, float pos2, float th1, int fcolor1, PGraphics fishskin1) {
    sp1 = sp10;
    //sz = 3 + 0.3*sqrt(2*log(1/(1-random(1))));
    sz = 3.35 + 0.225*sqrt(-2*log(random(1)))*sinLUT(TWO_PI*random(1));
    phi0 = random(TWO_PI);
    twist0 = 0;
    tailPath = new float[3][len];
    cpoints = new float[3][cp];
    pos = new PVector(pos1, pos2);
    npos = new PVector(pos1/sp1, pos2/sp1);
    vel = new PVector();
    th = th1;
    halfth = 0;
    nth1 = th;
    for (int i = 0; i < len; i++) {
      tailPath[0][i] = i*dx*sinLUT(th)+pos1/sp1;
      tailPath[1][i] = i*dx*cosLUT(th)+pos2/sp1;
      tailPath[2][i] = th;
    }
    for (int i = 0; i < cp; i++) {
      cpoints[0][i] = i*dx*sinLUT(th)+pos1/sp1;
      cpoints[1][i] = i*dx*cosLUT(th)+pos2/sp1;
      cpoints[2][i] = th;
    }
    fcolor = fcolor1;
    fishskin = fishskin1;
    fisht = 0;
    randt = round(random(50));
    boolean chasingfood = false;
    target = new PVector();
    vth = vth0;
    ath = dx/45;
    acc = 2;
    nsp = sp1;
  }

  void display() {
    int len2 = -31;
    int lenfin = 40;
    float[] y2 = new float[len];
    float[] thickness = new float[len];
    float[] tailR = new float[len];
    float[] tailL = new float[len];
    float[][] pHeadR = new float[2][abs(len2)];
    float[][] pHeadL = new float[2][abs(len2)];
    float[][] pFinR = new float[2][lenfin];
    float[][] pFinL = new float[2][lenfin];
    float[][] pEyeR = new float[2][lenfin];
    float[][] pEyeL = new float[2][lenfin];
    float[][] pTailR = new float[2][len];
    float[][] pTailL = new float[2][len];
    float squareScale = (60/8)*sz;
    float w = 0.22*squareScale;
    float s = 1;
    newth = atan2((sz/s)*abs(len2)*dx*cosLUT(-th)+sz*twist*sinLUT(th),(sz/s)*abs(len2)*dx*sinLUT(-th)+sz*twist*cosLUT(th))+3*HALF_PI;
    for (int i = 0; i < len-10; i++) {
      y2[i] = (squareScale*exp(0.1/1.25*(i*dx-30))-squareScale*exp(0.1/1.25*(-30)));
      thickness[i] = w*(cosLUT(PI/(len*dx)*i*dx)+1)*0.5*int(i<len);
      tailR[i] = y2[i] + thickness[i];
      tailL[i] = y2[i] - thickness[i];
      pTailR[0][i] = tailR[i]*cosLUT(tailPath[2][i])+sz*tailPath[0][i]-sz*npos.x;
      pTailR[1][i] = tailR[i]*sinLUT(tailPath[2][i])+sz*tailPath[1][i]-sz*npos.y;
      pTailL[0][i] = tailL[i]*cosLUT(tailPath[2][i])+sz*tailPath[0][i]-sz*npos.x;
      pTailL[1][i] = tailL[i]*sinLUT(tailPath[2][i])+sz*tailPath[1][i]-sz*npos.y;
    }
    for (int i = 0; i < abs(len2); i++) {
      pHeadR[0][i] = -sz*twist*cosLUT(th)+(sqrt(1-pow((((i+1)+len2)*dx),2)/pow(4,2))*w)*cosLUT(newth)+sz*(((i+1)+len2)*dx)*cosLUT(newth-HALF_PI);
      pHeadR[1][i] = -sz*twist*sinLUT(th)+(sqrt(1-pow((((i+1)+len2)*dx),2)/pow(4,2))*w)*sinLUT(newth)+sz*(((i+1)+len2)*dx)*sinLUT(newth-HALF_PI);
      pHeadL[0][i] = -sz*twist*cosLUT(th)-(sqrt(1-pow((((i+1)+len2)*dx),2)/pow(4,2))*w)*cosLUT(newth)+sz*(((i+1)+len2)*dx)*cosLUT(newth-HALF_PI);
      pHeadL[1][i] = -sz*twist*sinLUT(th)-(sqrt(1-pow((((i+1)+len2)*dx),2)/pow(4,2))*w)*sinLUT(newth)+sz*(((i+1)+len2)*dx)*sinLUT(newth-HALF_PI);
    }
    float scfin = (PI/3)/lenfin;
    float sceye = (TWO_PI)/lenfin;
    float ecc = 1.25;
    float sc = 0.15*sz;
    float eyex = 2.5*sz;
    float eyey = (7*w)/16;
    for (int i = 0; i < lenfin; i++) {
      pFinR[0][i] = -sz*twist*cosLUT(th)+2*sinLUT(-newth)+w*cosLUT(newth)+sz*2*sinLUT(3*i*scfin)*sinLUT(i*scfin+PI/6+HALF_PI+PI/24-newth);
      pFinR[1][i] = -sz*twist*sinLUT(th)+2*cosLUT(-newth)+w*sinLUT(newth)+sz*2*sinLUT(3*i*scfin)*cosLUT(i*scfin+PI/6+HALF_PI+PI/24-newth);
      pFinL[0][i] = -sz*twist*cosLUT(th)+2*sinLUT(-newth)-w*cosLUT(newth)+sz*2*sinLUT(3*i*scfin)*sinLUT(i*scfin+PI/6+PI/3+HALF_PI-PI/24-newth); 
      pFinL[1][i] = -sz*twist*sinLUT(th)+2*cosLUT(-newth)-w*sinLUT(newth)+sz*2*sinLUT(3*i*scfin)*cosLUT(i*scfin+PI/6+PI/3+HALF_PI-PI/24-newth);
      pEyeR[0][i] = -sz*twist*cosLUT(th)+eyey*cosLUT(newth)+eyex*sinLUT(-newth)+sc*(ecc*sinLUT(i*sceye)*cosLUT(newth+HALF_PI)-cosLUT(i*sceye)*sinLUT(newth+HALF_PI)); 
      pEyeR[1][i] = -sz*twist*sinLUT(th)+eyey*sinLUT(newth)+eyex*cosLUT(-newth)+sc*(cosLUT(newth+HALF_PI)*cosLUT(i*sceye)+ecc*sinLUT(i*sceye)*sinLUT(newth+HALF_PI));
      pEyeL[0][i] = -sz*twist*cosLUT(th)-eyey*cosLUT(newth)+eyex*sinLUT(-newth)+sc*(ecc*sinLUT(i*sceye)*cosLUT(newth+HALF_PI)-cosLUT(i*sceye)*sinLUT(newth+HALF_PI)); 
      pEyeL[1][i] = -sz*twist*sinLUT(th)-eyey*sinLUT(newth)+eyex*cosLUT(-newth)+sc*(cosLUT(newth+HALF_PI)*cosLUT(i*sceye)+ecc*sinLUT(i*sceye)*sinLUT(newth+HALF_PI));
    }
    pg.pushMatrix();
    pg.translate(width/2+pos.x,height/2+pos.y);
    pg.fill(palette2[fcolor]);
    pg.stroke((palette2[fcolor] & 0xffffff) | (89 << 24));
    drawShape(lenfin,pFinR);
    drawShape(lenfin,pFinL);
    pg.fill((palette2[fcolor] & 0xffffff) | (142 << 24));
    pg.noStroke();
    pg.beginShape(TRIANGLE_STRIP);
    pg.texture(fishskin);
    for (int i = 0; i < abs(len2); i++) {
      pg.vertex(pHeadL[0][i]/.4,pHeadL[1][i]/.4,fishskin.width-i,fishskin.height);
      pg.vertex(pHeadR[0][i]/.4,pHeadR[1][i]/.4,fishskin.width-i,0);
    }
    for (int i = 0; i <= len-15-10; i++) {
      pg.vertex(pTailL[0][i]/.4,pTailL[1][i]/.4,fishskin.width-(i-1+abs(len2)),fishskin.height);
      pg.vertex(pTailR[0][i]/.4,pTailR[1][i]/.4,fishskin.width-(i-1+abs(len2)),0);
    }
    pg.endShape();
    pg.beginShape();
    for (int i = len-15-10; i < len-10; i++) {
      pg.vertex(pTailR[0][i]/.4,pTailR[1][i]/.4);
    }
    for (int i = len-1-10; i > len-1-15-10; i--) {
      pg.vertex(pTailL[0][i]/.4,pTailL[1][i]/.4);
    }
    pg.endShape();
    pg.fill(0);
    pg.stroke(0);
    drawShape(lenfin,pEyeR);
    drawShape(lenfin,pEyeL);
    pg.popMatrix();

    if (chasingfood) {
      if (nsp > sp1) {
        twist0+=0.07;
      } 
      else {
        twist0-=0.05;
      }
      twist0 = constrain(twist0,0,0.3);
      twist = twist0*sinLUT(t*(QUARTER_PI)+phi0);
    } 
    else {
      if ((abs(nsp-sp1)<10) && (fisht > 5+randt - 6)) {
        twist0+=0.05;
      } 
      else {
        twist0-=0.005;
      }
      twist0 = constrain(twist0,0,0.4);
      twist = twist0*sinLUT(t*(PI/10)+phi0);
    }
    //twist = twist0*sinLUT(t*(PI/(4+(abs(nsp-75)/10)))+phi0);
  }

  void update() {
    updateangle(nth1);
    updatespeed();
    npos.x += dx*cosLUT(th+HALF_PI);
    npos.y += dx*sinLUT(th+HALF_PI);
    float[][] newcpoints = new float[3][cp];
    newcpoints[0][0] = npos.x-twist*cosLUT(th);
    newcpoints[1][0] = npos.y-twist*sinLUT(th);
    newcpoints[2][0] = newth;
    for (int i = 0; i < cp-1; i++) {
      newcpoints[0][i+1] = cpoints[0][i] + dx*r*cosLUT((cpoints[2][i]+cpoints[2][i+1])/2-HALF_PI);
      newcpoints[1][i+1] = cpoints[1][i] + dx*r*sinLUT((cpoints[2][i]+cpoints[2][i+1])/2-HALF_PI);
      newcpoints[2][i+1] = cpoints[2][i];
    }
    cpoints = newcpoints;
    for (int i = 0; i < cp-1; i++) {
      tailPath[0][i*r] = cpoints[0][i];
      tailPath[1][i*r] = cpoints[1][i];
      tailPath[2][i*r] = cpoints[2][i];
      for (int j = 1; j < r; j++) {
        tailPath[0][i*r+j] = curvePoint(cpoints[0][max(i-1,0)],cpoints[0][i],cpoints[0][i+1],cpoints[0][min(i+2,cp-1)],j*1./r);
        tailPath[1][i*r+j] = curvePoint(cpoints[1][max(i-1,0)],cpoints[1][i],cpoints[1][i+1],cpoints[1][min(i+2,cp-1)],j*1./r);
        tailPath[2][i*r+j] = atan2(curveTangent(cpoints[1][max(i-1,0)],cpoints[1][i],cpoints[1][i+1],cpoints[1][min(i+2,cp-1)],j*1./r),
        curveTangent(cpoints[0][max(i-1,0)],cpoints[0][i],cpoints[0][i+1],cpoints[0][min(i+2,cp-1)],j*1./r))+HALF_PI;
      }
    }
  }

  void updateangle(float nth) {
    float diffth = nth-th;
    if (sign(nth1-th) != sign(diffth)) {
      vth = vth0;
    }
    nth1 = nth;
    halfth = -vth*((vth-vth0)/ath)+(ath/2)*pow((vth-vth0)/ath,2);
    if (abs(diffth) > abs(vth)) {
      if (abs(diffth) > abs(halfth)) {
        vth += ath;
      } 
      else {
        vth -= ath;
      }
      vth = max(vth, vth0);
      th += sign(diffth)*vth;
    } 
    else {
      th += diffth;
      vth = vth0;
    }
  }
  void updatespeed() {
    float diffsp = nsp - sp1;
    if (abs(diffsp) > acc) {
      if (sign(diffsp) == 1) {
//        ripple(int(pos.x+width/2+cosLUT(th+HALF_PI)*31),int(pos.y+height/2+sinLUT(th+HALF_PI)*31),
//        int(pos.x+width/2+cosLUT(th+HALF_PI)*31),int(pos.y+height/2+sinLUT(th+HALF_PI)*31));
        sp1 += acc*2;
      } 
      else {
        sp1 -= acc;
      }
    } 
    else {
      sp1 += diffsp;
    }
    vel.set(sp1*dx*cosLUT(th+HALF_PI), sp1*dx*sinLUT(th+HALF_PI),0);
    pos.add(vel);
  }
}

void drawShape(int len, float[][] shapes) {
  pg.beginShape();
  for (int i = 0; i < len; i++) {
    pg.vertex(shapes[0][i]/.4,shapes[1][i]/.4);
  }
  pg.endShape();
}


