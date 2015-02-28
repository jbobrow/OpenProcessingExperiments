
void setup() {
  int width=800;
  int height=600;
  smooth();
  size(width, height);
  
  background(#ffffff);
  noStroke();
  
  int img=0;
   while (img<10) {
    drawCircle(img);
     img++;
     //background(255, 255, 255);
    
     
   }
   
}

void draw() {
  
  
}

void drawCircle (int img) {
    int num=0;
    int huy=0;
    float radius = random(0,300);
   
    while (num<1000) {
      radius = random(0,220);
      fill(random(0,255), random(0,255), random(0,255), random(0,100));
      ellipse(random(0, height), random(0,width), radius, radius);
     
     
     
     
     
     
pushMatrix(); 

rotate(PI/random(-24,24));

rect(random(0, width), random(0,height), radius, radius);

popMatrix(); 
  

      
      num++;
      
    }
    /*
    if (img%2 == 0 && img != 0)
    {
       
      saveFrame("z_rectangle_rotated"+str(img)+".png");
      background(255, 255, 255);
       
 
    }
    */
}
