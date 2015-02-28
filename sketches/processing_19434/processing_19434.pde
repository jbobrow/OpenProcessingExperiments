
float angle = 0.0;
float y = 0;

void setup() { 
  size(250, 250); 
  smooth(); 
  
}

void draw() {
  
  
  
fill(#FEFCFF,20);  
PFont font; 
font = loadFont("Serif-50.vlw");
textFont(font);
text("M9M2G7",y,(random(110)));    //will move it randomly
text("M9M2G7",-y,(random(175)));
text("M9M2G7",y,(random(240)));
y += 0.1;                          //the speed

fill(0,12);
  rect(0,0,width,height);
 stroke(255);
  angle = angle + 0.05;           //rate of the rotation
  translate(125,125);             //how it will translate it from its position
  rotate(random(10));             //how it will rotate the shape
  
  
 noStroke();
 fill(#F8FF3E,50);
 
  rect(60, 20, 80, 80);          //draws the shape
  fill(#913EFF,50);
  rect(1,1,80,80);               //draws the shape

}




