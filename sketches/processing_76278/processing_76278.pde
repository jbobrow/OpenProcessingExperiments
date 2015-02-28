
//Dakotah Konicek    dkonicek
//Copyright © 2012 Dakotah Konicek
//HW11
//
final int MAX = 200;

float [] xinc = new float[MAX];
float [] yinc = new float[MAX];
float [] xNoise = new float[MAX];
float [] yNoise = new float[MAX];
float [] xNoise2 = new float[MAX];
float [] yNoise2 = new float[MAX];
float [] xlength = new float[MAX];
float [] ylength = new float[MAX];
float [] xpos = new float [MAX];
float [] ypos = new float [MAX];
float [] c= new float [MAX];


void setup () {
  size(700,700);
  smooth();
  
  for(int i =0; i<MAX; i++) {
  xinc[i] = random (-0.01,0.01);
  yinc[i] = random (-0.01,0.01);
  xNoise[i]= noise(width);
  yNoise[i]= noise(height);
  xNoise2[i]= random(width);
  yNoise2[i]= random(height);
  c[i]= random(255);
  xlength[i]=noise(xNoise2[i])*.5*width;
  ylength[i]=noise(yNoise2[i])*.5*height;
}}

void draw() {
  background(255);
  for(int i=0; i<MAX; i++) {
 
  xpos[i]=(noise(xNoise[i])*(1.5*width));
  ypos[i]=(noise(yNoise[i])*(1.5*height));
  xNoise[i]= xNoise[i] + xinc[i];
  yNoise[i]= yNoise[i] + yinc[i];
  xNoise2[i]= xNoise2[i] + xinc[i];
  yNoise2[i]= yNoise2[i] + yinc[i];
  
 
  fill(c[i],50);
  rectMode(CENTER);
  rect(xpos[i], ypos[i], xlength[i],ylength[i]);
}}


    void keyPressed() {
  if (key=='p')
  {saveFrame("hw11.jpg");}}

