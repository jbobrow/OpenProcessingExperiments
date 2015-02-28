
// utilisation des listes
int t=0;
int n=100; 
int[] x;      // déclaration du'une liste d'entiers appelée posx
int[] y;      // déclaration du'une liste d'entiers appelée posy
float angle =0;

void setup(){
  size(700,500);
  x=new int[n]; // la liste est composé de 75 variables int
  y=new int[n]; 
  smooth();
}

void draw(){
  
  t=t+1;
   if (t==10){t=0;
   background(0);
     
    angle=angle+0.03;
    for(int i=0;i<n-1;i=i+1){
      fill(255*(i%2),255*((i+1)%2),20);
      pushMatrix();
      translate(x[i],y[i]);
      rotate(angle);
      rotate(i);
      rectMode(CENTER);
      rect(0,0,i,i);
      popMatrix();
    }
  }

}

void mouseMoved(){ 
  t=0;
  background(0);
  for(int i=0;i<n-1;i=i+1){
    x[i]=x[i+1]; //décale les éléments de la liste , le premier étant désormais perdu  
    y[i]=y[i+1];
  }
  x[n-1]=mouseX; y[n-1]=mouseY;
  
  for(int i=0;i<n-1;i=i+1){
    fill(255*(i%2),255*((i+1)%2),20);
    pushMatrix();
    translate(x[i],y[i]);
    rotate(angle+i);
    rectMode(CENTER);
    rect(0,0,i,i);
    popMatrix();
  }
    
}  



