
float kreisX = 150;
float kreisY = 50;
float d;
float x;
float y;
float k;


void setup() {
  size(800,800);
  background(250,250,250);
  }

void draw() { 
  d=random(10,80);
  x=random(0,800);
  y=random(0,600);
  k=random(0,10);
   strokeWeight(3);
  
if(keyPressed){
  fill(50,random(250),random(250),100);
   stroke(0);
  if(key =='1') ellipse(mouseX+random(-100,100),mouseY+random(-100,100),random(d),random(d));
  }
  
if(keyPressed)
   if(key =='2'){
      stroke(0);
   rect(mouseX+random(-5,5),mouseY+random(-5,5),random(d),d);
  }
  
if(keyPressed)
   if(key =='3'){
      stroke(0);
   triangle(mouseX+random(0,50),mouseY+random(0,100),x,y,pmouseX,pmouseY);
  }
  
if(keyPressed)
  if(key =='4'){
   strokeWeight(3);
   stroke(10,250,150,100);
  line(mouseX+random(-200,150),mouseY+random(-200,100),mouseX,mouseY);
 }
  
if(keyPressed)
   if(key =='5'){
      stroke(0);
   rect(mouseX+random(-500,500),mouseY,random(k),k);
   }
 
if(keyPressed)
  if(key=='b'){
    background(250,250,250);
  }

if(keyPressed)
  if(key=='6'){
     stroke(0);
    strokeWeight(3);
    line(mouseX,mouseY,mouseY,mouseX);
  }
  
if(keyPressed)
  if(key=='g'){
     stroke(0);
    fill(250,150,30,150);
  }  
  
  
  
}

