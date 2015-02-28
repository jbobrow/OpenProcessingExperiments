
Chart record;
Chart ch2;

void setup() {
  size(500, 100);
  record = new Chart(10, 10, 450, 80);
  record.setup();
  record.maxpoints = 500;
  record.minvalue = -1.0;
  record.maxvalue = 1.0;
  
  ch2 = new Chart(10,10,450,80);
  ch2.setup();
  ch2.maxpoints = 500;
  ch2.minvalue = -1.0;
  ch2.maxvalue = 1.0;
}

void draw() {
  background(200);

  float sin1 = sin( TWO_PI*millis()/10000);
  float cos1 = cos( TWO_PI*millis()/10000);
  
  record.add(sin1);
  record.draw();
  
  ch2.add(cos1);
  ch2.draw();
}

class Chart {
  
  void add(float value) {
    data = append(data, value);
    if(data.length>maxpoints) {
      data = subset(data,1);
    }
  }
  
  int a, b, c, d;
  
  int maxpoints;
  float[] data;
  float minvalue, maxvalue;
  
  Chart(int a, int b, int c, int d) {
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
  }

  void setup() {
    data = new float[0];
  }

  void draw() {
    noFill();
    beginShape();
    for(int i=0 ; i<data.length ; i++) {
      float u = map(i,0,maxpoints,a,a+c);
      float v = map(data[i], minvalue, maxvalue, b+d, b);
      vertex(u,v);
    }
    endShape();
    rect(a, b, c, d);
  }
}



