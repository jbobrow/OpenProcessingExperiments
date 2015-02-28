
void setup () {
  size (250,250);
  smooth ();
  background (#785553);
  frameRate (5);
}

void draw () {
   background (#785553);
int g = int(random (544,50));
noFill ();  

//scribbles  
for (int x = 20; x < g; x = x + 1) {
  stroke (#1d3150, 25);
  float h = random (-45,400);
  float p = random (-25,1500);
  bezier (mouseX,mouseY,h,h,p,p,250,0);
//

;

  };
 
};


 

