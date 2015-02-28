
int posicionX;
int posicionX2;
int posicionX3;
int posicionX4;
int posicionX5;
int posicionX6;
int posicionX7;
int posicionX8;

int posicionY;
int posicionY2;
int posicionY3;
int posicionY4;

void setup(){
  size(1000,600);
  posicionX=100;
  posicionX2=350;
  posicionX3=300;
  posicionX4=150;
  posicionX5=120;
  posicionX6=200;
  posicionX7=250;
  posicionX8=300;
  
  posicionY=300;
 posicionY2=400;
 posicionY3=255;
 noStroke();
}
//BARCO
void draw(){
  background(118,179,255);
 //montañas
 fill(139,97,4);
 ellipse(0,400,200,200);
 ellipse(400,400,110,110);
  ellipse(600,400,90,90);
  ellipse(900,400,350,350);

 //mar
 
 fill(84,82,240);
 rect(0,400,1000,200);
 //sol
 fill(255,214,3);
 ellipse(200,100,100,100);
 fill(255,229,98);
 ellipse(200,100,90,90);
 
 
 

 //torres
fill(28,28,28);
 rect(posicionX4,250,80,95);
 fill(255,255,255);
 rect(posicionX4,250,80,10); 
fill(28,28,28);
 rect(posicionX7,250,80,95);
  fill(255,255,255);
 rect(posicionX7,250,80,10);

//CABINA
 fill(0,0,0);
 rect(posicionX5,280,210,20);
 fill(255,3,3);
 rect(posicionX5,280,210,10);
 
  //BASE
  
  fill(147,147,147);
  quad(posicionX,posicionY,posicionX2,posicionY,posicionX3,posicionY2,posicionX4,posicionY2);
   fill(0,0,0);
  ellipse(posicionX4,350,30,30);
  fill(3,249,255);
  ellipse(posicionX4,350,20,20);
   fill(0,0,0);
  ellipse(posicionX6,350,30,30);
  fill(3,249,255);
  ellipse(posicionX6,350,20,20);
  fill(0,0,0);
  ellipse(posicionX7,350,30,30);
  fill(3,249,255);
  ellipse(posicionX7,350,20,20);
  fill(0,0,0);
  ellipse(posicionX8,350,30,30);
  fill(3,249,255);
  ellipse(posicionX8,350,20,20);
  
   posicionX=posicionX+1;
  posicionX2=posicionX2+1;
   posicionX3=posicionX3+1;
    posicionX4=posicionX4+1;
    posicionX5=posicionX5+1;
    posicionX6=posicionX6+1;
  posicionX7=posicionX7+1;
  posicionX8=posicionX8+1;
    
    

 

  
    
  
}

