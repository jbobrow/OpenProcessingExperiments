
//calculate the area of a triangle with Heron's formula

int cont = 0;
int x1, y1, x2, y2, x3, y3;
float lato1,lato2,lato3;
float area;

void setup() {
  size(400, 400);
  background(10, 80, 100);
  strokeWeight(1);
  stroke(0,0,0,100);
}

void draw() {
}

void mousePressed() {
  if(cont == 0){
    background(10, 80, 100);
    fill(255);
    x1 = mouseX;
    y1 = mouseY;
    point(x1,y1);
    textAlign(CENTER);
    text("point 1 ("+x1+", "+y1+")",x1, y1-10);
    cont++;
  }
  
  else if(cont==1){
    x2 = mouseX;
    y2 = mouseY;
    point(x2,y2);
    lato1 = distanza(x1,y1,x2,y2);
    
    textAlign(LEFT);
    text("side(1,2): " + (int)lato1, 10, 13);
    
    textAlign(CENTER);
    text("point 2 ("+x2+", "+y2+")",x2, y2+20);
    
    cont++;
  }
  
  else if(cont==2){
    x3 = mouseX;
    y3 = mouseY;
    point(x3,y3);
    
    textAlign(CENTER);
    text("point 3 ("+x3+", "+y3+")",x3, y3+20);
  
    lato2 = distanza(x2,y2,x3,y3);
    lato3 = distanza(x3,y3,x1,y1);
    
    area = sqrt( (lato1+lato2+lato3) * (((-1)*lato1)+lato2+lato3) * (lato1 + ((-1)*lato2) +lato3) * 
           (lato1 + lato2 + ((-1)*lato3)) ) / 4;
    
    textAlign(LEFT);
    text("side(2,3): " + (int)lato2, 10, 27);
    text("side(3,1): " + (int)lato3, 10, 41);
    text("area: " + (int)area, 10, 60);
        
    fill(255,80);
    triangle(x1, y1, x2, y2, x3, y3);
    
    cont=0;
  }  
  
}

float distanza(int x1, int y1, int x2, int y2){
  return sqrt( pow(x2-x1,2) + pow(y2-y1,2) );
}
