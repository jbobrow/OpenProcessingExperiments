
int num = 6;
int dia = 50;

void setup(){
size (600, 600);
}

void draw(){
  background(0);
  if(mouseX == pmouseX && mouseY == pmouseY){
    switch(num){
      case 0:
      println("One");
      ellipse (width/2, height/2, dia, dia);
     break;
      
     case 1:
      println("Two");
      ellipse (width/4, height/4, dia, dia);
      ellipse (3*width/4, 3*height/4, dia, dia);
      break;
      
     case 2:
      println("Three");
      ellipse (width/2, height/2, dia, dia);
      ellipse (width/4, height/4, dia, dia);
      ellipse (3*width/4, 3*height/4, dia, dia);
      break;
      
      case 3:
      println("Four");
      ellipse (width/4, height/4, dia, dia);
      ellipse (width/4, 3*height/4, dia, dia);
      ellipse (3*width/4, height/4, dia, dia);
      ellipse (3*width/4, 3*height/4, dia, dia);
      break;
       
      case 4:
      println("Five");
      ellipse (width/4, height/4, dia, dia);
      ellipse (3*width/4, 3*height/4, dia, dia);
      ellipse (3*width/4, height/4, dia, dia);
      ellipse (width/4, 3*height/4, dia, dia);
      ellipse (width/2, height/2, dia, dia);
      break;
      
      case 5:
      println("Six");
      
      ellipse (width/4, height/4, dia, dia);
      ellipse (width/4, height/2, dia, dia);
      ellipse (width/4, 3*height/4, dia, dia);
      ellipse (3*width/4, height/4, dia, dia);
      ellipse (3*width/4, height/2, dia, dia);
      ellipse (3*width/4, 3*height/4, dia, dia);
      break;
    }
  }
    else{
      num=int(random(6));
    }
  }


