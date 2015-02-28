
int x, y;
int eSize;

 
void setup() {
  eSize = 10;
  size(600,600);
  background(255);
  smooth();
  fill(0);
  
}
 
void draw() {
  
  //ellipse(mouseX, mouseY, 10, 10);
}

//enpitu
void mouseDragged(){
  ellipse(mouseX,mouseY,eSize,eSize);
}

//osutoten
void mousePressed(){
  ellipse(mouseX,mouseY,eSize,eSize);
}
  



  void keyPressed(){
  
  switch(key) {
    
    //enpitunodekasa
     case '9':
   eSize = 50;
      println("9");
      break;
      
       case '8':
    eSize = 45 ;
      println("8");
      break;
      
         case '7':
   eSize = 35;
      println("7");
      break;
      
       case '6':
    eSize =  25;
      println("6");
      break;
      
         case '5':
   eSize = 20;
      println("5");
      break;
      
       case '4':
    eSize = 15 ;
      println("4");
      break;
      
         case '3':
   eSize = 14;
      println("3");
      break;
      
       case '2':
    eSize = 13 ;
      println("2");
      break;
      
         case '1':
   eSize = 10;
      println("1");
      break;
      
       case '0':
    eSize = 5 ;
      println("0");
      break;
    
    
    //zenkeshi
    case 'z':
     background(255);  
      println("z");
      break;
      
      //white
     case 'x':
     fill(255);
     strokeWeight(0);
     noStroke();  
      println("x");
      break;
      
      //black
     case 'c':
     fill(0);
   strokeWeight(0);
     noStroke();   
      println("c");
      break;
      
      //red
      case 'v':
     fill(255,0,0); 
    strokeWeight(0);
     noStroke();  
      println("v");
      break;
      
      //green
       case 'b':
     fill(0,255,0); 
    strokeWeight(0);
     noStroke();  
      println("b");
      break;
      
      //blue
        case 'n':
     fill(0,0,255);
   strokeWeight(0);
     noStroke();   
      println("n");
      break;
      
      //yellow
        case 'm':
     fill(255,255,0); 
    strokeWeight(0);
     noStroke();  
      println("m");
      break;
      
       //magenta
        case 'a':
     fill(255,0,255);
   strokeWeight(0);
     noStroke();   
      println("a");
      break;
      
      //orange
         case 's':
     fill(255,165,0); 
    strokeWeight(0);
     stroke(0);  
      println("s");
      break;
      
      //brown
          case 'd':
     fill(139,69,19); 
     strokeWeight(0);
     noStroke(); 
      println("d");
      break;
      
      //shikaku
     case 'q':   
     rect(mouseX,mouseY,eSize,eSize);  
      println("q");
      break;
      
      //tatesen
      case 'w':  
        strokeWeight(40);
  stroke(random(300),random(200),random(200));
     line(mouseX,mouseY,mouseX,mouseY-400);  
      println("w");
      break;
      
      //yokosen
           case 'e':  
        strokeWeight(40);
  stroke(random(300),random(200),random(200));
     line(mouseX,mouseY,mouseX-400,mouseY);  
      println("e");
      break;
      
      //hidariuenanamesent
           case 'r':  
        strokeWeight(40);
  stroke(random(300),random(200),random(200));
     line(mouseX,mouseY,mouseX-400,mouseY-400);  
      println("r");
      break;
      
      //migiuenanamesen
           case 't':  
        strokeWeight(40);
  stroke(random(300),random(200),random(200));
     line(mouseX,mouseY,mouseX+400,mouseY-400);  
      println("t");
      break;
      
      //sankaku
         case 'y':  
     triangle(mouseX,mouseY-eSize,mouseX-eSize,mouseY+eSize,mouseX+eSize,mouseY+eSize);  
      println("y");
      break;
     
      
      
     
      
      
      
      
  }      
  }   
      
 
      

  
 


