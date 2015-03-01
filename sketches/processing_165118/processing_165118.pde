
int r = 0;
int b = 1;
int rec = 50;
int[] a = new int [200];
int[] xpos = new int [200];
int[] ypos = new int [200];
int Width = 1000;
int Height = 1000;


void setup() {
  size(Width, Height);
}

void keyPressed(){
rec = rec + 50;
  if (rec > 250){
  rec = 50;
  }
}

void mousePressed(){
  r = r+1;
  b = b+1;
  
}

void draw() {
  randomSeed(r);
  background(0);

  //tris = new ArrayList<tri>();
  for (int x = 0; x <=Width; x += rec) {
    for (int y = 0; y <=Height; y += rec) {
      

      smooth();
      pushMatrix();
      translate(x, y);
      rotate(PI*int(random(4))/2);
      triangle(-rec/2, rec/2, -rec/2, -rec/2, +rec/2, -rec/2);
      if((x+y)% b == 0){
        fill(200,0,0,150);  
      } 
      else if((x*y)%b == 0){
        fill(0,0,200,150);
      }
      else{
      fill(255);
      
      }
     
      
      popMatrix();
      //noLoop();
    }
  }
}

