
int bolas= 5;
float[] xpos = new float[bolas];
float[] ypos = new float[bolas];
float[] velsX = new float[bolas];
float[] velsY = new float[bolas];
float[] distancia = new float[bolas];
float[] colors = new float[bolas];

//////////////////////////////////////////////////////////////////////////////

void setup(){
size(500,500);
smooth();
background (255);

for(int i=0; i<bolas; i++){
  xpos[i]=random(width);
  ypos[i]=random(height);
  velsX[i]=random (-1,1)*0.1;
  velsY[i]=random (-1,1)*0.1;
  colors[i]=random(150,255);
  }
}

//////////////////////////////////////////////////////////////////////////////

void draw(){
  //int bolafill =color (

  for(int i=0; i<bolas; i++){
  xpos[i]=xpos[i]+velsX[i]; //
  ypos[i]=ypos[i]+velsY[i];
  distancia[i]=dist(xpos[i],ypos[i], width/2, height/2)+100;  //capturar la dist entre los puntos
  //println (distancia);

if(xpos[i]>width/2){
  velsX[i]=velsX[i]-distancia[i]*0.0001;
  }  

if(xpos[i]<width/2){
  velsX[i]=velsX[i]+distancia[i]*0.0001;
  }

if(ypos[i]>height/2){
  velsY[i]=velsY[i]-distancia[i]*0.0001;
  }  

if(ypos[i]<height/2){
  velsY[i]=velsY[i]+distancia[i]*0.0001;
  }

fill(colors[i]-30,20);
stroke (0,20);
ellipse(xpos[i],ypos[i],distancia[i]*0.15,distancia[i]*0.15);  //tamano segun dist

fill(255,colors[i]+10,0,150);
ellipse(xpos[i],ypos[i],2,2);



  }
}
 
//////////////////////////////////////////////////////////////////////////////

void mousePressed(){
background (255);
  for(int i=0; i<bolas; i++){
  xpos[i]=random(width);
  ypos[i]=random(height);
  velsX[i]=random (-1,1)*0.1;
  velsY[i]=random (-1,1)*0.1;
  colors[i]=random(100,255);
  


  }
}
 



void keyPressed() {
  for(int i=0; i<bolas; i++){
  if (colors[i] == 0) {
    colors[i] = random(200,255);
   
  } else {
    colors[i] = random(150,255);
  }

  }
}

