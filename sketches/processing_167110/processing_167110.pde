
// Random circles changing (0,0) coordenates
// using pushMatrix and popMatrix to isolate transformation (translate)

//For loop to create pattern

void setup(){
  size(500, 600);
  background(0);
  
}

void draw(){
  noStroke();
  fill(26, 134, 160);
  pushMatrix();                        
  translate(width/5, height/2);
  ellipse(0, 0, 70, 70);
  popMatrix();
  
  pushMatrix();
  translate(width/3, height/4);
  ellipse(0, 0, 80, 80);
  popMatrix();
  
  pushMatrix();
  translate(width/3, height/4);
  ellipse(0, 0, 80, 80);
  popMatrix();
  
  pushMatrix();
  translate(320, 250);
  ellipse(0, 0, 70, 70);
  popMatrix();
  
  pushMatrix();                         
  translate(width/2, height/7);
  ellipse(0, 0, 50, 50);
  translate(100, 50);               //exploring multiple translations since different coordenates
   ellipse(0, 0, 50, 50);
  translate(100, -120);
   ellipse(0, 0, 50, 50);
  popMatrix();
  
 
  for(int a= 0; a<=width; a+=100){  
  for (int b= 400; b<=height; b+=100){
    ellipse(a, b, 100,100);
  }
  }
}


