
int total = 10;
float trans = 250;
int a = 10;
int b = 10;
int c = 10;
int d = 10;
int i;
int j =1;

//Creem matrius
float[] x = new float[total];
float[] y = new float[total];
float[] vx = new float[total];
float[] vy = new float[total];


void setup() {
  size(600, 600);
  //noSmooth();
  //Posicions i velocitats
  for (int i =0; i<total; i++) {
    x[i] = width/2;
    y[i] = height/2;
    vx[i] = random(-a,b);
    vy[i] = random (-c,d);
  }
  }

void draw(){ 
  
  background(162,236,240);
//bucle
  for (i = 0; i<total; i++) {
    x[i] += vx[i];
    y[i] += vy[i];
 
 // limits
 
  if(((x[i]+70) >= width) || ((x[i]-70) <=0)) {
    vx[i] = -vx[i];
  }
  else{
     vx[i]= random(-a,b);
   }
  if(((y[i]+65) > height) || ((y[i]-110) < 0)) {
    vy[i] = -vy[i];
  }
  else{
     vy[i]= random(-c,d);
   }
    
     //penguin
     fill(0,trans);
    noStroke();
    //mainelipses
  ellipse(x[i],y[i]-80,100,70);
  ellipse(x[i],y[i],150,100);
  
  //panxa
  fill(250,trans);
  ellipse(x[i], y[i]+20,120,100);
  
  //ull
  fill(250);
  ellipse((x[i]-15)*j,(y[i]-90)*j,15*j,20*j);
  ellipse((x[i]+15)*j,(y[i]-90)*j,15*j,20*j);
  
  //pupila
  fill(0);
  ellipse((x[i]-15)*j,(y[i]-90)*j,8*j,8*j);
  ellipse((x[i]+15)*j,(y[i]-90)*j,8*j,8*j);
  
  //pico
  fill(250,150,0);
  ellipse((x[i])*j,(y[i]-70)*j,45*j,20*j);
  
  //potes
  fill(250,150,0,trans);
  ellipse(x[i]-35,y[i]+40,40,60);
  ellipse(x[i]+35,y[i]+40,40,60);
 }
 
}

void mousePressed() {
  //background(0);

  trans = random(0,250);
   if (trans < 100) {
    trans=0;
     
    
    
  }
  if (trans > 100) {
    trans=250;
   
   
    
  }
  
}


