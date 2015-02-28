
void setup(){
  size(400,400);
  background(255,193,217);
   ellipse(50,50,50,50);
  ellipse(175,50,50,50);
  ellipse(300,50,50,50);
  ellipse(50,175,50,50);
  ellipse(175,175,50,50);
  ellipse(300,175,50,50);
  ellipse(50,300,50,50);
  ellipse(175,300,50,50);
  ellipse(300,300,50,50);
  println( "Type any letters from A-I and see what happens...");
   
}
void draw(){
  stroke(mouseX,mouseY,25);
  strokeWeight(1);
  
 if(keyPressed == true){
    if (key == 'a' || key =='A'){
      fill(255,0,0);
      ellipse(50,50,50,50);
     }
    else if (key == 'b' || key == 'B'){
      fill(20,255,0);
     ellipse(175,50,50,50);
       
      }
    else if (key == 'c' || key == 'C'){
      fill(255,0,192);
     ellipse(300,50,50,50);
    }
    else if (key == 'd' || key =='D'){
      fill(255,230,0);
       ellipse(50,175,50,50);
    }
    else if (key == 'e' || key == 'E'){
      fill(3,0,255);
      ellipse(175,175,50,50);
    }
    else if (key == 'f' || key == 'F'){
      fill(0,255,240);
      ellipse(300,175,50,50);
    }
    else if (key == 'g' || key == 'G'){
      fill(255,110,0);
      ellipse(50,300,50,50);
    }
    else if (key == 'h' || key == 'H'){
      fill(206,114,163);
      ellipse(175,300,50,50);
    }
    else if (key == 'i' || key == 'I'){
      fill(70,86,90);
     ellipse(300,300,50,50);
    }
      else
    fill(255);
  }
  
}



