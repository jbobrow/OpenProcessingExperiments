
int lineX=0;
int lineY=0;
int lineYn=300;
int lineXn=300;
int colorX=0;
boolean switchIncrease=true;
boolean verticalIncrease=true;



void setup() {

  size(300,300);
}

void draw() {
  strokeWeight(2);
  //background(150);
  fill(lineX+150, lineX/2, 100, 5);
  rect(0,0,width,height);
  line(lineX,0,mouseX,mouseY);
  line(0, lineY, mouseX, mouseY);
  line(300, lineYn, mouseX, mouseY);
  line(lineXn, 300, mouseX, mouseY);
 

  if (mousePressed == true){

    if (switchIncrease==true){
      lineX++;
    } 
    if (switchIncrease==false){
      lineX--;
    } 
    if (verticalIncrease==true) {
      lineY++;
    }
    if (verticalIncrease==false) {
     lineY--; 
    }
    if (verticalIncrease==true) {
     lineYn--; 
    }
    if (verticalIncrease==false) {
     lineYn++;  
    }
    if (switchIncrease==true) {
     lineXn--; 
    }
    if (switchIncrease==false) {
     lineXn++; 
    }

  }

  
  if(lineX>300){
  switchIncrease=false; 
  }
  if(lineX<0){
  switchIncrease=true; 
  }
  if(lineY>300) {
   verticalIncrease=false; 
  }
  if(lineY<0) {
   verticalIncrease=true; 
  }
  
}






