
void setup() { 
  size(500, 500);
  smooth();
  //background(0);
  }
  
  void draw(){
frameRate(30);
background(0);
float me= random (100);
float you= random (200);
float them= random (350);

 
for(int a=5; a<=500; a=a*2){
for (int b=0; b<=300; b=b+50){

strokeWeight(.5);
stroke(0, 102,0);
noStroke();
fill(102, 204, 255);
rect(b+a,random(500),3, 20);
}
}
//clouds
noStroke();
fill (240,240, 240);
ellipse (0,0, 100, 100);
ellipse (50,30, 100, 100);
ellipse (120,50, 100, 100);
ellipse (160,10, 100, 100);
ellipse (120,20, 100, 100);
ellipse (350,0, 100, 100);
ellipse (370,20, 100, 100);
ellipse (390,50, 100, 100);
ellipse (300,10, 100, 100);
ellipse (470,30, 100, 100);
ellipse (450,5, 100, 100);
ellipse (240,0, 90, 90);

}

