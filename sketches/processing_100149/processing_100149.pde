
myPoints age = new myPoints();
int tam = 500;
void setup(){
 smooth();
 size(500,500);
 frameRate(34);
 background(255);
 age.getVars();
}

void draw(){
  age.drawAndUpdate();
}

void mouseClicked(){
 age.getVars();
 background(255);
}


class myPoints{
  int tamMinRectas = 100;
  int totalPoints = 20;
  int i, c, j;
  float coordX[] = new float[totalPoints];
  float coordY[] = new float[totalPoints];
  //Rebote
  boolean forward[] = new boolean[totalPoints];
  boolean up[] = new boolean[totalPoints];
  float acelX[] = new float[totalPoints];
  float acelY[] = new float[totalPoints];
  
  myPoints(){
  //totalPoints = int(random(20,30));
  }
  
  void getVars(){
    //totalPoints = int(random(20,30));
    //Sacamos las coordenadas de los puntos
    for(i=0; i<totalPoints; i++){
    coordX[i] = random(tam-30);
    coordY[i] = random(tam-30);   
    acelX[i] = random(0.2, 0.6);
    acelY[i] = random(0.2, 0.6);
      
      if(random(1)<0.5){
          up[i] = false;
      }else{
          up[i] = true;
      }
            
      if(random(1)<0.5){
          forward[i] = false;
      }else{
          forward[i] = true;
      }
   }  
  }
  
  void drawAndUpdate(){
    rectMode(CENTER);
    if(frameCount00<=0){
    fill(255, 3);
    rect(width/2, height/2, width, height);
    }
    for(c=0; c<totalPoints; c++){
     for(i=0; i<totalPoints; i++){
      if(dist(coordX[c],coordY[c],coordX[i],coordY[i])<tamMinRectas){
      stroke(0, 15);
      //stroke(coordX[c],0,coordY[c]);
      line(coordX[c],coordY[c],coordX[i],coordY[i]);  
      
       if (forward[c]){
        coordX[c] += acelX[c];
        }
        else
        {
         coordX[c] -= acelX[c];
        }
   
        if (up[c]){
         coordY[c]-= acelY[c];
        }
        else
        {
         coordY[c] += acelY[c];
          }
        
        if (coordX[c] > width){
         forward[c] = false;
        }
   
        if (coordX[c]<0){
         forward[c] = true;
        }
   
        if (coordY[c]<0){
         up[c] = false;
        }
   
        if (coordY[c] > height){
         up[c] = true;
        }

      }  
     }
    }
  
  }

}


