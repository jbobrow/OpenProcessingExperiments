
void setup(){
background(0,0,0);
size(600, 600);
smooth();

}
int gridsize=20;
void draw(){
 for(int i = 0+20; i < width; i+=gridsize){
   for( int j = 0+20; j < height; j+=gridsize){
     if(mouseX > i && mouseX < i+gridsize && mouseY > j && mouseY < j+gridsize){
       fill(i,j,j, 75);
       ellipse(i, i, j, j);
       fill(j,i,j, 75);
       ellipse(j,j,i,i);
       stroke(i);
     } else {
       noFill();
     }
     ellipse(j, i, 20, 20);
     ellipse(i, j, 20, 20);
     rect(j, i, 30, 30);
     rect(i, j, 30, 30);
    }
  }
}

