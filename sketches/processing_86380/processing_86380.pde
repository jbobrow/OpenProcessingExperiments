
// Sketch de dibujo libre
// Pablo Arias



PImage colorGrid;
  color myColor;
  int tam=0;
  int brush = 0;
boolean colorPick = false;
void setup() {
size(720, 480);
colorGrid = loadImage("Color grid.png");
}

void draw() {
image(colorGrid, 680,0);
mouseCheck();
if(!colorPick){
    if(mousePressed && mouseButton == LEFT){
      strokeWeight(tam);
    stroke (myColor);
      fill(myColor);
    switch (brush){
      
      case 0:
  line(mouseX, mouseY,pmouseX,pmouseY);
  break;
  
  case 1:
  line(mouseX, mouseY,pmouseX,pmouseY);
  line(mouseX+3, mouseY+1,pmouseX+3,pmouseY+1);  
  break;
  
  case 2:
  line(mouseX-3, mouseY-1,pmouseX-3,pmouseY-1);
  line(mouseX, mouseY,pmouseX,pmouseY);
  line(mouseX+3, mouseY+1,pmouseX+3,pmouseY+1);
  
  break;

  case 3:
    line(mouseX-5, mouseY-5,pmouseX-5,pmouseY-5);
  line(mouseX+5, mouseY+5,pmouseX+5,pmouseY+5);
  break;  
  
  case 4:
    line(mouseX-3, mouseY-3,pmouseX-3,pmouseY-3);
  line(mouseX, mouseY,pmouseX,pmouseY);
  line(mouseX+3, mouseY+3,pmouseX+3,pmouseY+3);
  break;    
  }
 }
 }
}

void mouseClicked(){
  if(colorPick){
    if(mouseY<=300) myColor = get(mouseX, mouseY);
  }  
}

void mouseCheck(){
    if(mouseX>680)  colorPick = true;
     else colorPick = false;
  }
  
void keyReleased(){
  if(key == 'p' || key == 'P'){
      tam = tam+1;
    }
   else if(key == 'o' || key == 'O'){
     if(tam>0)  tam = tam-1;
    } 
    
   else if(key == 'b' || key == 'B'){
     brush = brush+1;
     if(brush>4)  brush = 0;
    }     
   else if(key == 'v' || key == 'V'){
     brush = brush-1;
     if(brush<0)  brush = 4;
    }     
    
}  




