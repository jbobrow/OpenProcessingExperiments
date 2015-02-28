
PFont font;

void draw(){
  font = loadFont("AngsanaNew-32.vlw");
  textFont(font,32);
  
  if(keyPressed){
    if(key == 'I' || key == 'i'){
      text("i",50,100);
      text("i",270,100);
      
    }
    else if(key == 'L' || key == 'l'){
      text("l",80,100);
      
    }
    else if(key == 'O' || key == 'o'){
      text("o",100,100);
      text("o",190,100);
      text("o",230,100);
      
    }
    else if(key == 'V' || key == 'v'){
      text("v",120,100);
      
    }
    else if(key == 'E' || key == 'e'){
      text("e",140,100);
      
    }
    else if(key == 'R' || key == 'r'){
      text("r",170,100);
    }
    else if(key == 'B' || key == 'b'){
      text("b",210,100);
    
    }
    else if(key == 'T' || key == 't'){
      text("t",250,100);
      
    }
    else if(key == 'C' || key == 'c'){
      text("c",290,100);
    }
    else if(key == 'S' || key == 's'){
      text("s",310,100);
    }
  }
  
  text("_",50,100);
  text("_",80,100);
  text("_",100,100);
  text("_",120,100);
  text("_",140,100);
  text("_",170,100); 
  text("_",190,100);
  text("_",210,100);
  text("_",230,100);
  text("_",250,100);
  text("_",270,100);
  text("_",290,100);
  text("_",310,100);
}





void setup(){
  size(400,400);
  background(0);
  noFill();
  noStroke();
}

