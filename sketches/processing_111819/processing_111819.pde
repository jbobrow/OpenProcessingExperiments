
void setup(){
      size (600,400);
      background (140,100,180);
      smooth (5);
      frameRate(10);
        
}
      int f = 100;
      int n = 50;
      int dir = 1;
      int[] xs = new int[n];
      int[] ys = new int[n];

void draw(){
 
    int r = (int) random (2);
    fill(f,10,110);
     if (f==0||f==512)
      {
      dir = dir * - 1;
      }  
      f = f+dir; 
    for(int i = 0; i < n-1; i++){
    xs[i] = xs[i+1];
    ys[i] = ys[i+1];
  }
  xs[n-1] = mouseX;
  ys[n-1] = mouseY;
  for(int i = 0; i < n; i++){
    if (r==1){
        rect(xs[i], ys[i], 20+2*i,20+2*i);
    }else {
        ellipse(xs[i], ys[i], 20+2*i,20+2*i);
    }
   
  }}
