

int num=5;
int i;
float[] x= new float[num];
float[] y= new float[num];
float[] v= new float[num];
float[] vy= new float[num];
float color1=(255);
float color2=(255);
float color3=(255);

void setup() {
  size(800, 800);
  for (int i=0; i<num; i++) {
    x[i]=width/2;
    y[i]=height/2;
    v[i]=random (-2, 5);
    vy[i]=random (-2, 5);
  }
}

void draw() {
  background(85, 255, 251);

    for (int i=0; i<num; i++) {
      x[i] += random(-8, 8);
      y[i] += random(-8, 8);

      if (x[i]-170<0) {
        v[i]=-v[i];
        x[i]=170;
      }
      if (x[i]+170>width) {
        v[i]=-v[i];
        x[i]=width-170;
      }
      if (y[i]-100<0) {
        vy[i]=-vy[i];
        y[i]=100;
      }
      if (y[i]+200>height) {
        vy[i]=-vy[i];
        y[i]=height-200;
      }
     stroke(0,0,0);

  // Cara
  
    fill(240, 219, 177);
    ellipse(x[i], y[i], 300, 200);
  

  // Orelles
  
    ellipse(x[i]-158, y[i], 20, 30);
    line(x[i]-160, y[i], x[i]-155, y[i]-5);
    line(x[i]-160, y[i], x[i]-158, y[i]+8);
    ellipse(x[i]+158, y[i], 20, 30);
    line(x[i]+160, y[i], x[i]+155, y[i]-5);
    line(x[i]+160, y[i], x[i]+158, y[i]+8);
  

  // Ull 1
  
    fill(color1, color2, color3);
    ellipse(x[i]-80, y[i]-20, 50, 50);
    fill(240, 219, 177);
    arc(x[i]-80, y[i]-15, 50, 40, 0, PI);
    line(x[i]-104, y[i]-15, x[i]-56, y[i]-15);
    fill(0, 0, 0);
    ellipse(x[i]-80, y[i]-20, 5, 5);
    line(x[i]-90, y[i]-60, x[i]-60, y[i]-50);
  

  // Ull 2
  
    fill(color1, color2, color3);
    ellipse(x[i]+80, y[i]-20, 50, 50);
    fill(240, 219, 177);
    arc(x[i]+80, y[i]-15, 50, 40, 0, PI);
    line(x[i]+56, y[i]-15, x[i]+104, y[i]-15);
    fill(0, 0, 0);
    ellipse(x[i]+80, y[i]-20, 5, 5);
    line(x[i]+60, y[i]-50, x[i]+90, y[i]-60);
  

  // Nas
  
    line(x[i], y[i]+10, x[i]+10, y[i]+20);
    line(x[i]+10, y[i]+20, x[i], y[i]+30);
  

  // Boca
  
    line(x[i]-20, y[i]+60, x[i]+30, y[i]+60);
    line(x[i]-20, y[i]+60, x[i]-25, y[i]+57);
    line(x[i]+30, y[i]+60, x[i]+25, y[i]+50);
    line(x[i]+25, y[i]+60, x[i]+15, y[i]+70);
  

  // Cos
  
    if (x[i]<width/2) {
      fill(250, 255, 18);
      rect(x[i]-100, y[i]+100, 200, 100, 30);
      fill(255, 0, 0);
      noStroke();
      rect(x[i]-60, y[i]+100, 30, 100);
      noStroke();
      rect(x[i]+40, y[i]+100, 30, 100);
      noStroke();
      rect(x[i]-30, y[i]+150, 70, 50);
      fill(250, 255, 18);
      ellipse(x[i]-45, y[i]+165, 15, 15);
      ellipse(x[i]+55, y[i]+165, 15, 15);
    }
    else {
      fill(240, 219, 177);
      rect(x[i]-100, y[i]+100, 200, 100, 30);
      fill(247, 211, 142);
      ellipse(x[i]-45, y[i]+165, 15, 15);
      ellipse(x[i]+55, y[i]+165, 15, 15);
      fill(252, 157, 122);
      ellipse(x[i]-45, y[i]+165, 5, 5);
      ellipse(x[i]+55, y[i]+165, 5, 5);
    }
    }
}

 

  
    void mousePressed() {
    x[i]=mouseX;
    y[i]=mouseY;
    v[i] = random(-5, 5);
    vy[i] = random(-5, 5);
    color1=random(255);
    color2=random(255);
    color3=random(255);
  }



