
void setup(){
 size(300,300);
 smooth();
 background(255);
 stroke(0,100);

}

void draw(){
 int w=30;
 int h=30;
 for(int i=0; i<width+30; i+=30){
 for(int j=0; j<height+30; j+=30){
   fill(random(255),random(100));
   rect(i,j,w,h);
 }
 }
}
