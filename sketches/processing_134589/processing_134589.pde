
void setup() {
       size(600, 600);
       background(245, 79, 80, random(90));
       smooth(30);
       stroke (0);
       strokeWeight(2);
       frameRate(200);
}

float t = 5;
float ax = 200;
float ay = 150;
float bx = 8;
float by = 5*t;
float cx = 0.0;
float cy = 0.5+t;
 
float velocidade = 0.003;
 
void draw() {
  stroke (0);
       strokeWeight(2);
        float x = ax*cos(bx*t+cx+10)+width/2;
        float y = ay*sin(by*t+cy)+height/2;  
        t += velocidade;
        point(x,y);
}

