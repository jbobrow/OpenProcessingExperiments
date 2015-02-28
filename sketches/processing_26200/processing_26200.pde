

                int x= 25;
int y=0;
int x2=0;
int y2=50;
int x3= 50;
int y3= 50;


void setup() {
size (500,500);
smooth();
}

void draw() {
   noStroke();
  fill(255,10);
  rect(0,0, width, height);
 
   
  for(int i = 0; i<10; i++){
     for(int j =0; j<10; j++){
       fill( 10+i*60, 150-j*60,255);
       
       
  triangle(x+i*50,y+j*50,x2+i*50,y2+j*50,x3+i*50,y3+j*50);
  
   
 
     }
  
  }
  
  
}
