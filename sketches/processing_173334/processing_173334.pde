
//noise excercise 15 experiment


size(400,400);
float power = 5;
float d = 11;
noStroke();
for (int y=0; y<height; y++) {
  for (int x =0; x<width; x++) {
    float total =0.0;
    for (float i=d; i>=1; i = i/2.0) {
    total +=noise(x/d,y/d)*d;
    }
      float turbulence=98.0*total/d;
    float base=(x*0.2)+(y*0.12);
    float offset = base+(power*turbulence/255.0);
    float gray = abs(cos(offset))*255.0;
    stroke(gray,140,200);
    point(x,y);
    }
  }




