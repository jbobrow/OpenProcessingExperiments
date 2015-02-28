
PFont hello;
 
void setup() {
 size(400, 565);
  hello = loadFont("AgencyFB-Reg-48.vlw"); 
}
//TPENAと入力しています。
 void draw() {
  fill(0);
  background(0,150,255);
  textFont(hello, 50); 
  text("TP", 50, 150);
   fill(255,0,0);
   text("E",130,150);
  fill(255,0,0);
  text("N",265,150);
  fill(0);
  text("A", 300, 150);
  int eSize = 10;  
smooth();  


//点で川みたいな模様を描いてます
for(int y=0; y<=height; y+=20){
  for(int x=0; x<=width; x+=20){
 
    if(x > 100 && x < 300){  
      fill(0,255,0);  
    }
    else{    
      fill(255,0,0); 
    }
    ellipse(x, y, eSize, eSize);
    //println("x=" + x + ", y=" + y); 
  }
}
//赤いTに見えて、隙間があります。
rectMode(CENTER);
fill(255,0,0);
rect(200,100,250,10);

rectMode(CENTER);
fill(255,0,0);
rect(200,360,50,500);

}



