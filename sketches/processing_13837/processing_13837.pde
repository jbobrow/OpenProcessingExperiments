
int backG=0;
int Fill=255;
float a=1;
float r = 0;
float i = 0;
float j = 20;
float R=0;
void setup() {
  size(200,200);
  noStroke();
}
 
void draw() {
   background(backG);
   for (int y = 0; y<10; y++,i++) {
    for (int x = 0; x<10; x=x+1) {
      fill(Fill,Fill,Fill);
      r = sin(radians(i + x * j + y * j))*R;//*a;
      ellipse(100,100, r, r);
      }
    }
    
    R++;
    if(R>=200){
        R=R%200;
        if(backG==0){
            backG=255;
            Fill=0;
         }
        else{
            backG=0;
            Fill=255;
        }
     }
}

