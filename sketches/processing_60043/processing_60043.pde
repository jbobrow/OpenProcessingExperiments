


int value1=0;
int value2=2;
int value3=5;


void setup(){
  noCursor();
  size(400,400);
  background(0);
  strokeWeight(3); 
  //smooth();  

}


void draw(){
    stroke(value3,value1, value2);
    background(0);
  
  for(float mov=2; mov<500; mov= mov+ 9){

line(mouseX,mov+ random(59),mov, mouseY);

}


}



void mouseMoved() {
  value1 = value1 + 5;
  value2 = value2 + value3;
  value3 = value3 + (value2*4);
  if (value1 > 255) {       //no entiendo muy bien como leerla
    value1 = 0;
  if (value2>155)
    value2=128;
   if(value3<100)
   value3=255;
  }
}



/*line(20,20,20,380);
line(30,30,30,370);
line(40,40,40,360);
line(50,50,50,350);
line(60,mov,60,340);
line(70,70,70,330);
line(80,80,80,320);
line(90,90,mov,310);
line(100,200,390,200);
*/
//for(int mov=4; mov>70; mov= mov+3){
  
  





