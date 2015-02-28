
int i=0;
int j=0;
int k=0;
int l=0;

void setup () {
  size (500,500);
  background (0);
  smooth();
  
  while (j<11){
   
    while (i<11){
    ellipse (i*50, j*50, 50, 50);
    i=i+1;
    }
    j=j+1;
    i=0;
  }
  
  
 ellipse (200, 200, 30, 30);
 ellipse (250, 200, 30, 30);
 fill (0);
 ellipse (245, 200, 10, 10);
 ellipse (205, 200, 10, 10);
 

 
 

}
