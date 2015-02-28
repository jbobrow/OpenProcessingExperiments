
int x, y;
int a;

void setup() {
  size(600, 600);
  noStroke();
  smooth();
  fill(0);
  background(255);
  a = 10;
  textSize(a);
}
 
void draw() {
  //ellipse(mouseX, mouseY, 10, 10);
}

void mouseDragged(){
  
  ellipse(mouseX ,mouseY, a, a);
}

void keyPressed(){
   if(keyCode == RIGHT) {         
    background(255); //clear
  }else if(keyCode == LEFT) {
    background(0); //background change"black"
  }
  
  if(key == CODED){
    if(keyCode == UP){
      a += 5;
      if(a > 200){
        a = 200;  //strokeweight UP
      } 
    }else if(keyCode == DOWN){
      a -= 5;
      if(a < 10){
        a = 10; //strokeweight DOWN 
      }
    }
   }
  
 

 
 
switch(key){
    case 'z':
    fill(0); //black
    break;
    
    case 'Z':
    fill(0,0,0,50); //black++
    break;
    
  
    case 'r':
    fill(255, 0 ,0); //red
    break;
   
   case 'R':
    fill(255, 0, 0, 50); //red++
    break;
    
    case 'g':
    fill(0, 255 ,0); //green
    break;
    
    case 'G':
    fill(0, 255 ,0 ,50); //green++
    break;
   
    case 'b':
    fill(0, 0 ,255); //blue
    break;
    
    case 'B':
    fill(0, 0 ,255 ,50); //blue++
    break;
    
    case 'p':
    fill(255, 192 ,203); //pink
    break;
    
    case 'P':
    fill(255, 192 ,203 ,50); //pink++
    break;
    
    case 'o':
    fill(255, 165 ,0); //orange
    break;
    
    case 'O':
    fill(255, 165 ,0 ,50); //orange++
    break;

    case 'y':
    fill(255, 255 ,0); //yellow
    break; 
    
    case 'Y':
    fill(255, 255 ,0 ,50); //yellow++
    break; 
    
    case 'm':
    fill(255, 0 ,255); //magenta
    break;
    
    case 'M':
    fill(255, 0 ,255 ,50); //magenta++
    break;
    
    case 'c':
    fill(255); //eraser,white
    break;   
   }
}

    
    
    
    
    
    
    
    
    
    
    
    
  
