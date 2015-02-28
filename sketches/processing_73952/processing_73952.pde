
//Button exercize in class.
//top square activates color shift.

boolean myDisplay;

void setup(){
  myDisplay = false;
  size(1200,720);
  
}

void draw(){
  background(110);
  strokeWeight(2);
  if(myDisplay){
  myDisplay = false;
  }else{ if(!myDisplay){
    myDisplay = true;
  }
 }
  
  if(mouseX>100 && mouseX < 120 && mouseY>150 && mouseY<170){
    if(mousePressed){
      fill(100,10,10);
      }else{
      fill(10,50,150);
      }
      }else{
      fill(120);
      }
rect(100,150,20,20);
rect(100,350,40,40);
rect(150,350,30,40);

ellipse(pmouseX,500,100,100);
triangle(10, 20, mouseX, 50, 100, 10);
triangle(160, 20, mouseX, 50, 100, 10);
triangle(260, 220, mouseX, 50, 200, 10);

//

if(mouseX>100 && mouseX<150 && mouseY>170 && mouseY<180){
  if(mousePressed){
    fill(10,10,20);
  }else{
    fill(110,20,60);

for(int i = 0; i < 100; i++){
  fill(150);
  rect(i*16, i*10, 9 , 100);
        }
      }
    }
  }


/*


}

for(int x = 0; x < 100; x++){
  for(int x = 0; x < 100; x ++){
  ellipse(i*10,x*10,10,10);
}


*/
