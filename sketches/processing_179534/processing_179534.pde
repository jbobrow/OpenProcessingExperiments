
PImage noisep;
float r;
int x;
int y;
int x_prev;
int y_prev;
int w;
int h;
float time;
int evener = 0;
float randark;
float[] speedr = new float[5];
float noiseVal;
float noiseScale=0.1;
int[] distr = new int[6];
float[] sizer = new float[6];
float[] speedr2 = new float[6];
float[] posr = new float[6];
int item;



void setup() {
  size(640,640);
  stroke(255);
  w = width;
  h = height;
  rectMode(CORNER);
  ellipseMode(CENTER);
  noisep = createImage(width,height,RGB);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      noiseDetail(3,0.5);
      noiseVal = noise((x) * noiseScale, (y) * noiseScale);
      stroke(139 + noiseVal*29,144 + noiseVal*24,130 + noiseVal*26);
      point(x,y);
    }
  }
  noisep = get(0,0,width,height);
  speedr[0] = random(0.06,0.15);
speedr[1] = random(0.06,0.15);
speedr[2] = random(0.06,0.15);
speedr[3] = random(0.06,0.15);
speedr[4] = random(0.06,0.15);
speedr = sort(speedr);
for (item = 0; item < 6; item += 1) {
    distr[item] = int(random(200));
    sizer[item] = random(0.1);
    speedr2[item] = random(0.06,0.15);
    posr[item] = random(3);
  }
}

void draw() {
  time = 0.001*millis() + 0.01*mouseX;
  image(noisep,0,0,width,height);
 for (float theta = 0; theta < 2*PI; theta += 0.01) {
   stroke(0);
   r = constrain((0.195*0.20*width*width) / (dist(0,0,0.195*width*cos(theta + time),0.20*width*sin(theta + time))),0,width/2);
   x = width/2 +  int(r*cos(theta));
   y = height/2 + int(r*sin(theta));
   evener += 1;
   if (evener%2 == 0) {
     line(x,y,(x-width/2)*100 + width/2, (y - height/2)*100 + height/2);
   }
   line(x_prev,y_prev,x,y);
   x_prev = x;
   y_prev = y;
   if (evener%20 == 0) {
     planet(300,0.23,speedr[1],2.4);
     planet(200,0.17,speedr[2],2.6);
     planet(220,0.23,speedr[3],2.9);
     planet(200,0.23,speedr[4],3.3);
     planet(128,0.15,speedr[0],2.6);
     planet(128,0.15,speedr[0] + 0.01,3.0);
     planet(128,0.07,speedr[0],2.6);
     planet(128,0.07,speedr[0] + 0.01,3.0);
     for (item = 0; item < 6; item += 1) {
       planet(distr[item],sizer[item],speedr2[item],posr[item]);
     }
     
   randark = random(1);
   stroke(randark*128 + 40,randark*134 + 40,randark*116 + 40);
   rect(random(width),random(height),1,1);
   }
 }
 noStroke();
 fill(168,174,156,20);
 ellipse(random(width),random(height),random(100),random(100));
}

void planet(int dist, float size, float speed, float pos) {
  float cx = width/2 + int(dist*cos((speed * time) + pos));
  float cy = height/2 + int(dist*sin((speed * time) + pos));
  pushMatrix();
  translate(cx,cy);
  rotate((speed*time) + pos + PI/4);
  translate(-cx,-cy);
  if (int(time*20)%2 == 0) {
  line(cx - (x - width/2)*size, (y - height/2)*size + cy, (x - width/2)*size + cx, (y - height/2)*size + cy);
  }
  else {
  line(cx + (x - width/2)*size, cy - (y - height/2)*size, (x - width/2)*size + cx, (y - height/2)*size + cy);
  }
  popMatrix();
  //println((speed*time) + pos);
}

