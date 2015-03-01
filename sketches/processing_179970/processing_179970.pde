
int stars = 1000;
int num = stars;
Ball[] balls = new Ball[stars];
final float GM = 4 * PI * PI;
final float M  = 1.0;
final float dT = 1;

void setup(){
  size(500,500);
  noStroke();
  //frameRate(30);
  for(int i=0; i < stars; i++){
    balls[i] = new Ball(1, random(-width/2 + 100,width/2 -100),
                           random(-height/2 + 100,height/2 - 100), 
                           random(-0.5,0.5), random(-0.5,0.5),
                           color(random(0,255)));
  }
}

void draw(){
  background(0);
  pushMatrix();
  translate(height/2, width/2);
  for(int i = 0; i < stars; i++){
    balls[i].update();
  }
  fill(255);
  ellipse(0,0,20,20);
  popMatrix();
  text(num+"/"+stars,10,20);
}

class Ball{
  float[] qxk = new float[4];
  float[] qyk = new float[4];
  float[] pxk = new float[4];
  float[] pyk = new float[4];
  float radi, posx, posy, speed;
  color clr;
  float qx, qy, px, py;
  boolean drop = false;
  
  Ball(float r, float posx, float posy, float prix, float priy, color c){
    radi = r;
    qx = posx;
    qy = posy;
    px = prix;  
    py = priy;
    clr = c;
  }
  
  void update(){   
    if(drop){
      qx = 0; qy = 0;
    }
    // 中心に近づいたときは捕まえる
    else if((qx > -5 && qx < 5) && (qy > -5 && qy < 5)){
      num--;
      drop = true;
    } else {
      // ルンゲクッタ法で近似計算
      RK( qx, qy, px, py, 0);
      RK( qx+0.5*qxk[0], qy+0.5*qyk[0], px+0.5*pxk[0], py+0.5*pyk[0], 1);
      RK( qx+0.5*qxk[1], qy+0.5*qyk[1], px+0.5*pxk[1], py+0.5*pyk[1], 2);
      RK( qx+qxk[2], qy+qyk[2], px+pxk[2], py+pyk[2], 3);
  
      qx += (qxk[0] +  2*qxk[1] + 2*qxk[2] + qxk[3])*(1.0/6);
      qy += (qyk[0] +  2*qyk[1] + 2*qyk[2] + qyk[3])*(1.0/6);
      px += (pxk[0] +  2*pxk[1] + 2*pxk[2] + pxk[3])*(1.0/6);
      py += (pyk[0] +  2*pyk[1] + 2*pyk[2] + pyk[3])*(1.0/6);
    }
    fill(clr);
    ellipse(qx, qy,radi*2,radi*2);
  }
  
  void RK(float qx, float qy, float px, float py, int n){
    float q, qi3;
    q = sqrt(qx*qx + qy*qy);
    qi3 = 1.0/(q*q*q);
    qxk[n] = px/M*dT;
    qyk[n] = py/M*dT;
    pxk[n] = -GM*M*qx*qi3*dT;
    pyk[n] = -GM*M*qy*qi3*dT; 
  }
}


