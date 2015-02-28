
int colorvalue = 1;


void setup(){
  size(800,800);
  colorMode(HSB,360,100,100);
  smooth();
}

void draw(){
  
  
  //background(255);
  fill(0,0,0,5);
  rect(0,0,800,800);
  for(int x = 0; x< width; x+=10){
    for(int y = 0; y<height; y+=10){
      if(x % 20 == 0 && y % 20 == 0){
        noStroke();
        fill(240,99,35);
        ellipse(x,y,15,15);
        
     // } else {
       // fill(255);
        //ellipse(x,y,10,10);

      }
     if(x % 30 == 0 && y % 30 == 0){
       noStroke();
       fill(240,99,35);
       ellipse(x,y,15,15);
       
      // } else {
       // fill(255);
       // ellipse(x,y,10,10);
       }
       
       if(dist(mouseX,mouseY,x,y) < 10){
         noStroke();
         fill(colorvalue,100,100);
         rect(x,y,75,75);
       }
    }
  } 
}

 //Change color of cursor square
 void mouseClicked(){
   if(colorvalue == 1) {
     colorvalue =+3;
   }else{
     colorvalue = 1;
   }
 }
      

