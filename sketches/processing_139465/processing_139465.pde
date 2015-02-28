
int x =100;
int y =100;

void setup(){
size (600,400);
background(#FAEFDE);


}

  //iris
  color iris = color (random(200),random(200),random(200));

void draw(){
  background(#FAEFDE);
  //FRECKLES
  fill(#C1A883);
  noStroke();
  ellipse(100,100,3,4);
  eyeDesign();
  
}
void eyeDesign(){ 
  
  //RIGHT
  strokeWeight(2);
  stroke(0);
  fill(250,250,250);
  ellipse(x-60,y,70,50);
  //iris
  strokeWeight(4);
  stroke(0,50);
  fill(iris);
  ellipse(x-60,y,45,45);
  fill(0);
  ellipse(x-60,y,15,15);
  noStroke();
  fill(255);
  ellipse(x-74,y-10,15,8);
  //toplashes
  strokeWeight(2);
  stroke(0); 
  line(x-60,y-25,x-62,y-33);
  line(x-70,y-24,x-75,y-35);
  line(x-80,y-20,x-90,y-30);
  line(x-90,y-15,x-100,y-23);
  line(x-95,y-7,x-110,y-15);
  //bottom lashes
  line(x-62,y+25,x-63,y+29);
  line(x-72,y+23,x-73,y+30);
  line(x-82,y+20,x-84,y+32);  
  
  //LEFT
  strokeWeight(2);
  stroke(0);
  fill(250,250,250);
  ellipse(x+60,y,70,50);
  //iris
  strokeWeight(4);
  stroke(0,50);
  fill(iris);
  ellipse(x+60,y,45,45); 
  fill(0);
  ellipse(x+60,y,15,15);
  noStroke();
  fill(255);
  ellipse(x+74,y-10,15,8);
  //toplashes
  strokeWeight(2);
  stroke(0); 
  line(x+60,y-25,x+62,y-33);
  line(x+70,y-24,x+75,y-35);
  line(x+80,y-20,x+90,y-30);
  line(x+90,y-15,x+100,y-23);
  line(x+95,y-7,x+110,y-15);
  //bottom lashes
  line(x+62,y+25,x+63,y+29);
  line(x+72,y+23,x+73,y+30);
  line(x+82,y+20,x+84,y+32);  
 
  
  //move
  x=mouseX;
  y=mouseY;
 
}

void mousePressed(){
   iris = color (random(200),random(200),random(200));
}

