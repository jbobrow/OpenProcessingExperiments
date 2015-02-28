
float xoff=0.0;
float aumentoX=0.02;
float yoff=0.0;
float aumentoY=0.035;
float r=20;
float a=1.2;
float b=1.2*a;
float c=1.2*b;
float d=1.2*c;
float e=1.2*d;
float f=1.2*e;
float h;
boolean boton=false;
boolean boton2=false;
boolean boton3=false;
boolean boton4=false;
boolean boton5=false;
void setup(){
  size (400,400);
  background(255);
  smooth();
  noStroke();
}

void draw(){
  fill(0,0,0,10);
  rect(0,0,width,height);  
  dibujo();
  if(boton&&boton2&&boton4){
    if(r<70){
      r+=0.2;
    }
  }
  if(boton&&boton3&&boton4){
    if(r>10){
      r-=0.3;
    }
  }
  if(boton2&&boton3&&boton4){
    if (r>30&&r<50){
      stroke(255,15);
    }else{
      noStroke();
    }
  }
  if(boton&&boton2&&boton4){
    if((r>10&&r<30)||(r>50&&r<70)){
      r=random(10,70);
    }
  }
  if(boton&&boton2&&boton3&&boton5){
    if(aumentoX<0.35&&aumentoY<0.45){
      aumentoX+=0.0003;
      aumentoY+=0.0001;
    }else{
      aumentoX=0.02;
      aumentoY=0.035;
    }
  }
  if(boton&&boton2&&boton4&&boton5){
    if(aumentoX<0.35&&aumentoY<0.45){
      aumentoX-=0.0003;
      aumentoY-=0.0001;
    }else{
      aumentoX=0.02;
      aumentoY=0.035;
    }
  }  
}

void dibujo(){
  float n=noise(xoff)*width;
  float m=noise(yoff)*height;
  float g=noise(h)*random(height-100,width-100);
  xoff+=aumentoX;
  yoff+=aumentoY;
  h+=random(aumentoX,aumentoY);
  fill (200,g);
  ellipse(n,m,r,r);
    if (boton){
    fill (125,g);
    ellipse(n*a,m*a,r*0.75,r*0.75);
    ellipse(n/a,m/a,r*0.75,r*0.75);
  }
  if (boton2){
    fill(200,g);
    ellipse(m,n,r,r);
    fill(125,g);
    ellipse(m*a,n*a,r*0.75,r*0.75);
    ellipse(m/a,n/a,r*0.75,r*0.75);
  }
  if (boton3){
    fill(100,g);
    ellipse(n*b,m*b,r*.75,r*.75);
    fill (50,g);
    ellipse(n*c,m*c,r*0.5,r*0.5);
    ellipse(n/c,m/c,r*0.5,r*0.5);
  }
  if (boton4){
    fill(100,g);
    ellipse(m*b,n*b,r*0.75,r*0.75);
    fill(50,g);
    ellipse(m*c,n*c,r*0.5,r*0.5);
    ellipse(m/c,n/c,r*0.5,r*0.5);
  }
  if(boton&&boton2&&boton5){
    elipses1();
    elipses2();
  }
  if(boton&&boton3&&boton5){
    elipses1();
    elipses3();
  }
  if(boton&&boton4&&boton5){
    elipses1();
    elipses4();
  }
  if(boton2&&boton3&&boton5){
    elipses2();
    elipses3();
  }
  if(boton2&&boton4&&boton5){
    elipses2();
    elipses4();
  }
  if(boton3&&boton4&&boton5){
    elipses3();
    elipses4();
  }
}
void elipses1(){
  float n=noise(xoff)*width;
  float m=noise(yoff)*height;
  float g=noise(h)*random(height-100,width-100);
  xoff-=aumentoX;
  yoff+=aumentoY;
  h+=random(aumentoX,aumentoY);
  fill(125,g);
  ellipse(n*d,m,r*0.75,r*0.75);
  ellipse(n/d,m,r*0.75,r*0.75);
  ellipse(n,m*d,r*0.75,r*0.75);
  ellipse(n,m/d,r*0.75,r*0.75);
}

void elipses2(){
  float n=noise(xoff)*width;
  float m=noise(yoff)*height;
  float g=noise(h)*random(height-100,width-100);
  xoff+=aumentoX;
  yoff-=aumentoY;
  h+=random(aumentoX,aumentoY);
  fill(125,g);
  ellipse(m*d,n,r*0.75,r*0.75);
  ellipse(m/d,n,r*0.75,r*0.75);
  ellipse(m,n*d,r*0.75,r*0.75);
  ellipse(m,n/d,r*0.75,r*0.75);
}
void elipses3(){
  float n=noise(xoff)*width;
  float m=noise(yoff)*height;
  float g=noise(h)*random(height-100,width-100);
  xoff-=aumentoX;
  yoff-=aumentoY;
  h+=random(aumentoX,aumentoY);
  fill(50,g);
  ellipse(n*e,m,r*0.5,r*0.5);
  ellipse(n/e,m,r*0.5,r*0.5);
  ellipse(n,m*e,r*0.5,r*0.5);
  ellipse(n,m/e,r*0.5,r*0.5);
}
void elipses4(){
  float n=noise(xoff)*width;
  float m=noise(yoff)*height;
  float g=noise(h)*random(height-100,width-100);
  xoff+=aumentoX;
  yoff+=aumentoY;
  h+=random(aumentoX,aumentoY);
  fill(50,g);
  ellipse(m*f,n,r*0.5,r*0.5);
  ellipse(m/f,n,r*0.5,r*0.5);
  ellipse(m,n*f,r*0.5,r*0.5);
  ellipse(m,n/f,r*0.5,r*0.5);
}

void keyPressed(){
  if (key=='1'){
    boton= !boton;
  }
  if (key=='2'){
    boton2= !boton2;
  }
  if (key=='3'){
    boton3= !boton3;
  }
  if (key=='4'){
    boton4= !boton4;
  }
  if(key=='5'){
    boton5= !boton5;
  }
}

