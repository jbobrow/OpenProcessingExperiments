
//John Gray
//Time Project

float w, h, r, g, b;
float n;
int index = 10;
float z = 0.0f;
int lastMillis = 0;
int x;
void setup() {

  size(1024, 768);
  smooth();
  w = width*.5;
  h = height*.5;
}
void draw() {
  background(0);
  lastMillis = millis();

  n = sin(index*0.0015f)*5.0f+35.0f;
  for (int i = 0; i < n; i++) {
    float t= float(i)/n*PI*3.1;

    r = sin(t)*(sin(index*0.01f)*0.2f)+0.05f;
    b= tan(index*0.04f)*0.3f+0.7f;
    t = (float)(millis()-lastMillis)*100.0f;
    z = (float)(millis()-lastMillis)*30.0f;

    float a1= (sin(index*(sin(index*0.0025f+t)*0.01f+0.01f))*0.5f+0.5f)*PI*2;
    float a2= (sin(a1*index*0.0005f+t)*1.3f+0.9f)*PI;
    float r= h*1.75f*(1.0f-float(i)/n);

    strokeWeight(sin(index*0.0125f+t)*5.0f+5.005f);

    fill(t, z, random(255));

    stroke(random(255), random(255), random(255));
    arc(w, h, r, r, a1, a2);

    strokeWeight(sin(index*0.0125f+t)*5.0f+5.05f);

    fill(t, t, z*random(25));

    strokeWeight(sin(index*0.0125f+t)*5.0f+5.05f);

    fill(z, z, t*random(255));

    stroke(random(255), random(255), random(255));

    textSize(200);
    stroke(90);
    text(millis()/1000, width/16, height);

    textSize(24);

    text("seconds", width/3, height);
  }

  index++;
}



