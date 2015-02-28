
//Patrícia
void setup(){
  size(200,200);
    frameRate(15);
}


void draw(){



//grama
fill(1,80,32);

ellipse(100,100,100,100);
 
 //canteiro de flores
 
int cols = width;
int rows = height;
  
int[][] myArray = new int[cols][rows];
fill(232,82,12);
 ellipse(100,100,90,90);
 
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    myArray[i][j] = int(random(1000));
  }
    fill(12,200,245);
 stroke(4);
  ellipse(100,100,35,35);
  fill(136,141,142);
ellipse(100,100,10,10);
 fill(1,100,20);
rect(30,0,150,35);
rect(30,165,150,35);
rect(0,60,35,80);
rect(165,60,35,80);
}
  
// Draw points
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    stroke(myArray[i][j]);
    point(i,j);
  }

}


 
 //fonte
  
 
 
//rua
 

//banco
fill(193,109,42);
rect(95,0,25,10);
rect(0,90,10,25);
rect(189,80,10,25);
rect(95,188,25,10);
}
