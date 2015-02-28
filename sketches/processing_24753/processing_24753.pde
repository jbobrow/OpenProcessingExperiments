
int count = 300;
boolean countChange = false;
 
int patternSeperationX = 10;
int patternSeperationY = 10;


 
 
void setup() {
  size(1400,700);
  background(255);
   
   
      int patternSeperationX = 10;
    int patternSeperationY = 10;
    int x = 0;
    int y = 0;
     
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction(x, y);
        popMatrix();
        y++;
      }
      x++;
  }
   
}
   
void draw(){
  pattern();
  
  if (count > 100){
  fydLogo(0);
  fydLogo(1);
  fydLogo(2);
   fydLogo(3);
  }
  if (count==5){
    fydLogo(0);
  fydLogo(1);
  fydLogo(2);
   fydLogo(3);}
  
  resetMatrix();
  stroke(0);
  fill(0);
  //line(350, 0, 350, height);
  //line(700, 0, 700, height);
  //line(1050, 0, 1050, height);
  smooth();
  
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
     
    int blurLevel = count/60;
       
    filter(BLUR, blurLevel);
 
   
   smooth();
   count--;
   
   
}

void yourFunction(int x, int y){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
   
    //variables for each triangle randomly
    float x1 = random(0, 100);
    float x2 = random(0, 100);
    float x3 = random(0, 100);
    float y1 = random(0, 100);
    float y2 = random(0, 100);
    float y3 = random(0, 100);
     
    noStroke();
     
    int alpha = (2*x + y)/500;
     
    fill(37, 191, 241, alpha);
    triangle(x1, y1, x2, y2, x3, y3);
   
}

void fydLogo(int number){
  
  int logoSize = 100;
  noStroke();
  fill(255);
  
  if(number == 0){
  translate(40, 225);
  }
  
  if(number==1) 
  translate(200, 0);
  
  if(number ==2)
  translate(210,0);
  
  if(number == 3)
  translate(210,0);
  
  //F of the Fyd
  arc(logoSize, logoSize, logoSize, logoSize, PI, TWO_PI-PI/2);
  triangle(logoSize, logoSize, logoSize/2, logoSize, logoSize/2, logoSize+logoSize/2);
   
  translate(logoSize/5, 0);
   
  //Y of the fYd
  arc(logoSize, logoSize, logoSize, logoSize, TWO_PI-PI/2, TWO_PI);
  triangle(logoSize, logoSize, logoSize+logoSize/2, logoSize, logoSize, logoSize+logoSize/2);
   
  translate(logoSize+logoSize/5, 0);
  //D of the fyD
  arc(logoSize, logoSize, logoSize, logoSize, PI/2, PI);
  triangle(logoSize, logoSize, logoSize/2, logoSize, logoSize, logoSize/2);
  
 smooth();
   
}

