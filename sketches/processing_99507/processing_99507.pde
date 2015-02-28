
float x = random(1,600);
float y = random(1,400);
float dx = 2;
float dy = 5;
float a = random(601,1200);
float b = random(1,400);
float da = -2;
float db = 5;
float c = random(1,600);
float d = random(401,800);
float dc = 2;
float dd = -5;
float e = random(601,1200);
float f = random(401,800);
float de = -2;
float df = -5;
float q = random(1,1000);

int starttime = 0;
int colortime = round(random(10000,20000));
int erasetime = round(random(2000,6000));

float g;

void setup() {
  size(1200,800);
  background(0);
  
  g = random(3);
}

void draw() {

  println( frameRate );
  
if(starttime + colortime > millis()) {
  if (g <= 1) {
    yellow();
  } 
  else  if (g <= 2) { 
    redd(); 
  } 
  else if (g <= 3) {
    bluee(); 
  }
} else if (starttime + colortime + erasetime > millis()) {
  erase();
} else {
  starttime = millis();
  colortime = round(random(10000,20000));  
  erasetime = round(random(2000,6000));
  g = random(3);
}

  if(x >= 600 || x <= 0) {
    dx = dx * -1;
  }

  if(y >= 400 || y <= 0) {
    dy = dy * -1;
  }

  if(e >= width || e <= 601) {
    de = de * -1;
  }

  if(f <= 401 || f >= 800) {
    df = df * -1;
  }

  if(a >= width || a <= 601) {
    da = da * -1;
  }

  if(b >= 400 || b <= 0) {
    db = db * -1;
  }

  if(c >= 600 || c <= 0) {
    dc = dc * -1;
  }

  if(d >= height || d <= 401) {
    dd = dd * - 1;
  }

  
}

void mousePressed() {
  background(0); 
  g = random(3);
  
  x = random(1,600);
  y = random(1,400);
  dx = 2;
  dy = 5;
  a = random(601,1200);
  b = random(1,400);
  da = -2;
  db = 5;
  c = random(1,600);
  d = random(401,800);
  dc = 2;
  dd = -5;
  e = random(601,1200);
  f = random(401,800);
  de = -2;
  df = -5;
  q = random(1,1000);
}

void colorful() {
  float g = random(3);

  if (g <= 1) {
    yellow();
  } 
  else  if (g <= 2) { 
    redd(); 
  } 
  else if (g <= 3) {
    bluee(); 
  }
}

void yellow() {

  strokeWeight(0.1);
  smooth(); 
  stroke( round(random(150,255)), round(random(150,255)), 0);
  
  int h = 0;
  while (h < 3) {   
    h++;
    line(random(a + q),random(b + q),a,b);
  } 

  int i = 0;
  while (i < 3) {  
    i++;
    line(random(c + q),random(d + q),c,d);
  }

  int j = 0;
  while (j < 3) {
    j++;
    line(random(x + q), random(y + q),x,y);
  }


  int k = 0;
  while (k < 3) {
    k++; 
    line(random(e + q),random(f + q),e,f);
  }



  x = x + dx*(-10);
  y = y + dy*(-10);

  a = a + da*(-10);
  b = b + db*(-10);

  c = c + dc*(-10);
  d = d + dd*(-10);

  e = e + de*(-10);
  f = f + df*(-10);



}

void redd() {

  strokeWeight(0.1);
  smooth();
  stroke(round(random(150,255)),0,0); 

  int h = 0;
  while (h < 3) {   
    h++;
    line(random(a + q),random(b + q),a,b);
  } 

  int i = 0;
  while (i < 3) {  
    i++;
    line(random(c + q),random(d + q),c,d);
  }

  int j = 0;
  while (j < 3) {
    j++;
    line(random(x + q), random(y + q),x,y);
  }


  int k = 0;
  while (k < 3) {
    k++; 
    line(random(e + q),random(f + q),e,f);
  }



  x = x + dx*(-10);
  y = y + dy*(-10);

  a = a + da*(-10);
  b = b + db*(-10);

  c = c + dc*(-10);
  d = d + dd*(-10);

  e = e + de*(-10);
  f = f + df*(-10);



}

void bluee() {

  strokeWeight(0.1);
  smooth();
  stroke(0,0,round(random(150,255))); 

  int h = 0;
  while (h < 3) {   
    h++;
    line(random(a + q),random(b + q),a,b);
  } 

  int i = 0;
  while (i < 3) {  
    i++;
    line(random(c + q),random(d + q),c,d);
  }

  int j = 0;
  while (j < 3) {
    j++;
    line(random(x + q), random(y + q),x,y);
  }


  int k = 0;
  while (k < 3) {
    k++; 
    line(random(e + q),random(f + q),e,f);
  }



  x = x + dx*(-10);
  y = y + dy*(-10);

  a = a + da*(-10);
  b = b + db*(-10);

  c = c + dc*(-10);
  d = d + dd*(-10);

  e = e + de*(-10);
  f = f + df*(-10);



}

void erase() {


  strokeWeight(0.3);
  smooth();

  int h = 0;
  while (h < 3) {
    float f = random(2);
    stroke(0);
    h++;
    line(random(a + q),random(b + q),a,b);
  } 

  int i = 0;
  while (i < 3) {
    stroke(0);
    i++;
    line(random(c + q),random(d + q),c,d);
  }

  stroke(0);
  int j = 0;
  while (j < 3) {
    j++;
    line(random(x + q), random(y + q),x,y);
  }

  stroke(0);
  int k = 0;
  while (k < 3) {
    k++; 
    line(random(e + q),random(f + q),e,f);
  }



  x = x + dx*-10;
  y = y + dy*-10;

  a = a + da*-10;
  b = b + db*-10;

  c = c + dc*-10;
  d = d + dd*-10;

  e = e + de*-10;
  f = f + df*-10;



}

void keyPressed() {
  
    if(key == 's') {
    saveFrame("texturizer####.jpg");
    }
  }


