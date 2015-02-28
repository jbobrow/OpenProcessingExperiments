
float i;


void setup() {
    size(800, 800); 
    strokeWeight(1);
    background(0);
    i=1;
}



void draw() {
    
     
    
    //If pressed LEFT mouse click, make a White four Lines.
    if (mousePressed && (mouseButton == LEFT)) {
        SpiderWeb(); 
    }
    
    //If pressed RIGHT mouse click, make many colorful Lines.
    if (mousePressed && (mouseButton == RIGHT)) {
      manyLine();}
    
    //Spider Web will move.  
    if (i < 800) {
      i=i+2;
   
     } 
     
     if (i > 800) {
      i=1; }
    
    //reset the background color  
    if (keyPressed) {
    if (key == '0') {
      background(0);    }

                           }
  
                              }
                              
                              

void  SpiderWeb() {
    pushMatrix();
   
    whiteLINE();
    whiteLINE();
    whiteLINE();
  
    popMatrix();
}





void  manyLine() {
    pushMatrix();
   
    LINE();
    LINE();
  
    popMatrix();
}




//make a White Line 
void whiteLINE() {
    pushMatrix();
    stroke(255,60);
    // stroke(random(10,255),random(0,255),random(100,255));
    line(i, 0, mouseX, mouseY);
    line(0, 800-i, mouseX, mouseY);
    line(800-i, 800, mouseX, mouseY);
    line(800, i, mouseX, mouseY);
    popMatrix();
}




//color Line will apear !
void LINE() {
    pushMatrix();
    stroke(random(170,255),random(80,255),random(80,255));
    line(random(0,800), 0, mouseX, mouseY);
    line(0, random(0,800), mouseX, mouseY);
    line(random(0,800), 800, mouseX, mouseY);
    line(800, random(0,800), mouseX, mouseY);
    popMatrix();
}
