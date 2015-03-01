
  void setup(){
  size(500, 500);
  background(255);  //set background white
  frameRate(200);
  }
  
  
  int r=0;
  int g=0;
  int b=0;
  int x=0;
  
  
  void draw(){
  //fill(r,255,b);
  //rect(mouseX, mouseY, 55,55);
  
  
      for (int i=0;i<=50;i++){
              for (int j=0;j<=50;j++){
                  fill(r-10,g-10,b-10);
                  
                  
                  rect(i*10, j*10, 55, 55);
                  fill(0,0,0);
                  rect(mouseX-mouseX%10, mouseY-mouseY%10, 20,20);
                   
                  
              } 
              r= r+255/50;
              g= g+255/25;
              b= b+255/50;
              if (g>255){
                  r=0;
                  g=0;
                  b=0;  
                  fill(0,0,0);
                  rect(mouseX-mouseX%10, mouseY-mouseY%10, 20,20);     
              }
              
      }  
      b= b+(255/50);
      
    }
    x++;
  
  
  
