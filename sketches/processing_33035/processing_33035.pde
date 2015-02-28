
PImage myImg;
PImage secMyImg;
PImage thirMyImg;
int vel = 10; 
int valueX = 0; 
int valueY = 500;
int antX = 500; 
int antY = 500; 




void setup(){
  //gingham background
  size(600,600); 
  
  frameRate(30);
  smooth(); 

  
  myImg = loadImage("ant2.gif");
  secMyImg = loadImage("ant1.gif"); 
  thirMyImg = loadImage("ant3.gif"); 
}


void draw(){
  background(255,252,253); 
  stroke(255,0,9,99); 
  strokeWeight(29);
  line(width/2,0,width/2,height);
  //line(width/2+300,0,width/2+300,height);  
  line(0,height/2,width,height/2);
  //line(0,height/2+300,width,height/2+300); 
  line(width/4,0,width/4,height);
  line(width/4+300,0,width/4+300,height);
  line(0,height/4,width,height/4);
  line(0,height/4+300,width,height/4+300);
  line(width/8,0,width/8,height); 
  line(width/8+300,0,width/8+300,height); 
  line(0,height/8,width,height/8); 
  line(0,height/8+300,width,height/8+300); 
   line(width/3+25,0,width/3+25,height);
  line(width/3+325,0,width/3+325,height);
  line(0,height/3+25,width,height/3+25);
  line(0,height/3+325,width,height/3+325);  
  
image(myImg,valueY,valueX);
image(thirMyImg,valueX,valueY); 
image(secMyImg,antX,antY);

valueX = valueX + vel;
//valueY = valueY + vel; 
antX = antX-vel;
antY = antY-vel;

if(valueX ==height ){
vel = - vel;
}

else if(valueX ==0) {
  vel = - vel;

}

if(valueY==0){
 vel = - vel;
}
    

}




