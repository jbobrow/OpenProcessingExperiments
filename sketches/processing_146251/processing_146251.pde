
int numAnt = 15;
int colorantenas = 255;

float[] posicionsX = new float[numAnt];
float[] posicionsY = new float[numAnt];
float[] velocitatsX = new float[numAnt];
float[] velocitatsY = new float[numAnt];


void setup(){
  size(800,800);
  
  for(int i = 0; i<numAnt; i++){
    posicionsX[i] = random(width/2-90, width/2+90);
    posicionsY[i] = random(height/2-90, height/2+90);
    velocitatsX[i] = random(1,8);
    velocitatsY[i] = random(1,8);

  }
}

void draw(){
  background(240);

  for(int i = 0; i<numAnt; i++){
    
    posicionsX[i] += random(-4,4);
    posicionsY[i] += random(-4,4);

    if((posicionsX[i]<0)||(posicionsX[i]>width)){
      velocitatsX[i] = -velocitatsX[i];
    } 
 
    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    } 
  

   dibuixarAnt(posicionsX[i],posicionsY[i]);
  }
}
void dibuixarAnt (float _x, float _y)
  
  {
 
    noStroke();
    fill (103, 85, 68);
    ellipse(_x+60, _y, 50, 50);
    ellipse(_x+100, _y, 56, 56);
    ellipse(_x+155, _y, 80, 56);

    stroke (103, 85, 68);
    strokeWeight (3);
    line (_x+60, _y, _x+45, _y-40);
    line (_x+45, _y-40, _x+35, _y-30);
    line (_x+60, _y, _x+75, _y-40);
    line (_x+75, _y-40, _x+85, _y-30);
    
    noStroke ();
    fill (255);
    ellipse(_x+52, _y-4, 14, 18);
    ellipse(_x+67, _y-4, 14, 18);
    fill (0);
    ellipse(_x+52, _y-4, 11, 13);
    ellipse(_x+67, _y-4, 11, 13);
 
    stroke (103, 85, 68);
    strokeWeight (3);
    line (_x+100, _y, _x+90, _y+40);
    line (_x+100, _y, _x+110, _y+40);
    line (_x+90, _y+40, _x+85, _y+40);
    line (_x+110, _y+40, _x+115, _y+40);
    
    line (_x+140, _y, _x+130, _y+40);
    line (_x+140, _y, _x+150, _y+40);
    line (_x+130, _y+40, _x+125, _y+40);
    line (_x+150, _y+40, _x+155, _y+40);
    
    line (_x+180, _y, _x+170, _y+40);
    line (_x+180, _y, _x+190, _y+40);
    line (_x+170, _y+40, _x+165, _y+40);
    line (_x+190, _y+40, _x+195, _y+40);
    
    stroke (colorantenas);
    strokeWeight (1);
    line (_x+160, _y+26, _x+160, _y-26);
    line (_x+173, _y+22, _x+173, _y-22);
    line (_x+185, _y+16, _x+185, _y-16);
    
  }

  void mousePressed()
  
  {
    colorantenas = color (mouseX, mouseY, 0);
  }

