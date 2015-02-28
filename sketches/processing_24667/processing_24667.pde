
int count = 60;

int patternSeperationX = 10;
int patternSeperationY = 10;


void setup() {
  size(350,700);
  background(255);
  
}
  
void draw(){
  pattern();
  
}


void fydLogo(int logoSize){
  //F of the Fyd
  noStroke();
  fill(37, 191, 241, 50); // this line of code here changes as per the panel you want to make, change the 4th number with the number alpha
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
  
}
  
  
  
  
void pattern(){
  
  if (count < 0){
    noLoop();
    translate(30, 225);
    fydLogo(100);
    translate(-30, -225); 
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
    
    ///int blueTri = (int) random(0,10);
    //  if(blueTri == 5){
    //    fill(37, 191, 241);
    //  }
    
    /**********************
    For each panel number change the translate variables below this comment (line 80) with the associated numbers
    also, change the 22nd line of code, changing the alpha level of the fyd logo
    
    #1 - translate(random(80, 180), random(250, 325)); alpha = 255
    #2 - translate(random(80, 180), random(170, 420)); alpha = 200
    #3 - translate(random(50, 220), random(120, 540)); alpha = 125
    #4 - translate(random(-20, 300), random(-20, 700)); alpha = 50 also change count to 60 (line 1)
    
    ************************/           
    translate(random(-20, 300), random(-20, 700));
    
    triangle(x1, y1, x2, y2, x3, y3);
    
    int blurLevel = count/10;
      
      if (blurLevel > 7)
      blurLevel = 7;
      
    filter(BLUR, blurLevel);
    smooth();

  //triangle(
  
  
  count--;
  
  
}

