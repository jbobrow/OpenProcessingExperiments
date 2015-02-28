
 
int concentration = 600; // Try values 1 -> 10000
int cNum = 10;
int[] x = new int[cNum];
int[] speed = new int[cNum];
int[] c = new int[cNum];


void setup() 
{
  //size(200, 200, P3D);
  size(640, 640, P3D);
  noStroke();
  fill(204);
  sphereDetail(60);
   frameRate(30);
   
    for (int k = 0;k < cNum; k++) { 
    x[k] = 0; 
    speed[k] = 5;
    c[k] = 255;
  }
}

void draw() 
{
  background(0); 
  
      // Light the bottom of the sphere
  directionalLight(51, 102, 126, -1, -1, -1);
  
  // Orange light on the upper-right of the sphere
  spotLight(204, 153, 0, 100, 160, 300, 0, 0, -1, PI/2, 700); 
   spotLight(204, 153, 0, 200, 260, 400, 0, 0, -1, PI, 600); 
    spotLight(204, 153, 0, 300, 360, 300, 0, 0, -1, PI, 600);
    spotLight(204, 153, 0, 10, 60, 600, 0, 0, -1, PI, 600);  
     spotLight(204, 153, 0, 400, 460, 600, 0, 0, -1, PI, 600); 
      spotLight(204, 153, 0, 500, 560, 600, 0, 0, -1, PI, 600); 
  
   
  
  // Moving spotlight that follows the mouse
  spotLight(102, 153, 204, 360, mouseY, 600, 0, 0, -1, PI, 600); 
  
  
   for (int i = 0;i < cNum; i++) {
 
     
  
  translate(random(500), random(10)*height/(cNum-1)/3, -random(300)); 
  sphere(100); 
    if (x[i] > width || x[i] < 0) { 
      speed[i] = -1 * speed[i];
    } 
    x[i]=x[i]+speed[i]*i/5;
  }
}



