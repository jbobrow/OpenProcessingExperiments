
PFont font;

void setup(){
  size(600,600);
  smooth();
  font = loadFont("ArialRoundedMTBold-48.vlw");
  textFont(font);
  background(255);
}

void draw(){
  background(255);
  fill(135,43,193);
  textSize(60);
  text("sweet!",385,200);
  
  candy ( 250, 200, int(random(80,100)), int(random(210,230)), int(random(80,100)), int(random(370,390)), 
          int(random(500,520)), int(random(210,230)), int(random(500,520)), int(random(370,390)), 0.5, 243,128,138);

  candy (300,1200, int(random(80,100)), int(random(210,230)), int(random(80,100)), int(random(370,390)), 
          int(random(500,520)), int(random(210,230)), int(random(500,520)), int(random(370,390)), 0.5, 55, 227,156);
          
 candy ( 550,-300, int(random(80,100)), int(random(210,230)), int(random(80,100)), int(random(370,390)), 
 int(random(500,520)), int(random(210,230)), int(random(500,520)), int(random(370,390)), 1, 255,243,3);

 candy ( -520,-580, int(random(80,100)), int(random(210,230)), int(random(80,100)), int(random(370,390)), 
 int(random(500,520)), int(random(210,230)), int(random(500,520)), int(random(370,390)),4, 255,176,3);
}




void candy(int x, int y, int a, int b, int c, int d, int e , int f, int g, int h, float s,int i, int j , int k){
    scale(s);
    translate(x,y);
    
//body  
  noStroke();
  fill(i,j,k);
  ellipse(300,300,300,300);
  triangle(a, b,150,300,c,d);
  triangle(e,f,450,300,g, h );
  fill(255);
  arc(225,280,95,100,0,3.14);
  arc(375,280,95,100,0,3.14);
  
//eyes
  float mx = constrain(mouseX,203,248);  
  float my = constrain(mouseY,280,280); 
  fill(0,138,255);  
  arc(mx,my,50,50,0,3.14);
  
  float mp = constrain(mouseX,353,397);  
  float mo = constrain(mouseY,280,280); 
  arc(mp,mo,50,50,0,3.14);

//mouse
stroke(147,82,82);
strokeWeight(5);
strokeCap(ROUND);
line(270,370,300,340);
line(300,340,330,370);
}



