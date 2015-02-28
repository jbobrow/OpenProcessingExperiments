
float[] x;
float[] y;
float[] largeur;
float[] speed;
float[] r;
float[] g;
float[] b;
float[] a;
float[] hauteur;



void setup(){
  size(256,256);
  
  x= new float [50];
  y= new float [50];
  largeur = new float [50];
  speed = new float [50];
  r = new float [50];
  g = new float [50];
  b = new float [50];
  a= new float [50];
  hauteur= new float [50];
 
  
  
  for(int i = 0 ; i < 50; i = i + 1){
  x[i] = random (0,width) ;
  y[i] = random (0,height);
  largeur[i] = random (0,100);
  speed[i] = random (0, 1);
  r [i] = random (0,255);
  g [i] = random (0, 255);
  b [i]= random (0, 255);
  a [i]= random (0, 255);
  hauteur [i] = random (0, height);
  
  }
  
  smooth();
}

void draw() {

background(0);
//déplacement voiture
deplacer();

//dessiner
dessiner();

}

void dessiner(){
rectMode(CENTER);

for (int i = 0; i<50; i = i+1){
  fill(r[i],g[i],b[i],a[i]);
rect(x[i],y[i],largeur[i],hauteur[i]);//voiture
 }
}

void deplacer (){
  
for (int i = 0; i<50; i = i+1){
rect(x[i],y[i],largeur[i],10);//voiture
 x[i]= x[i]+ speed[i];
 if(x[i] > width+largeur[i]/2.0){
    x[i]=-largeur[i]/2;
    y[i]= random (0,height);
  }  
 }
}

