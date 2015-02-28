




PFont f;  
PImage photo;
   

void setup() {  

  size(800, 800);  

photo = loadImage("3.jpg");   

  smooth();  

   

   

  //import font  

  f = createFont("方正大黑简体", 8, true);  

}  

   

void draw() {  
image(photo,0,0);
   

  frameRate(30);  

  strokeWeight(2);  

  stroke(0, 0, 0, 90);  

  
   

  line(width/2, height/2, mouseX, mouseY);  

  strokeWeight(1);  

   

  textFont(f, 30);  

  fill(55, 90);  

  text("距离   "+round(sqrt((abs(width/2-mouseX))*(abs(width/2-mouseX))+(abs(height/2-mouseY))*(abs(height/2-mouseY)))*13.065)+"  米", 530, 50);  




   

   

  //  translate(width/2, height/2);  

  translate(mouseX, mouseY);  

   

  //  translate(0,-120);  



   

  fill(120);  

  ellipse(0, 0, 5, 5);  

  //  translate(pmouseX/2,pmouseY/2);  

  //  branch(5);  

}  

   




