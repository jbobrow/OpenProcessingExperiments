
int blocksize;
int block1;


void setup() {
  size(192, 157); 
  background(255); 
  frameRate(25);
  blocksize=10;
  block1=6;

}

void draw () {
    
    for (int y=0; y<height; y+=blocksize){
        for (int x=0; x<width; x+=blocksize){
            fill(3,5,random(240));
            triangle(0,0,90,95,192,0);
            fill(232,5,random(240));
            triangle(0,157,90,95,192,157);
            fill(254,255,random(240));
            triangle(0,0,0,157,90,95);
            fill(45,255,random(240));
            triangle(192,0,90,95,192,157);
        }
    }
}

