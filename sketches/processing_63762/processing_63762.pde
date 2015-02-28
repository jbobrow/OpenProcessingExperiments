
float a = 100;
float b = 425;
float c = 150;
float d = 300;
float e = 100;
float f = 200;
float g = 100;
float h = 100;
float i = 100;
float j = 50;

float o = 250;
float p = 625;

float k = 240;
float l = 625;

float m = 225;
float n = 630;

float v = 1; //geschwindigkeit
float z = 2;
float w = 3;
float x = 4;
float y = 5;
float u = 3;

float PosSchuss = 250;

PImage hintergrund;
PImage lob;

void setup(){
  size (500, 650);
  smooth();
  background(255);
  hintergrund = loadImage("wolken2.jpg");
  lob = loadImage("Daumen-hoch.png");
}

void draw(){
  image(hintergrund,0,0);
  fill(255,102,0);//orange
  noStroke();
  ellipse(a ,b ,100,100);
  fill(255, 204, 0);//gelb
  ellipse(c, d, 80, 80);
  fill(51, 204, 0);//grün
  ellipse(e,f, 60, 60);
  fill( 0, 204, 255);//türis
  ellipse(g,h,40, 40);
  fill(0,0,255);//blau
  ellipse(i,j, 25, 25);
 
  a = a + v;
  c = c + z; 
  e = e + w;
  g = g + x;
  i = i + y;

  
  if (a >= 450) {//orange
    v = -v;
  }
  if (a <= 50){//am linken Rand
    v = -v;
  }
  if (c >= 462.5) {//gelb
    z = -z ;
  }
  if (c <= 37.5){//gelb
    z = -z ;
  }
  if (e >= 475) {//grün
    w = -w ;
  }
  if (e <= 25){//grün
    w = -w ;
  }
  if (g >= 475) {//türkis
    x = -x ;
  }
  if (g <= 25){//türkis
    x = -x ;
  }
  if (i >= 475) {//blau
    y = -y ;
  }
  if (i <= 25){//blau
    y = -y ;
  }
  
  //kanoooone abfeuern
  fill(0);
  ellipse(PosSchuss,p, 8,8) ;

  if(keyCode == UP){
      p = p -u;
  }
  if(keyCode == UP && p <= 0){
      if(keyPressed){
     p = 625;
  }
  }
  //kreise zerstören
  if(sqrt(pow(a-k+10,2)+pow(b-p,2))<=50) {//orange
    a = 500;
    b = 800;    
  }
  if(sqrt(pow(c-k+10,2)+pow(d-p,2))<=40){
    c=500;
    d = 800;
  }
  if(sqrt(pow(e-k+10,2)+pow(f-p,2))<=30){
    e = 500;
    f = 800;
  }
  if(sqrt(pow(g-k+10,2)+pow(h-p,2))<=20){
    g = 500;
    h = 800;
  }
  if(sqrt(pow(i-k+10,2)+pow(j-p,2))<=12.5){
    i = 500;
    j = 800;
  }
    
  //kanone bewegen
  rect(k,l, 20, 10);
  rect(k-15, n,50, 10);
  
  if (keyPressed){
    if (keyCode == RIGHT){
      k = k +3;
      PosSchuss = PosSchuss +3;
    }
  }
  if (keyPressed){
    if(keyCode == LEFT){
      k = k -3;
      PosSchuss= PosSchuss -3;
    }
  }
  if (k <= 15){
    k = 15;
  }
  if (k>=465){
    k = 465;
  }
  if(PosSchuss <= 15+10){
    PosSchuss = 15+10;
  }
  if(PosSchuss >= 465+10){
    PosSchuss = 456 +10;
  }
  if(a>=500&&c>=500&&e>=500&&g>=500&&i>=500){
            image(lob,0,0,500,500);
  }

}



