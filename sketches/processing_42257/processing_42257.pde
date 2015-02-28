
void setup() {
  size (400, 400);
  smooth();
}
void draw (){
 stroke(0);


  
  for (int x=0; x < width; x=x+40){
  for (int y=0; y < height; y=y+40){ 
   fill(10,0,80);
rect(x, y, 30, 30);

 
 if (mousePressed) { 


 noStroke();
   
   fill(40,10);
   rect(0,0, width, height);
   fill(255);
   ellipse(x,y,200,200);
  
 }
   

  
  
}


 
  }

    }


