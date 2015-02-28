

void setup() {
  size(600, 400);
  background(0);
  noStroke();
  
}
 
void draw() {
    

  for (int i=0;i<width;i=i+2) {
    for (int j=0;j<height;j=j+2) {
      fill(random(0,255));
      rect(i, j, 2, 2);
      
    }
  }
  
    fill(0,255,0);
    textSize(36);
    text("1",40,60);
    text("NO SIGNAL",200,300);
    
    if (keyPressed){
     if (key == '+'){
       fill(0,255,0);
       textSize(26);
       text("VOLUME",150,350);
       triangle(265,348,280,330,295,348);
     } 
    }
    if (keyPressed){
     if (key == '-'){
       fill(0,255,0);
       textSize(26);
       text("VOLUME",150,350);
       triangle(265,330,280,348,295,330);
     } 
    }
   
    if (mousePressed){
    background(0);
    fill(0,255,0);
    textSize(36);
    text("AV",40,60);
    
    }
    println(mouseX+","+mouseY);
  

 
}



