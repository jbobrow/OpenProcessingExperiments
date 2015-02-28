
class Ball {
 
   int cal;
   float x;
   float y;
   float lineH;
   float triScale;
   float circDiam = 25;
   float endX;
   float endY;
   Boolean hover = false;
   
   //captions
   float bigTxtY = 120;
   float smallTxtY = bigTxtY + 17;
   
   //float colHue;
   float carbs, fats, protein;
   float w = 50;
   float h = 50;
   String name;
   String type;
   int view;
 
 Ball(String name_, String type_, float carbs_, float fats_, float protein_, int cal_, float x_, float y_) {
   name = name_;   
   cal = cal_;
   type = type_;
   x = x_;
   y = y_; 
   endX = x_;
   endY = y_;
   //colHue = colHue_;
   carbs = carbs_;  
   fats = fats_;
   protein = protein_;
 }
 

 void display(int view_) {
   
   view = view_;
  
   if (hover) {
       
     //draw caption
     textFont(font);
     String txt = name;
     fill(103, 102, 92);
     text(txt, 75, bigTxtY);
     
     text(cal, 270, bigTxtY);
    
     textFont(font2);     
     String cap = type;
     fill(118, 116, 107, 150);
     text(cap, 75, smallTxtY);
     text("calories", 270, smallTxtY);

   }
   
   // type indicator
   if (type == "vegetable") {
     noStroke();
     fill(vegC);
     } else if (type == "fruit") {
     noStroke();
     fill(fruitC);
     } else if (type == "grain") {
     noStroke();
     fill(grainC);
     } else if (type == "herb") {
     noStroke();
     fill(herbC);
     } else {
     noStroke();
     fill(sugarC);  
     }
     
   if (view == 1) { 
     noStroke();
     
     x = x + (endX - x) * damping;
     y = y + (endY - y) * damping;
     
     ellipse(x, y, cal*.9, cal*.9);
    
     
      //ingredient ring
      float circDiam = 25;
      float[] angs = {carbs*360, fats*360, protein*360};
      int[] colorList = {carbsC, fatsC, proteinC};
      float lastAng = 0;
      
      for (int i = 0; i < angs.length; i++){
        noFill();
        strokeWeight(10);
        strokeCap(SQUARE);
        stroke(colorList[i]);
        arc(x, y, circDiam, circDiam, lastAng, lastAng+radians(angs[i]));
        lastAng += radians(angs[i]);  
      }
   }
   
   if (view == 2) {
    
     strokeCap(SQUARE);
     
     x = x + (endX - x) * damping;
     y = y + (endY - y) * damping;
     
     lineH = cal;
     
     int[] colorList = {carbsC, fatsC, proteinC, sugarC};
     int[] typeList = {vegC, fruitC, grainC, herbC};
    
     //bar graph
     noFill();
     strokeWeight(8);
     stroke(colorList[0]);
     beginShape(LINES);
     vertex(x, y);
     vertex(x, y-carbs*lineH);
     stroke(colorList[1]);
     vertex(x, y-carbs*lineH);
     vertex(x, y-(fats+carbs)*lineH);
     stroke(colorList[2]);
     vertex(x, y-(fats+carbs)*lineH);
     vertex(x, y-(fats+carbs+protein)*lineH);
     endShape();
     
     // type indicator
     if (type == "vegetable") {
     noStroke();
     fill(vegC);
     } else if (type == "fruit") {
     noStroke();
     fill(fruitC);
     } else if (type == "grain") {
     noStroke();
     fill(grainC);
     } else if (type == "herb") {
     noStroke();
     fill(herbC);
     } else {
     noStroke();
     fill(sugarC);
     }     
     
     arc(x, y+20, 10, 10, radians(0), radians(180));
   } 
 }
   
  Boolean isMouseCircs() {
 
    if ((mouseX > x - circDiam) && (mouseX < x + circDiam) && (mouseY > y - circDiam) && (mouseY < y + circDiam)) {
      hover = true;
      return true;
 
    } else {
      hover = false;
      return false;
    }
  }

 Boolean isMouseBars() { 
   
    if ((mouseX > x - 5) && (mouseX < x + 5) && (mouseY > y - cal) && (mouseY < y + 50)) {
      hover = true;
      return true;
    } else {
      hover = false;
      return false;
    } 
  }

 
 void position(float x_, float y_) {
   endX = x_;
   endY = y_; 
 }
}

