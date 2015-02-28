
void setup(){
  size(500,500);
  background(0); 
}

void draw(){
  if (mousePressed){
  //  line(mouseX,mouseY,pmouseX,pmouseY);
    int zufall = (int)random(4);
    stroke((int)random(255),(int)random(255),(int)random(255));
    
    switch(zufall){
      case 1 :
        drawStar(mouseX,mouseY);
        break;
      case 2 :
        drawWings(mouseX,mouseY);
        break;
      case 3 :
        drawStar2(mouseX,mouseY);
        break;
    } 
  //  delay(50);
  } 
}


void drawStar(int x, int y){
  int lx;
  int ly;
  for (int i = 0; i< 10; i++){
    lx = (int)random(-10,10)*10;
    ly = (int)random(-10,10)*10;
    line(x,y,x+lx,y+ly);
  }
}

void drawWings(int x, int y){
  int i=0;
  int j=0;
  int anz = (int)random(40,100);
  int zufall = (int)random(3);
  
  switch(zufall){
      case 1 :
        while(i<=anz){
          line(x+j,y-j,x+2+i+j,y+2-i+j);
          line(x-j,y+j,x-2-i-j,y-2+i-j);
          i=i+5;
          j=j+2;
        }
        break;
      case 2 :
        while(i<=anz){
          line(x+j,y+j,x-2-i+j,y+2+i-j);
          line(x-j,y-j,x+2+i-j,y-2-i+j);
          i=i+5;
          j=j+2;
        }
        break;
    }
}

void drawStar2(int x, int y){
  int i = 100;
  int j = 0;
  int zufall = (int)random(5);
  
  switch(zufall){
      case 1 :
        while(i >= 0){
          line(x,y,x+i,y+j);
          i = i-10;
          j = j+10;
        }
        break;
      case 2 :
        while(i >= 0){
          line(x,y,x-i,y-j);
          i = i-10;
          j = j+10;
        }
        break;
      case 3 :
        while(i >= 0){
          line(x,y,x+i,y-j);
          i = i-10;
          j = j+10;
        }
        break;
       case 4 :
        while(i >= 0){
          line(x,y,x-i,y+j);
          i = i-10;
          j = j+10;
        }
        break;
   }
}


