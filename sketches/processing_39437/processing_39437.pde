
// Spidersketching

void setup() {
  size(400, 400);
  background(0);
  
}

void draw() {
 
 if (key == 's') {
     spiderWeb();
    }   
  
  if(key == 'e'){
    crossEraser();
  }
  
  if(key == 'x'){
    xColors();
  }
}

void mouseClicked(){
    noStroke();
    fill(0);
    rect(0,0,width,height); //back to a blank canvas
  }  

void spiderWeb() {
    float thickness = dist(pmouseX, pmouseY, mouseX, mouseY);
    
    if( thickness>10){
      thickness=10;
    }
    strokeWeight(11-thickness);
    stroke(random(255),random(255),random(255),50);
    line(pmouseX, pmouseY, mouseX, mouseY);
}

void crossEraser() {
  stroke(0,10);
  strokeWeight(5);
  line(width/2, 0, mouseX, mouseY);
  line(width, height/2, mouseX, mouseY);
  line(0, height/2, mouseX, mouseY);
  line(width/2, height, mouseX, mouseY);
}

void xColors() {
  stroke(random(255),random(255),random(255),20);
  float thickness = dist(pmouseX, pmouseY, mouseX, mouseY);
    
    if( thickness>5){
      thickness=5;
    }
  strokeWeight(6-thickness);
  line(0, 0, mouseX, mouseY);
  line(0, height, mouseX, mouseY);
  line(width, 0, mouseX, mouseY);
  line(width, height, mouseX, mouseY);
}

