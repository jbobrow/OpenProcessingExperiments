
void setup() {
  size(500, 500);
  smooth();
 
  background(240,7,7);
}
 
void draw() {
}
 
int a=20;
int b=30;
 
void mousePressed() {
  for (int x=0; x<width; x+=50) {       
    for (int y=0; y<height; y+=20) {       
      int myColor = floor(random(0, 240));        //scale and ratio,  following grid set
 
       if (myColor <=10) {       
        strokeWeight(.005); 
        fill(random(0, 255));
        rect(x, y, 0,0);
        //original rectangle size, shape and color
      }
      //Including squares and rectanges to change space,  the following change the opacity and 
      //sive.  Implied shapes will arrize impossible to dictate how big or how many!
      if (myColor==150){ 
        fill(0,0,0,50);
        rect(x,y,width/2,20);
      }
      
      if (myColor==150){ 
        fill(0,0,0,50);
        rect(x,y,width/2,20);
      }
      
      if (myColor >=249) { 
        fill(230,63,63,50);
      rect(x, y, 0,0);
      }
      
       if (myColor ==50) {        
        fill(255, 195, 100,50);
      rect(50,20,x,y);
      }
    }
  }
}


