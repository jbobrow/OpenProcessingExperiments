
//Lillie Ferris
//October 2012
//liferris@andrew.cmu.edu

final int MAX = 100;

float [] x;
float [] y;
float random, length, stroke;
float dx, diam;
color [] col1;
//use the word color as the array name


void setup (){
  smooth();
  size (800, 600);
  stroke (1);
  background(255);
  dx = random(1,10);
  
  x = new float [MAX];
  initializeFloatArray(x, 0, width);
  y = new float [MAX];
  initializeFloatArray(y, 0,height);
  col1 = new color[MAX]; 
  initializeColorArray();
  diam = 20;
  
}

void draw (){
  background(255);
  drawLines();
  moveLines();
 // growLines();
  
}

void initializeFloatArray(float [] temp, float low, float high){
  for(int i = 0; i < temp.length; i++){
    temp[i] = random(low, high); 
  }
}

void initializeColorArray(){
  for(int i = 0; i < col1.length; i++){
    col1[i] = color (random(255)); 
  
}}

void drawLines(){
for(int i = 0; i < x.length; i++){
  stroke(col1[i]); // stroke 20
  strokeWeight(.1);
  line(x[i], y[i], i*8 , height/2 );               // , i*5, i*5)
  //line(x[i], y[i], x[i]+100, i);//
  
      fill(col1[i],10);
      ellipse (x[i], y[i], diam, diam);
      stroke (col1[i]);
      strokeWeight(2);
      point (x[i], y[i]);
      
       
  }
}

void moveLines(){
  for (int i = 0; i < y.length; i++){
    x[i] += dx;
    if (x[i] > width){
      x[i] = 0;
    }
  }}
  
void growLines(){
  for (int i = 1; i < y.length; i++){
    x[i] =+ y[i];
    if(x[i] > random(height*.1, height*.2)){
    }}}
      
void keyPressed(){
   for (int i = 1; i < y.length; i++){
     dx = -dx; // direction
     //dx = random(1, 10); //speed
     col1[i] = color(random(255),random(255),random(255));
     
     
   }}
   
 
   

