
int cont = 0;
punto puntos[] = new punto[1000];
boolean reinicia=false;
punto H[];

int k;
PFont fontA;
void setup(){
  
  size(200,200);
  frameRate(30);
  fontA = loadFont("CourierNew36.vlw");
  textAlign(CENTER);

  // Set the font and its size (in units of pixels)
  textFont(fontA, 12);
  smooth();
}

void draw(){
  background(206);
  if(mousePressed){
    if(mouseButton==LEFT){
      if(reinicia){ 
        cont = 0; 
        reinicia=false; 
      }
      if(cont==0 || (cont> 0 && mouseX!=puntos[cont-1].x && mouseY!=puntos[cont-1].y)){
        puntos[cont] = new punto();
        puntos[cont].x = mouseX;
        puntos[cont].y = mouseY;    
        cont++;
      }

    }
    else {
      convexHull(puntos,cont);
      reinicia=true;
    }
  }

  for(int i=0; i<cont; i++){
    stroke(255,92,0);
    fill(255,206,0);

    ellipse(puntos[i].x,puntos[i].y,5,5);
    fill(0);
    text("p"+i,puntos[i].x-5,puntos[i].y-5);
  }   
  //draw convex hull
  if(reinicia){

    for(int i=0; i<k; i++){
      int j=(i+1)%k;    
      stroke(175,9,0,221);      
      line(H[i].x,H[i].y,H[j].x,H[j].y);
      noStroke();
      fill(175,9,0,50);    
      triangle(H[0].x,H[0].y,H[i].x,H[i].y,H[j].x,H[j].y);
    }
  }
}
double Cross(punto a, punto b, punto c){
  return (b.x -a.x)*(c.y-a.y) - (b.y-a.y) * (c.x-a.x);
}

punto[] convexHull(punto P[], int n){
  H = new punto[2*n];
  buble_sort(P,n);
  k =0;
  for(int i=0; i<n; i++){
    while(k>=2 && Cross(H[k-2],H[k-1],P[i])<=0)
      k--;
    H[k++] = new punto(P[i].x,P[i].y);      
  }
  for(int i=n-2, t=k+1; i>=0; i--){
    while(k>=t && Cross(H[k-2],H[k-1],P[i]) <=0)
      k--;
    H[k++] = new punto(P[i].x,P[i].y);
  }
  return H;
}

void buble_sort(punto P[], int n){
  punto tmp = new punto();
  for(int i=0; i<n-1; i++){
    for(int j=i+1; j<n; j++){
      if(P[j].menor(P[i])){
        tmp = P[j];
        P[j]= P[i];
        P[i] = tmp;
      }
    }
  }
}
class punto{
  private int x,y;
  punto(){
    x = y = 0;
  }
  punto (int x,int y){
    this.x = x;
    this.y = y;
  }
  boolean menor(punto p){
    return (y< p.y || (y==p.y && x< p.x));
  }
  public String toString(){
    return ("(" + x + "," + y + ")");
  }
}













