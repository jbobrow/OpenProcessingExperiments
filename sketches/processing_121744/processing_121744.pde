
int blocksize;
 
void setup() {
 
size(300,300);
  blocksize = 50;
  stroke(0);
}
 
void draw() {
  for(int y=0; y<height; y+=blocksize) {
    for(int x=0; x<width;x+=blocksize) {
      if (mousePressed){
         
        //Quadres que apareixen quan cliques i mantens clicat
        fill(random(50),random(50), random(50));
        rect(x,y,blocksize,blocksize);
           
    }        
        //Quadres inicials
        fill(random(255),random(90,170), random(240), 15);
        rect(x,y,blocksize,blocksize);
    }
  }
}



