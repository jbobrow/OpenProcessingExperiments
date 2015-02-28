
boolean Bsize = false; 
boolean LCD = false; 
PImage img;
PImage lcd;
PImage lcd2;
 

 
void setup() { 
//background(#FCFABE);  
size(320, 480);  
smooth();  
img = loadImage("park.png");
lcd = loadImage("LCD.png");
lcd2 = loadImage("LCD2.png");}
 

void draw() { 
background(img);  
//body part 1  
fill(#213051);  
noStroke();  
int x;  
x = 60;  
quad(x, 190, x+40, 160, x+190, 160 ,x+159, 190);  
//body part 2  
fill(#485C99);  
quad(x, 190, x, 360, x+159, 360, x+160, 190);  
//body part 3  
fill(#6D8AC3);  
quad(x+159, 190, x+190, 160, x+190, 290, x+159, 360);  
//LCD on body  
image(lcd, 80, 210);
//left arm  
strokeCap(SQUARE); 
strokeWeight(2); 
stroke(#3C5180); 
fill(#3C5180);  
//noStroke();  
bezier(18, 275, 14, 295, 22, 299, 35, 295);  
quad(60, 210, 18, 275, 35, 295, 60, 260);  
//right arm  
quad(239, 210, 288, 275, 271, 295, 230,241 );  
bezier(239, 210, 233, 207, 231, 207, 230, 241);  
bezier(288, 275, 288, 277, 286, 295, 271, 295);  
//left leg  
beginShape();  
beginShape();  
int y= 100;  
quad(y, 360, y, 413, y+27, 413,y+32, 360);   
bezier(y, 413, y+11, 430, y+17, 430, y+27, 413);  
//right leg  
y= y+59;  
quad(y, 360, y+3, 413, y+30, 413,y+31, 360);   
bezier(y+3, 413, y+11, 430, y+17, 430, y+30, 413);  
//robot's head  
fill(#8182C7);  
smooth();  
noStroke();  
int z=91;  
quad(z, 181, z, 91, z+90, 91, z+90, 181);//front  
fill(#ADB9DE); 
quad(z, 91, z+25, 64,z+110, 64, z+90, 91);//top  
fill(#485C99);  
quad(z+110, 64, z+90, 91, z+90, 181, z+110, z+45);//side  
///rainbow LCD 
if (LCD == false) { 
 image(lcd, 80, 210);
} else { colorMode(HSB); 
for (int i = 80; i <200; i++) { 
  stroke(i*1.3, 255, 230); 
  line(i, 210, i, 274); 
} 
} 
//change of mouth 
if (keyPressed) { 
if (key == ' ') { 
    
    stroke(#F9C5CE);  
    strokeCap(SQUARE);  
    smooth();  
    fill(#F9C5CE); 
    beginShape(); 
    bezier(104, 141, 104, 182, 166, 182, 166, 141);  
    endShape(); 
    noStroke(); 
    fill(#F72644, 150); 
    ellipse(100, 137, 18, 11); 
    ellipse(172, 137, 18, 11); //mouth 
     
    image(lcd2, 80, 210);
} 
}        
  
//facial expression  
stroke(0);  
strokeWeight(9);  
strokeCap(SQUARE);  
smooth();  
line(z+18, 109, z+18, 131);  
z = z+52;  
line(z+18, 109, z+18, 131);//eyes  
stroke(#F9C5CE);  
strokeCap(SQUARE);  
smooth();  
noFill();  
bezier(104, 141, 104, 182, 166, 182, 166, 141);   
 
//balloon  
stroke(#F9E25A);  
beginShape();  
vertex(269, 110);  
bezierVertex(243, 150, 233, 150,268, 182);   
bezierVertex(310, 230, 308, 238, 273, 283);  
endShape();  
smooth();  
noStroke();  
 
//circle of balloon 
if (Bsize == false)    
{ 
fill(#A4DAD4);  
triangle(253,120, 276, 120,269, 95);  
ellipse(269, 45, 100, 110);  
noStroke();  
fill(255, 100);  
beginShape();  
bezier(290, 10, 310, 17, 320, 48, 275, 84);  
bezier(290, 10, 300, 15, 310, 43, 275, 84);  
endShape();  
 
} else {  
  fill(#A4DAD4); 
  triangle(250,130, 279, 130,269, 105);  
  ellipse(269, 45, 130, 140); 
  fill(255, 100);  
  beginShape();  
  bezier(290, 10, 310, 17, 320, 48, 275, 84);  
  bezier(290, 10, 300, 15, 310, 43, 275, 84);  
  endShape();  
  
}
} 
 

 

void mousePressed() { if ((mouseX>235) && (mouseX<320) &&(mouseY>0) 
  &&(mouseY<120) && (Bsize = true)); 
  } 
void mouseReleased() {  
  Bsize = false; 
  LCD = false; 
} 
  //ends here (movement of balloon) 
   
void mouseDragged(){ if ((mouseX>80) && (mouseX<199) &&  
(mouseY>210) && (mouseY<270) && (LCD = true)); 
} 
 
void mouseMoved() { 
if(dist (269, 45, mouseX, mouseY)<50) { 
  fill(#DBDCDD); 
  triangle(253,120, 276, 120,269, 95);  
  ellipse(269, 45, 100, 110);  
  noStroke();  
  fill(255, 100);  
  beginShape();  
  bezier(290, 10, 310, 17, 320, 48, 275, 84);  
  bezier(290, 10, 300, 15, 310, 43, 275, 84);  
  endShape();  
} 
} 
//1. when the mouse moves inside of the balloon, the color of balloon 
//   changes and when i click the mouse, the balloon gets bigger. 
//2. when I press the 'down' key, robot's smile gets bigger and 
//   white graph on his LCD changes the color. 
//3. When I put my mouse at his LCD and drag it, it shows me 
//   rainbow colors. 
 



