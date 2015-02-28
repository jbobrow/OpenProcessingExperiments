
void setup(){
  size(600,600);
  noLoop();
  smooth();
}

void draw(){
  Background2();
  Background1(); 
}

void Background1(){
  
  colorMode(HSB,255);
  noStroke();
    
    for (int x=0;x<width+1;x+=25){
      for (int y=0;y<height+1;y+=25){
        fill(random(80)-3,100);
        ellipse(x,y,50,50);     
    }
  }
}

void Background2(){
    colorMode(RGB,255);
    noStroke();
    
    for (int x=0;x<width+1;x+=50){
      for (int y=0;y<height+1;y+=50){
        fill(0,random(175,255),0);      
        ellipse(x,y,100,100);     
    }
  }
}


 

  


  

