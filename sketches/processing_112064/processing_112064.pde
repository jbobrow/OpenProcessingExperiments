
void setup() {
  size(300,500);
  background(14,182,182);
  frameRate(400);
  
};

void draw() {
   
// ------------------------------------------- light yellow
      
       strokeWeight(1);
       stroke(255,176,43);
       line(mouseX,mouseY,290,20);   
       
// ------------------------------------------- yellow orange       

       strokeWeight(1);
       stroke(255,149,67);
       line(mouseX,mouseY,300,20);    
   
// ------------------------------------------ light pink
      
      strokeWeight(2);
      stroke(255,135,103);
      line(mouseX,mouseY,10,100);
    
// ------------------------------------------ dark pink
    
     strokeWeight(2);
     stroke(255,54,67);
     line(mouseX,mouseY,100,40);

// ------------------------------------------ medium pink
  
     strokeWeight(2);
     stroke(255,93,93);
     line(mouseX,mouseY,120,20);
  
// ------------------------------------------ light orange
    
     strokeWeight(1);
     stroke(242,104,65);
     line(mouseX,mouseY,20,50);
 
// ------------------------------------------ light green
      strokeWeight(1);
      stroke(209,216,8);
      line(mouseX,mouseY, 400, 350);
      
      strokeWeight(2);
      stroke(157,216,8);
      line(mouseX,mouseY,300,500);
  
};
