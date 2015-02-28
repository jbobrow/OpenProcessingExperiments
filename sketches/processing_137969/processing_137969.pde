
int x = 0;
int y = 0;
void setup(){
  size(800,800);
  
}
void draw(){
  background(255);
      
  for (x = 10; x < height; x=x+10){ 
    for(y = mouseY; y < width; y=y+10){
     
    line(x,0,x,width);

  line( 0, y, height,y);
    }
     //strokeWeight(random(5));
  }   
      // strokeWeight(random(5));
}

