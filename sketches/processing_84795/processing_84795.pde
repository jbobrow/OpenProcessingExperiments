
float sincurve = 0;
float ptonex = 0;
float ptoney = 0;
float pt2x = 0;
float pt2y = 0;
void setup() {
  size(400, 400);
}
void draw() {             // try changing what the sincurve is * by
stroke(100, 0, 0);
  ptonex = 200 + sin(sincurve)* ((sin(sincurve*1.5)*100));
  ptoney = 200 + cos(sincurve)* ((100 * sin(sincurve*1.5)));
  line(200, 200, ptonex, ptoney);
  sincurve = sincurve + 0.1;
  stroke(0, 255, 20);
line(200, 200,200+ sin(sincurve/1.5)*25,200+ cos(sincurve/1.5)*25);
}
