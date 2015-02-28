
    

void setup(){
  size(500,500);
  background(color(175,75,225));
  noFill();
  noStroke();
  smooth();
}


PFont font;

void draw(){
  font = loadFont("BradleyHandITC-32.vlw");
  textFont(font,32);
  
  if(keyPressed){
    if(key == 'Y' || key == 'y'){
      text("Y",100,100);
      text("Y",160,200);
    }
    else if(key == 'O' || key == 'o'){
      text("o",120,100);
      
    }
    else if(key == 'U' || key == 'u'){
      text("u",140,100);  
      
    }
    else if(key == 'A' || key == 'a'){
      text("a",180,100);
      text("a",300,100);
      text("A",80,200);
      text("A",140,200);
      
    }
    else if(key == 'N' || key == 'n'){
      text("n",200,100);
      text("N",300,200);
      
    }
    else if(key == 'D' || key == 'd'){
      text("d",220,100);
      text("D",320,200);
      
    }
    else if(key == 'I' || key == 'i'){
      text("I",260,100);
      text("I",260,200);
      
    }
    else if(key == 'R' || key == 'r'){
      text("r",320,100);
      text("R",240,200);
      
    }
    else if(key == 'E' || key == 'e'){
      text("e",340,100);
      text("E",280,200);
      
    }
    else if(key == 'L' || key == 'l'){
      text("L",100,200);
    
    }
    else if(key == 'W' || key == 'w'){
      text("W",120,200);
      
    }
    else if(key == 'S' || key == 's'){
      text("S",180,200);
      text("S",340,200);
    }
    else if(key == 'F' || key == 'f'){
      text("F",220,200);
    }
    else if (key == ENTER){

      text(":)",200,300);
      text("You are the best!!",100,400);
    }

  }
  text("_",100,100);
  text("_",120,100);
  text("_",140,100);
  text("_",180,100);
  text("_",200,100);
  text("_",220,100); 
  text("_",260,100);
  text("_",300,100);
  text("_",320,100);
  text("_",340,100);
  text("_",80,200);
  text("_",100,200);
  text("_",120,200);
  text("_",140,200);  
  text("_",160,200);
  text("_",180,200);
  text("_",220,200);
  text("_",240,200);
  text("_",260,200);
  text("_",280,200);
  text("_",300,200);
  text("_",320,200);
  text("_",340,200);
  text("!",360,200);
}


void keyPressed() {
  if (key == ENTER){
        font = loadFont("BradleyHandITC-32.vlw");
        textFont(font,32);
        text(":)",200,300);
        text("You are the best!!",100,400);

  }
}
                                
