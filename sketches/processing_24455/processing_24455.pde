
int x = 0;
int y = 0;

int spacer = 0;

void setup () {
  
  size (500,500);
  strokeWeight(1);
  background(255);
  smooth();
  
}

void draw() {
  
  while (x<18000){
  stroke(0,56,124,random(0,200));
  line (random(-1000,1000),random(-1000,1000),random(-1000,1000),random(-1000,1000));
x=x+1;  
}



while (spacer<width+60){
  
  y=0;
  
  while(y<3){
  
    stroke(255,180);
    strokeWeight(2);
    
    line(spacer+random(-50,50),0,spacer+random(-50,50),height/2);
    
    line(spacer+random(-50,50),height/2,spacer+random(-50,50),height);
    
    y=y+1;
  }
    spacer=spacer+50;
    
}


}


