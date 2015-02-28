
//for loop

int count;

void setup(){

  size(500, 500);
  count= 0;
  frameRate(10);
  smooth();
}

void draw(){
  
  background(122, 247, 232);
  
    //bubbles
    strokeWeight(3);
    stroke(255);
    for(int x= 50; x <=450; x += 50){
      for(int y= 50; y <=450; y += 50){
        count++;
      if(count%5 == 0){
        ellipse(x, y, 20, 20);
      }  
      ellipse(x, y, 10, 10);
    
   }
  }

  for(int i= 125; i <=400; i +=125) {
    for(int j= 125; j <=400; j +=125) {  

    //fish
    fill(252, 252, 117);
    strokeWeight(2);
    stroke(255, 224, 44);
    rect(i, j, 50, 50);
    
    //tail
    fill(250, 162, 20);
    strokeWeight(2);
    stroke(242, 106, 27);
    triangle(i, j, i, j-30, i-30, j);
    
    //eye
    fill(0);
    strokeWeight(2);
    stroke(211, 173, 245);
    ellipse(i+40, j+20, 10, 10);
    
    //line
    noFill();
    strokeWeight(2);
    stroke(0);
    line(i+45, j, i, j+45);
    }
  }
  
  //grass
  
}

