
void setup(){

size (650, 650);

background (0);
}

void draw(){
  
    
stroke (240,210,39);     

strokeWeight (1);   

strokeWeight (2); 
for (int i=0; i<650; i+= 10){ 
  line (325,i,0,325);     
}
 

for (int i=0; i<650; i+= 10){ 
  line (650,325,325,i);    
scale(110.5);}
}
