
void setup(){
  size(400,400);
  background(255);
   rect(50,50,50,50);
  rect(175,50,50,50);
  rect(300,50,50,50);
  rect(50,175,50,50);
  rect(175,175,50,50);
  rect(300,175,50,50);
  rect(50,300,50,50);
  rect(175,300,50,50);
  rect(300,300,50,50);
  println( "Type any letters from A-I and see what happens...");
  
}
void draw(){
  stroke(mouseX,mouseY,25);
  strokeWeight(1);
 
 if(keyPressed == true){
    if (key == 'a' || key =='A'){
      fill(255,0,0);
      rect(50,50,50,50);
     }
    else if (key == 'b' || key == 'B'){
      fill(20,255,0);
      rect(175,50,50,50);
      
      }
    else if (key == 'c' || key == 'C'){
      fill(255,0,192);
      rect(300,50,50,50);
    }
    else if (key == 'd' || key =='D'){
      fill(255,230,0);
       rect(50,175,50,50);
    }
    else if (key == 'e' || key == 'E'){
      fill(3,0,255);
      rect(175,175,50,50);
    }
    else if (key == 'f' || key == 'F'){
      fill(0,255,240);
      rect(300,175,50,50);
    }
    else if (key == 'g' || key == 'G'){
      fill(255,110,0);
      rect(50,300,50,50);
    }
    else if (key == 'h' || key == 'H'){
      fill(206,114,163);
      rect(175,300,50,50);
    }
    else if (key == 'i' || key == 'I'){
      fill(70,86,90);
      rect(300,300,50,50);
    }
      else
    fill(255);
  }
 
}


