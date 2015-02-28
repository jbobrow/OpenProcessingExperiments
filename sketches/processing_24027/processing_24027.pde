

void setup(){
  size(400,400,P3D);
    background(200);
  smooth();
  lights();
}


 int cellSize = 20;
 
void draw(){

    camera(250, 250, mouseX+200 , width/2, height/2, 0, 0, 1, 0); 
     
  for(int x=0; x <= height; x+=cellSize){
    for(int y=0; y <= width; y+=cellSize){
      int a = floor(random(0,1));   
      int b = floor(random(0,1));
      int c = int(random(150));    
      pushMatrix();
      noStroke();
      fill(123,123,123,200); 
      translate(x, y, c/2);
      box(10,10,c);
      popMatrix();
    }
  }
}



                
                                                
