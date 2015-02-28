
float velX[];  
float velY[];
float x[];
float y[];
float radio[];
color colores[];
float t1[];
int n=20; 
void setup() {
  size(1200,600);                 
 
  velX= new float[n]; 
  velY= new float[n];
  x = new float[n];
  y = new float[n];
  radio = new float[n];
  colores = new color[n];
  t1 = new float [n];

  for(int i=0; i < n; i++) {
    velX[i]=random(1,5);
    velY[i]=random(1,5);
    x[i] = width/2;
    y[i] = height/2;
    radio[i] = random(2,20);
    colores[i]= color(random(0,155),random(10,255),random(80,255));
    t1[i]= random(1);
  }
  ellipseMode(RADIUS);
}

void draw() {
  update();
                
  stroke(255,45);
   
  fill(255,200,0);               
  for(int i=0; i < n; i++) {
    t1[i]+=0.01;
    fill(colores[i],55);
    ellipse(x[i],y[i],radio[i]*sin(t1[i])*10,radio[i]*cos(t1[i])*10);               //dibujar elipse
  }
}

void update() {
 
  for(int i=0; i < n; i++) {
  
    if (radio[i] > 4) {
 
    }
      colores[i]= color(random(120,155),random(10,255),random(80,255));
    x[i] = x[i] + velX[i];
    y[i] = y[i] + velY[i];

    if ((x[i] > width) || (x[i] < 0)) {
      velX[i] = velX[i] * -1;
      radio[i] =  cos(t1[i])*random(5,10); 
    }

    if ((y[i] > height) || (y[i] < 0)) {
      velY[i] = velY[i] * -1;
      radio[i] = sin(t1[i])*random(5,10); 
    }
  }
}
 
void keyPressed() {
  saveFrame("####imagen.png");
}


