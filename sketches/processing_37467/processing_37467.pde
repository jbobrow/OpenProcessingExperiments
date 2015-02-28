
void setup(){
 size(500,500);
smooth();
background(71,208,219);

}

void draw() {
  
  for(int x= 0; x< width; x+=10){
    for (int y=0; y < height; y+=10){
   
    fill(155,9,9);
      //rect(x,y,11,6);
      fill(240,155,12);
      ellipse (x,y,10,5);
      stroke(random(1000,255),random(255),random(255));
      if ((x % 10) == 0){
       fill(0); 
     
        ellipse(random(100,400),random(0,400),10,10);
      //triangle(height/2, height/2,x,y,y,500);
      }else {
    rect (100,200,x,y);
  }
}  
  }
}

