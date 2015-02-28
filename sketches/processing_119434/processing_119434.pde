

PFont hello;
 
void setup() {
 size(400, 565);
  hello = loadFont("AgencyFB-Reg-48.vlw"); 
}
 void draw() {
  fill(0);
  background(0,150,255);
  textFont(hello, 50); 
  text("TP", 90, 150);
   fill(255,0,0);
   text("E",130,150);
  fill(255,0,0);
  text("N",265,150);
  fill(0);
  text("A", 300, 150);
  int eSize = 10;  
smooth();  

for(int y=0; y<=height; y+=20){
  for(int x=0; x<=width; x+=20){
 
    if(x > 100 && x < 300){  
      fill(0,255,0);  
    }
    else{    
      fill(255,0,0); 
    }
    ellipse(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y); 
  }
}

rectMode(CENTER);
fill(255,0,0);
rect(200,100,250,10);

rectMode(ENTER);
fill(255,0,0);
rect(250,110,150,500);

}




