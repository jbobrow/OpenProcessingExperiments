
color brushColor;
float someScale = 1.0;
float someRotation = 0.0;
float timer = 0.0;

void setup(){
 size(500,500);
 frameRate(30);
 background(244);
}

void draw(){
//code below from processingjs website
 noStroke();
 colorMode(HSB,100);
 for(int i=0; i<100; i++) {
   for(int j=0; j<100; j++) {
   stroke(i, j, 100);
   point(i, j);
  }
}
//code above from processingjs website
  stroke(260,50,50);
  if(keyPressed){
    if(key ==  '1'){
      someRotation = someRotation + 0.1;
    }
    if(key == '3'){
      someScale = someScale + 0.1;
      strokeWeight(1.0/someScale);
    }
    if(key == '2'){
      someRotation = someRotation - 0.1;

    }
    if(key == '4'){
      someScale = someScale - 0.1;
    }
    if(key == '5'){
      brushColor = get(mouseX,mouseY);
    }
  }
  
  if(mousePressed == true){
    if(mouseButton == LEFT){
      fill(brushColor);
      pushMatrix();
      translate(mouseX-10,mouseY-10);
      rotate(someRotation); 
      scale(someScale);
      triangle(0,35,15,10,30,35);
      popMatrix();
    } 
  }
}


