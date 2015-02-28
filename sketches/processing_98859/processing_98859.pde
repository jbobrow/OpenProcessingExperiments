
int n=20;
int div;
int colores[];
int col = 0;
int di =(int)255/n;


void setup(){
  size(1200,400);
  int x = 0;
  int y = 0;
  div = 1200/n;
  colores = new int[n];
  for(int i = 0;i<n;i++){
    col = (i+1)*di;
    if(i == 0)col = 0;
    colores[i]=col;
    fill(col);
    
    rect(x, y, x + width/n, height);
    x = x+width/n;
  }
}

void draw(){


}
   
void mousePressed() {
    int x2 = mouseX;
    int x = 0;
    int y = 0;
    int ip = 0;
    for(int i = 0;i<n;i++){
      x = x+width/n;
      if(x2<x)break;
      ip = i+1;
    }
    x = x-width/n;
    int a = (ip+1) *di;
    if(ip == 0)a = ip*di;
    fill(255,a,1);
    rect(x, y,div,height);
    println("255, "+a+", 1");    
}


void mouseReleased(){
    int x2 = mouseX;
    int x = 0;
    int y = 0;
    int ip=0;
    for(int i = 0;i<n;i++){
      x = x+width/n;
      ip=i;
      if(x2<x)break;
      
    }
    x = x-width/n;
    fill(colores[ip]);
    rect(x, y,div,height);
}
