
 
  int k;
  int num = 200;

void setup () {
  size (500, 500);
 

}

void draw() {
  smooth();
  
  noLoop();
 
 

smooth ();
strokeWeight (1);
k=40;
for (int i = 0; i < num*5; i++) {
  line (i, k*2, i/2, 15);
  k+=50;
}

  

    
   belly (350,300);
    belly (120, 140);
    belly (200, 250);
   
   
  
}



void belly(int x, int y){
   fill (234, 21, 78);
  ellipse (x+20, y, 120, random(110, 255));
  
  
  fill (242, 169, 169);
  ellipse (x+20, y, random(30,50), 60); 
    fill (86, 147, 224);
    ellipse (x+20, y+7, 30, 30); 
    fill(255);
    ellipse(x+20, y+10, 10, 10); 
    fill (242, 169, 169);
    ellipse (x-20, y, random(30,50), 60); 
    fill (86, 147, 224);
    ellipse (x-20, y+7, 30, 30); 
    fill(255);
    ellipse(x-20, y+10, 10, 10); 
    
    line (x+10, y+50, x-20, random(y+50, y+70));
    
   
      }
      
      
void mouth (int x, int y) {
  ;
}

