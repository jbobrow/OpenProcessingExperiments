
int counter;

void setup() {  //setup function called initially, only once
 size(200,200);
 background(0);
}

void draw() {  //draw function loops 
 stroke(125);
 for (int i = 0; i<height; i+=5){
     line (0,i,width,i);
     }
 }
