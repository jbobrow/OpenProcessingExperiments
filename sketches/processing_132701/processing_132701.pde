
// Example 04-03 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

float diameter;
float angle = 0;
PFont myFont;

void setup() {
size(800, 200);
diameter = height - 10;
smooth();
loop();





}
void draw(){
  background(0);
  float d1 = 10 +(sin(angle) * diameter/1) + diameter/1;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  float d3= 10 + (sin(angle + PI) * diameter/2) + diameter/2;


  stroke(255);
//line(0, height/2, width, height/2);  // Line from (0,0) to (480, 120)
//line(width/2, 0, width/2, height);  // Line from (480, 0) to (0, 120)






  if (mouseX > width/3 && mouseX< width/3*2 && 
      mouseY/3 > 0 && mouseY/3*2 < height) {
        noStroke();
fill(255);
ellipse(width/2 + 200, height/2, d2, d2);
ellipse(width/2, height/2, d1, d1);
ellipse(width/2 - 200, height/2, d2, d2);


//filter(INVERT);
  myFont = createFont("CaviarDreams", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(0);
  text("Accademia di Belle Arti Catania", width/2, height/2);
    
  
  } else {
    filter(INVERT);
  myFont = createFont("CaviarDreams", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(0);
  text("Accademia di Belle Arti Catania", width/2, height/2);
    
  }



  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //println(fontList);
  




angle += 0.02;


if(mousePressed) {
  filter(INVERT);
}else{
  filter(BLUR,random(0,1.3));
 
}

}




