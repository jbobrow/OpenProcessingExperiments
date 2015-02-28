


int patternSeperationX =80;      //variaveis declaradas
int patternSeperationY = 80;
  
  
void setup(){
  size(500,500);                 // tamanho da janela
    
  
  fill(255);
  background(255);                                                //definições do background
  noStroke();                                                 
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
    
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){         //variaveis
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
    
}
  
  
void draw()                      //funçoes do void setup - draw
{
  
}
  
  
void yourFunction(){              
    
  line(50,0,0,50);
  line(0,50,50,100);
  line(50,100,100,50);
  line(50,0,100,50);
  line(25,25,75,25);
  line(75,25,75,75);
  line(25,25,25,75);
  line(25,75,75,75);
  line(0,0,100,100);
  line(100,0,0,100);
  line(50,0,50,100);
  line(0,50,100,50);
  line(0,0,100,0);
  line(0,0,0,100);
  line(100,0,100,100);
  line(0,100,100,100);
  line(50,25,25,50);
  line(25,50,50,75);
  line(50,75,75,50);
  line(50,25,75,50);
  line(0,5,5,0);
  line(0,10,10,0);
  line(0,15,15,0);
  line(0,20,20,0);
  line(0,25,25,0);
  line(0,30,30,0);
  line(0,35,35,0);
  line(0,40,40,0);
  line(0,45,45,0);
  line(55,0,100,45);
  line(60,0,100,40);
  line(65,0,100,35);
  line(70,0,100,30);
  line(75,0,100,25);
  line(80,0,100,20);
  line(85,0,100,15);
  line(90,0,100,10);
  line(95,0,100,5);
  line(55,100,100,55);
  line(60,100,100,60);
  line(65,100,100,65);
  line(70,100,100,70);
  line(75,100,100,75);
  line(80,100,100,80);
  line(85,100,100,85);
  line(90,100,100,90);
  line(95,100,100,95);
  line(0,55,45,100);
  line(0,60,40,100);
  line(0,65,35,100);
  line(0,70,30,100);
  line(0,75,25,100);
  line(0,80,20,100);
  line(0,85,15,100);
  line(0,90,10,100);
  line(0,95,5,100);
}
  




