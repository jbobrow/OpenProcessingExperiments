
int a = 10;

void setup() {
  
  size(600, 600);
  background(0);
  smooth();
  noStroke();
  fill(0);
  
  
}
 
void draw() {
 
}

void mouseDragged(){ 
  strokeWeight(a); 
  line(mouseX,mouseY, pmouseX,pmouseY);
  
   switch(key) {
      
      case 'z':  //RANDOM COLOR
      stroke(random(255),random(255),random(255));
      println("z");
      break; 
      
      
   case 'x':  //gray scale
     stroke(random(255));
      println("x");
      break;  
      
    case 'w': // white
      stroke(255);
      println("w");
      break;
      
      case 'k': // black
      stroke(0);
      println("k");
      break;

    case 'd': //delete
      stroke(0,0);
      rect(mouseX,mouseY, a,a);
      println("d");
      break;
      
    case 'r': //red
      stroke(255,random(255),random(255));   
      println("r");
      break;
      
    case 'g': //green
      stroke(random(255),255,random(255));   
      println("g");
      break;
      
      case 'y': //yellow
      stroke(255,255,random(255));   
      println("y");
      break;
      
    case 'b': //blue
      stroke(random(255),random(255),255);  
      println("b");
      break;
      
    case 'm': //magenta
     stroke(255,random(255),255);
     println("m");
     break;
     
      case 'c': //cyan
     stroke(random(255),255,255);
     println("c");
     break;
     
     
   }}
  
   void keyPressed(){   
    if(key == CODED) {
    if(keyCode == SHIFT){
     stroke(0);
      rect(random(600), random(600), 100,100);
      ellipse(random(600), random(600), 100,100);    //DELITE
    }if(keyCode == UP){
      a += 10;
    }if(a >= 100){
        a = 100;
    }if(keyCode == DOWN) {
    a -= 10;
    }if(a <= 10) {
      a = 10; 
    }
  }
   
    if(key == '1'){
      a = 10;
    }if(key == '2'){
      a = 20;
   }if(key == '3'){
      a = 30;
   }if(key == '4'){
      a = 40;
   }if(key == '5'){
      a = 50;
   }if(key == '6'){
      a = 60;
   }if(key == '7'){
      a = 70;
   }if(key == '8'){
      a = 80;
   }if(key == '9'){
      a = 90;
   }if(key == '0'){
      a = 100;
   }
  }


