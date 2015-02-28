
void setup(){
size (200,200);
}

void draw(){
for(int i=0 ; i<200; i+=4){
line(i%100,i,200-i%100,i);
}
}
                
