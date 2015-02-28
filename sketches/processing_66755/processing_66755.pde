
void setup() {
size(400,400);
smooth();
background(255); 
noFill(); 
}

void draw(){
// myNorma(200,50);
// myNorma(300,60);
// myNorma(400,70);
  //loop code
  for(int i=0; i<100; i+=5){    //i will add itself   
  myNorma(i); 
  myNorma2(i);

  }
}
void myNorma(int diameter){     //state number on int 
 stroke(random(255),mouseX,mouseY);
  ellipse(mouseX,mouseY,diameter,diameter); }//x,y, d, d diameter 
  
void myNorma2(int diameter){
  stroke(random(255),mouseX, mouseY);
  ellipse(mouseX,mouseY,diameter,diameter);  }
  


