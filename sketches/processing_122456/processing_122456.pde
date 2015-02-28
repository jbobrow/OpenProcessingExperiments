
int x, y;     
int r, g, b;  

void setup() { 
  size(600, 600); 
  background(255); 
  
} 

void draw() { 
 
} 

void mouseDragged(){ 
  fill(r, g, b); 
  line(mouseX, mouseY,pmouseX, pmouseY); 
   strokeWeight(4);   
} 

void keyPressed(){ 
 switch(key){ 
   case 'w':  //w=White aut
  background(255);      
      break; 
      
       case 'b':  //d=Black aut
  background(0);      
      break; 
      
       case '0':  //0= Black
       stroke(0);
      break; 
      
       case '1':  //1=White
       stroke(255);
      break; 
      
      
  case '2':  //2=Red 
  stroke(255,0,0);
      break; 
      
  case '3':  //3=Orange
stroke(255,130,0); 
      break; 
      
  case '4':  //4=Yerrow 
  stroke(255,255,0);
      break;       
 

  case '5':  //5=Green 
  stroke(0,255,0);
      break; 

  case '6':  //6=SeaGreen
 stroke(2,232,181); 
      break; 

  case '7':  //7=aomidori 
 stroke(0,255,150); 
      break; 
      
  case '8':  //8=Aqua 
  stroke(0,255,255);
      break; 
      
  case '9': //9=Blue 
  stroke(0,0,255);
      break; 


 

} 


} 

