
int xMin = 50;  
int yMax, xMax;  
int yMin = 50;  
int colorCount; 

PImage b;
int flowerCount = 0; 
color[] colors;   
String name = "Flowers"+round(random(0, 25000)); 
int currentX =0;  
int currentY=0;  

void setup() {  
  smooth();  
  size(800, 600);

  yMax = height-50;  
  xMax = width-50;  
  frameRate(3);  
  takecolor(); 

  PImage a;
  a = loadImage ("colorFiles.jpg");
  image (a, 0, 0);
}  


void draw() {  

  currentX=round(random(0, width));   
  currentY=round(random(0, height)); 
  randomFlower();
}  

void mousePressed() {  
  currentX=mouseX; 
  currentY=mouseY; 
  randomFlower();
} 

void randomFlower() {  


  color clr = colors[round(random(0, colorCount))]; 

  float trans = 210;  
  stroke(255, 0, 0); 
  fill(clr, trans);  

  translate(currentX, currentY);  

  float numPetals = round(random(6, 20));  
  float petalLength = random(25, 100);  

  for (float rot = 0; rot < radians(360); rot += radians(360/(numPetals))) {  
    pushMatrix();  
    rotate(rot);  
    beginShape();  
    vertex(10, 10); 
    bezierVertex(10, 10, 50, 20, 10 + petalLength, 10 + petalLength);    
    bezierVertex(10 + petalLength, 10 + petalLength, 20, 60, 10, 10);  
    endShape();      
    popMatrix();
  } 
  flowerCount++;   
  ellipse(0, 0, 25, 25);
}  


void takecolor() { 
   
  b =  loadImage("colorFile.jpg");  
  int spacer =5; 
  image(b, 0, 0); 
  colorCount = (b.width/spacer) * (b.height/spacer);  
  colors = new color[colorCount];  
  
  int colorsSize = 0; 
  for (int x=0;x<b.width -spacer && x< width;x=x+spacer) {  
     
    for (int y=0;y<b.height-spacer && y<height;y=y+spacer) { 
      color c = get(x, y); 
      colors[colorsSize] =c; 
      
      colorsSize++;
    }
  } 
  colorCount=colorsSize;

} 
void keyPressed() { 
  if (key == 's') { 
    
  }
} 


