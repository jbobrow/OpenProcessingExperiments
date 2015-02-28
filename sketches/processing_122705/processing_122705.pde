
int x, y;   

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  fill(0); //kuro
}
 
void draw() {
}

void mouseDragged(){     //kaku maru [click]
   ellipse(mouseX, mouseY, 5, 5);
}

void keyPressed(){
  switch(key){
   case'q':
    fill(255); //kesigomu siro [q]
    println("q");
    break; 
    
   case'w':  //kuro [w]
    fill(0);
    println("w");
    break;
   
   case'e':  //aka [e]
    fill(255, 0, 0);
    println("e");
    break; 
    
   case'r':  //midori [r]
    fill(0, 255, 0);
    println("r");
    break; 
    
   case't':  //ao [t]
    fill(0, 0, 255);
    println("t");
    break; 
    
   case'd':    //haikei siro reset [d]
    background(255);
    println("d");
    break; 
    
   case'f':    //haikei kuro  reset[f]
    background(0);
    println("f");
    break;
    
   case'g':    //haikei aka  reset[g]
    background(255, 0, 0);
    println("g");
    break;
    
   case'h':    //haikei midori  reset[r]
    background(0, 255, 0);
    println("h");
    break;
    
   case'j':    //haikei ao reset[j]
    background(0, 0, 255);
    println("j");
    break;
  }
}
     


