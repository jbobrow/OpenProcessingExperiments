
int fila = 600/10;
int angulo=0;
int count=0;

void setup()
{
  size(600,600);
  rectMode(CENTER);
  
  background(255);
}

void draw()
{
noStroke();
  if (count < 1) {
    for (int x = 0; x < width; x += fila) {
      for (int y = 0; y < height; y += fila) {
        float valorx = map(x, 0, width, 0, 1);
        float valory = map(y, 0, height, 0, 1);
        drawHappyFace(x, y, angulo);
        angulo++;
      }
    }
    count++;
  }
   
}

void drawHappyFace(int i, int j, int rota){
    pushMatrix();

        translate(i+30,j+50);
        rotate(sin(map(rota, 0, 10, 0, TWO_PI)));



        



        
        fill(random(0,255),random(0,255),random(0,255));
        beginShape();
  ellipse(42-30,30-30,50,50);
  
 
  endShape(CLOSE);
  
//nose
fill(0);
  beginShape();
  int size3 = round(random(5,15));
  ellipse(40-30,32-30, size3,size3);
  
  endShape(CLOSE);
   
  //eyes
  fill(0);
  int size1 = round(random(5, 15));
  ellipse(40-20, 20-30, size1, size1);
  int size2 = round(random(5, 15));
  ellipse(40-30, 20-30, size2, size2);
   
   //mouth
   beginShape();
   int size4 = round(random(5,30));
   ellipse(40-30,47-30,size4,10);
   endShape();
 
   
   
  popMatrix();
}


  

        
                
                

        
        
      
    



  
  





