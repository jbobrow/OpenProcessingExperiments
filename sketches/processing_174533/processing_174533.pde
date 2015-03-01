
int x, y;    
void setup() {
  size(500, 500);
background(0);
 
  smooth();
  
}
 
void draw() { 

} 


void mouseDragged(){ 
  noFill();   

  rect(mouseX, mouseY, 50, 50);
}


void keyPressed() {
  
if(keyCode == RIGHT) {          
    background(0);
  } 

  
  switch(key) {
    case 'a':
    stroke(255,0,0);//aka
    break;
   
   case 'A':
    stroke(255,0,0,50);//aka++
    break;
   
    case 'z': 
    stroke(255); //siro 
    break; 

    case 'Z': 
    stroke(255,255,255,50); //siro++ 
    break; 

    case 'g': 
    stroke(0, 255 ,0); //green 
    break; 

    case 'G': 
    stroke(0, 255 ,0 ,50); //green++ 
    break; 

    case 'b': 
    stroke(0, 0 ,255); //ao 
    break;

    case 'B': 
    stroke(0, 0 ,255 ,50); //ao++ 
    break; 

    case 'y': 
    stroke(255, 255 ,0); // kiiro
    break;
 
    case 'Y': 
    stroke(255, 255 ,0 ,50); //kiiro++ 
    break; 

}

}




















