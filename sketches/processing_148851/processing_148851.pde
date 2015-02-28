
/* Konkuk University  
 Department of Dynamic Media  
 SOS iDesign  
 Name: Youngji Kim  
 ID: 201420069  
 */
import ddf.minim.*;

Minim minim;
AudioPlayer song;

float x;
float y;

float x1, y1, x2, y2, x3, y3, x4, y4, x5, y5; 
float xoff; 
float d;

boolean switchStroke = true;  
boolean switchRotation = true;  
boolean onOff = true;  
boolean backGround = true;  

void setup() {  
  size(displayWidth, displayHeight);  
  smooth();

  minim = new Minim (this);
  song = minim.loadFile ("No+Way+To+Go+Home.mp3");
  song.play();
}  

void draw() {  
  noStroke();  
  if (backGround) {
    float dimension = song.mix.level() * 500;
    d = d*0.9 + dimension*0.9;
    noCursor();
    fill(255, 100);  
    rect (0, 0, width, height); 
    noStroke(); 
    fill(255, 0, 0, 30);
  }  
  if (!backGround) { 
    float dimension = song.mix.level() * 100;
    d = d*0.9 + dimension*0.9;
    cursor(CROSS);
    stroke(255, 30);  
    strokeWeight(1);
    noFill();
  } 

  ellipse(x1, y1, d/5, d/5); 
  ellipse(x2, y2, d/4, d/4); 
  ellipse(x3, y3, d/3, d/3); 
  ellipse(x4, y4, d/2, d/2); 
  ellipse(x5, y5, d, d); 
  /* 
   noFill(); 
   strokeWeight(1); 
   beginShape(); 
   vertex(x1, y1); 
   vertex(x2, y2); 
   vertex(x3, y3); 
   vertex(x4, y4); 
   vertex(x5, y5); 
   endShape(); 
   */

  x1=lerp(x1, mouseX, 0.03); 
  y1=lerp(y1, mouseY, 0.03); 
  x2=lerp(x2, mouseX, 0.025); 
  y2=lerp(y2, mouseY, 0.025); 
  x3=lerp(x3, mouseX, 0.01); 
  y3=lerp(y3, mouseY, 0.01); 
  x4=lerp(x4, mouseX, 0.015); 
  y4=lerp(y4, mouseY, 0.015); 
  x5=lerp(x5, mouseX, 0.02); 
  y5=lerp(y5, mouseY, 0.02); 

  title();
}  

void keyPressed() {  
  if (key=='s') saveFrame("frames/frame_#####.jpg");  
  if (key==' ') onOff = !onOff;  
  if (onOff) loop();  
  if (!onOff) noLoop();  
  if (key=='1') switchStroke = !switchStroke;  
  /*   
   // Variable xPos and yPos in the code above required.  
   if (keyCode==UP) yPos += 0.1;  
   if (keyCode==DOWN) yPos -= 0.1;  
   if (keyCode==LEFT) xPos += 0.1;  
   if (keyCode==RIGHT) xPos -= 0.1;  
   */
  if (keyCode==TAB) backGround = !backGround;
  if (keyCode==TAB) background(#0f4155);
}  

void title() {  
  if (backGround) fill(40); 
  if (!backGround) fill(255);
  textAlign(RIGHT);  
  textSize(14);
  text("Youngji KIM, Untitled, Dynamic Media, 2014", width-50, height-20); 
  textAlign(LEFT);  
  text("TAB background", 50, height-20);
}  

