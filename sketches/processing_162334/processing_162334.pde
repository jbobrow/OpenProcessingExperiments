
color paintColor = color(0, 0, 0);
int paintWidth = 1;

void setup() {
  size(800, 600);
  background(16,39,81);
  
  //drawing space

  fill(255);
  rect(210,10,580,580);
  stroke(0,0,0);

}
  
void draw() {
  
  strokeWeight(1);
  stroke(0);
  //red button
  fill(239,235,222);
  rect (11,51,52,52);
  fill(255,0,0);
  rect (10,50,50,50);
   
  //black button
  fill(239,235,222);
  rect (11,151,52,52);
  fill(0,0,0);
  rect(10,150,50,50);
  
  //yellow button
  fill(239,235,222);
  rect (11,251,52,52);
  fill(255,230,0);
  rect(10, 250, 50, 50);
  
  //green button
  fill(239, 235, 222);
  rect (11,351,52,52);
  fill(43,249,0);
  rect(10, 350, 50, 50);
  
  //WHite line
  fill(255);
  rect (11,500,125,2);
  
  
  
  //clear screen button
  fill(255);
  rect(10, 510, 50, 30);
  
  //fat line button
  rect(70, 510, 30, 30);
  
  //skinny line button
  rect(105, 510, 30, 30);
  
  //eraser
  rect(10, 550, 50, 30);

  fill(0);
  textSize(10);
  text("Clear", 23, 520, 25, 25);
  text("+", 83, 520, 25, 25);
  text("-", 117, 520, 25, 25);
  textSize(9);
  text("Eraser", 23, 560, 30, 30);
  
  fill(255);
  textSize(20);
  text("PLAY", 110, 50, 100, 100);
  text("ENJOY!", 110, 80, 100, 100);

   
    
  //this is my interactive section
  if(mousePressed == true) {
      
    if(mouseX < 60 && mouseX > 10 && mouseY < 100 && mouseY > 50) {
      paintColor = color(255, 0, 0);
    }
    if(mouseX < 60 && mouseX > 10 && mouseY <200 && mouseY >150){
      paintColor = color(0, 0, 0);
    }
    if(mouseX < 60 && mouseX >10 && mouseY <300 && mouseY >250){
      paintColor = color(255, 230, 0);
    }
    if(mouseX < 60 && mouseX >10 && mouseY <400 && mouseY >350){
      paintColor = color(43, 249, 0);
    }
    
    //clear Box
    if(mouseX < 60 && mouseX >10 && mouseY <540 && mouseY >510){
      fill(255);
      stroke(255);
      rect(210,10,580,580);

    }
    
    // Brush Size
    if(mouseX < 100 && mouseX >70 && mouseY <540 && mouseY >30 && paintWidth < 20){
      paintWidth++;
    }
    
    if(mouseX < 145 && mouseX >105 && mouseY <540 && mouseY >30 && paintWidth > 1){
      paintWidth--;
    }
    
    //Erase
     if(mouseX < 60 && mouseX >10 && mouseY <580 && mouseY >550){
      paintColor = color(255);
      paintWidth++;
    }
        
    strokeWeight(paintWidth);
    stroke(paintColor);
    if(mouseX < 820 && mouseX >210 && mouseY <590 && mouseY >10) line(pmouseX, pmouseY, mouseX, mouseY);
  
  }
   
} 

