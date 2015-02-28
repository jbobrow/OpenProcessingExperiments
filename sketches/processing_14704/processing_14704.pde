
void setup() { 
  size(200, 200);
  background(255); 
}
 
void draw() {
 for(int i=1; i<100; i= i+3)
 for(int b=101; 200>b; b= b+3){
 
  line(0+i,i,200-i,i);
  line(b-100,b,300-b,b);
 

  }
}
 
                                
