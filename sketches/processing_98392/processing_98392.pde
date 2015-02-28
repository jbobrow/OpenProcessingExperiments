
int Boles=70;
float[] x = new float [Boles];
float[] y = new float [Boles];
float[] vx = new float [Boles];
float[] vy = new float [Boles];       //defineixo variables

void setup(){
  size(500,500);
  for (int i=0; i < Boles; i++){
    x[i]=20;
    y[i]=20;
    vx[i]=random(5,10);
    vy[i]=random(5,10);            //defineixo les boles
  }
}

void draw(){
  background(255,255,255);            
  
  for(int i=1; i<width; i=i+25){      
    for(int j=1; j<height; j=j+25){
      stroke(0);
      strokeWeight(1);
      rect(i,j,22,22);
    }
  }                                    //el fondo per les x i les y

  
  for(int i=0; i < Boles; i++){ 
    x[i]=x[i]+vx[i];
    y[i]=y[i]+vy[i];                            //velocitats per les boles
     
    if(x[i]<20 || x[i]>width-20){
      vx[i]=-vx[i];
      fill(random(255),random(255),random(255));
    }
    if (y[i]<20 || y[i]>height-20){
      vy[i]=-vy[i];
      fill(random(255),random(255),random(255));        //xoc contra les parets
    }
     
    ellipse(x[i], y[i], 20, 20);            //tamany i posicio de les boles
  }
}

