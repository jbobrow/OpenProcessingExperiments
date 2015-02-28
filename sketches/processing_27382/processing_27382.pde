
int x=0;

PImage type; 


void setup(){
  size(500,500);
  smooth();
  strokeWeight(.5);
  colorMode(HSB,360,100,100,100);  
  

  
  
  translate(width/2,height/2);
  for(int i = 0; i < 360; i++){
    rotate(radians(1));
    
    ellipse(0,0,0,10);
    ellipse(0,0,0,100);
    ellipse(0,0,0,1000);
    ellipse(0,0,0,10000);
    ellipse(0,0,0,100000);
    triangle(0,0,0,50,50,10000);
    triangle(0,0,0,25,25,1000);
    triangle(0,0,0,75,75,100000);
    triangle(0,0,0,0,0,100);
    rect(1200,1200,100,100);
    rect(900,900,75,75);
    rect(600,600,50,50);
    rect(300,300,25,25);

   

}
}
void draw(){
float colorValue = map(x,0,width,0,360);
stroke(colorValue,100,200,25);
line(x,0,x,height);
x++;
  
}


  //ROTATING----------------------------------------
  //translate(100,100);
  //rect(0,0,20,20);
  
  //translate(100,100);
  //ellipse(0,0,30,30);
  
  //translate(100,100);
  //rect(0,0,20,20);
  
  //translate(100,100);
  //rotate(radians(45));
  //rect(0,0,20,20);
  //rotate(radians(45));
  //rect(0,0,20,20);
  //rotate(radians(45));
  //rect(50,50,20,20);

