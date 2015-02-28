
void setup(){
size (480,120);
smooth();
strokeWeight(4);
}

void draw(){
for (int i = 20; i < 400; i +=20) {
line (i,20,i+i/2,80)
line (i+i/2,80,i+1,120); 
}
}
                
                
