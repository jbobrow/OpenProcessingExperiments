
int []posX = {100,100,400};
int []posY = {100,400,100};
  color f = color(255,0,0);
  color s = color(0,255,0);
  color t = color(0,0,255);
color []colour = {f, s, t};
float []r;
float []R;
Circle c[];




void setup(){
  background(0);
  size(500,500);
  smooth();noFill();
}

void draw(){
  c= new Circle[3];
  r= new float [3];
  R= new float [3];
  background(0);
  for (int i=100;i<=400;i+=10){
    for (int j=100;j<=400;j+=10){
      
      for (int k=0;k<=2;k++){
        r[k]=dist(i,j,posX[k],posY[k])/50;
        }
        r = sort (r);
        
      for (int m=0;m<=2;m++){
        R[m]= dist(i,j,posX[m],posY[m])/50;
        c[m]= new Circle (colour[m], i, j, R[m]);
        if (R[m]==r[2]){
          c[m].display();}
      }
       
       for (int n=0;n<=2;n++){
         
         if (R[n]==r[1]){
          c[n].display();}
       }
       for (int l=0;l<=2;l++){
      
         if (R[l]==r[0]){
          c[l].display();}
       }
   
    }
  }
//  saveFrame("1-##.png");
}
class Circle{
  color s;
  int X;
  int Y;
  float r;
  
  
  
  Circle(color _s, int _X, int _Y, float _r){
    X=_X;
    Y=_Y;
    s=_s;
    r=_r;
    
  }
  
  void display(){
    
     noFill();
     strokeWeight(r);
     stroke(s);
     point(X,Y);
  
  }

}


