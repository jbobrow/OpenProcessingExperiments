
//Homework 7.1
//Melissa Diamond
 
float x1,x2,y1,y2; //sets up coordinates for composition
PImage pic;

 
void setup(){
    size(400,400);
    background(30,20,20);
    pic = loadImage("warm-color-combinations.png");
    frameRate(10);  //sets speed of the composition
}
 
void draw(){
    for(int y=0; y <= width; y+=width){  //controls the random color selection
    for(int x=0; x <= height; x+=width){
      
      int a = int(random(0,pic.width));    
      int b = int(random(0,pic.height));   
      
      color c = pic.get(a,b);   //randomly selects colors
      strokeWeight(random(5));  //creates random thickness among points   
      stroke(c,125); 
      
      x1 = x1 + random(-1,10); //randomly places points between set integers
      y1 = y1 + random(-1,10);

      point(x1,y1);
      point(x2,y2);
  
      if (x1 > width) {        //sets up the composition to repeat the dotted stroke               
        x1 = 0;                               
        y1 = random(height); 
          }
        }
      }
}



