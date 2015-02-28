
int count = 50;
boolean countChange = false;

int patternSeperationX = 10;
int patternSeperationY = 10;


void setup() {
  size(500,500);
  background(255);
  
}
  
void draw(){
  pattern();
  
}


void pattern(){
  if (count < 0){
    noLoop();
  }     
  count--;
  
    float x1 = random(0, 100);
    float x2 = random(-20, 120);
    float x3 = random(-20, 120);
    float y1 = random(-20, 120);
    float y2 = random(-20, 120);
    float y3 = random(-20, 120);
     
    noStroke();
     
    int alpha = 100;
     
    fill(0, alpha);
    
    int blueTri = (int) random(0,10);
      if(blueTri == 5){
        fill(37, 191, 241);
      }
           
    translate(random(-10, width), random(-10, height));
    
    triangle(x1, y1, x2, y2, x3, y3);
    
    int blurLevel = count/10;
      
    filter(BLUR, blurLevel);

  //triangle(
  
  
  count--;
  
  
}

