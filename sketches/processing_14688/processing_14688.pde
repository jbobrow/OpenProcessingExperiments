

void setup() {  
  size(250, 250);
  background(255);  
}

void draw() { 
 for(int i=0; i<125; i= i+4){
 for(int j=125; 250>j; j= j+4){
 line(j-125,j,375-j,j);
 strokeWeight(2);
 
 }
  line(0+i,i,250-i,i);
  strokeWeight(2);
  }
}

                
               
