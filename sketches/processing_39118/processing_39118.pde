
void setup() {
  frameRate(60);
  size(screen.width, 600);
  smooth();
  background(255);
}

float coordX1=500;
float coord2X1= coordX1;
float coordY1=300;
float coord2Y1= coordY1;
float coordX2, coordY2, coord2X2, coord2Y2, chrono;
float taille= 10;
float contour1, contour2= 0.5;

void draw() {
  if(coordX2<=0){
    coordX2= coordX1 + taille;
  }else{if(coordX2>=width){
    coordX2= coordX1 - taille;
  }else{coordX2=coordX1+random(-taille, taille);};};
  
  if(coordY2<=0){
    coordY2= coordY1 + taille;
  }else{if(coordY2>=height){
    coordY2= coordY1 - taille;
  }else{coordY2=coordY1+random(-taille, taille);};};
  
  stroke(0);
  
  
  strokeWeight(contour1);
  line(coordX1, coordY1, coordX2, coordY2);
  coordX1=coordX2;
  coordY1=coordY2;
  
  contour1=contour1+random(-0.5,0.5);
  if(contour1<=0){
    contour1=0.1;
  };
  
  strokeWeight(contour2);
  if(coord2X1<=0){coord2X1=width;};
  if(coord2X1>=width){coord2X1=0;};
  if(coord2Y1<=0){coord2Y1=height;};
  if(coord2Y1>height){coord2Y1=0;};
  coord2X2=coord2X1+random(-taille, taille);
  coord2Y2=coord2Y1+random(-taille, taille);
  line(coord2X1, coord2Y1, coord2X2, coord2Y2);
  coord2X1=coord2X2;
  coord2Y1=coord2Y2;
  
  contour2=contour2+random(-0.5,0.5);
  if(contour2<=0){
    contour2=0.1;
  };
  
  chrono++;
  if(chrono==50){
    chrono=0;
    fill(255,1);
    noStroke();
    rect(0,0,width,height);
  }
}


