
PImage img;

int m = 30;
int n = 30;
int sqsize = 100;
int g = 100;
float distanceRotate;
 
 
void setup () {
  size(567,565);
  
}


void draw() {
     img = loadImage( "Ki.jpg");
image(img,0,0);
 background(img); 
  

 noStroke();
  
   for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
       int x = g * i + sqsize * i;
        int y = g * j + sqsize * j;
        frameRate(5);
        
       int ri = int(random(0,255));
    int gi = int(random(0,255));
    int bi = int(random(0,255));
     fill(ri,gi,bi);
     rect(x,y,sqsize,sqsize);
     
     
    int r = int(random(0,255));
    int g = int(random(0,255));
    int b = int(random(0,255));
     fill(r,g,b,80);
      rect(x+100,y,sqsize,sqsize);
    
     
     int rii = int(random(0,255));
    int gii = int(random(0,255));
    int bii = int(random(0,255));
     fill(rii,gii,bii,120);   
 rect(x,y+100,sqsize,sqsize);
 
  int riii = int(random(0,255));
    int giii = int(random(0,255));
    int biii = int(random(0,255));
     fill(riii,giii,biii);   
rect(x+100,y+100,sqsize,sqsize);
}
}




}




