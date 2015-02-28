
int num=4;

void setup(){
size(200,200);
smooth();
strokeWeight(5);
}

void draw(){
  background(0);
  if(mouseX==pmouseX && mouseY==pmouseY){
    switch(num){
      case 1:
      println("one");
      arc(100,100,75,75,0,PI/2);
      break;
      
      case 2:
      println("two");
      noFill();
      stroke(200,191,0);
      arc(100,100,75,75,0,PI);
      break;
      
      case 3:
      println("three");
      fill(0,191,255);
      noStroke();
      arc(100,100,75,75,0,radians(270));
      break;
      
      case 4:
      println("four");
      stroke(0);
      arc(100,100,75,75,0,TWO_PI);
      break;
    }
  }
  else{
    num=int(random(4));
  }
}





