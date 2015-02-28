

class Cell {
  float x,y;   
  float w,h;  
  float farbe1,farbe2,farbe3; 

  Cell(float tempX, float tempY, float tempW, float tempH, float tempfarbe1,float tempfarbe2,float tempfarbe3) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    farbe1 = tempfarbe1;
    farbe2 = tempfarbe2;
    farbe3 = tempfarbe3;
  }
  //veraendern der farbe durch  die maus
  void oscillate() {
    float f1alt=farbe1;
    float f2alt=farbe2;
    float f3alt=farbe3;
    float durch1=(farbe2+farbe3)/2;
    float durch2=(farbe1+farbe3)/2;
    float durch3=(farbe2+farbe1)/2;
    float grau=abs(farbe1-durch1)+abs(farbe2-durch2)+abs(farbe3-durch3);

    //weg vom durchschnittsgrau
    farbe3=farbe3+0.003*(f3alt-durch3);
    farbe2=farbe2+0.003*(f2alt-durch2);
    farbe1=farbe1+0.003*(f1alt-durch1);

    //zufallsaenderungen
    farbe1=farbe1+random(-12,12);
    farbe1=constrain(farbe1,15,255);
    farbe2=farbe2+random(-12,12);
    farbe2=constrain(farbe2,15,255);
    farbe3=farbe3+random(-12,12);
    farbe3=constrain(farbe3,25,255);
    // falls noch zu dunkel, dann verstaerken
    if(durch1+durch2+durch3<200){
      farbe1=farbe1*1.1; 
      farbe2=farbe2*1.1; 
      farbe3=farbe3*1.1; 
    }
    //falls zu grau, dann aufmischen
    if(grau<120){
      farbe1=farbe1*random(0.8,1.2); 
      farbe2=farbe2*random(0.8,1.2); 
      farbe3=farbe3*random(0.8,1.2); 
    }
  }

  // }

  void display() {
    stroke(0);
    fill(farbe1,farbe2,farbe3);
    rect(x,y,w,h);
  }
}

//------------------------------bis hier definition der klasse cell mit den methoden display und oscillate

Cell[][] grid; 
int cols = 30;
int rows = 30;


//------------------------ausgleich (koennte auch direkt bei keypressed unten stehen
void ausgleich(){
  for (int i = 1; i < cols-1; i ++ ) {
    for (int j = 1; j < rows-1; j ++ ) {
      grid[i][j].farbe1 =(20*grid[i][j].farbe1+grid[i-1][j].farbe1+grid[i+1][j].farbe1)/22 ;
      grid[i][j].farbe1 =(20*grid[i][j].farbe1+grid[i-1][j+1].farbe1+grid[i+1][j-1].farbe1)/22 ;

      grid[i][j].farbe2 =(20*grid[i][j].farbe2+grid[i-1][j-1].farbe2+grid[i+1][j+1].farbe2)/22 ;
      grid[i][j].farbe2 =(20*grid[i][j].farbe2+grid[i-1][j+1].farbe2+grid[i+1][j-1].farbe2)/22 ;

      grid[i][j].farbe3 =(20*grid[i][j].farbe3+grid[i-1][j].farbe3+grid[i+1][j].farbe3)/22 ;
      grid[i][j].farbe3 =(20*grid[i][j].farbe3+grid[i][j+1].farbe3+grid[i][j-1].farbe3)/22 ;
      
      
      grid[i][j].farbe2 =(20*grid[i][j].farbe2+grid[i-1][j].farbe1+grid[i+1][j].farbe1)/22 ;
      grid[i][j].farbe2 =(20*grid[i][j].farbe2+grid[i-1][j+1].farbe1+grid[i+1][j-1].farbe1)/22 ;

      grid[i][j].farbe3 =(20*grid[i][j].farbe3+grid[i-1][j-1].farbe2+grid[i+1][j+1].farbe2)/22 ;
      grid[i][j].farbe3 =(20*grid[i][j].farbe3+grid[i-1][j+1].farbe2+grid[i+1][j-1].farbe2)/22 ;

      grid[i][j].farbe1 =(20*grid[i][j].farbe1+grid[i-1][j].farbe3+grid[i+1][j].farbe3)/22 ;
      grid[i][j].farbe1 =(20*grid[i][j].farbe1+grid[i][j+1].farbe3+grid[i][j-1].farbe3)/22 ;
    }
  }
}
//------------------------------setup - initialisieren der cell-objekte
void setup() {
  size(600,600);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      grid[i][j] = new Cell(i*width/rows,j*height/cols,width/rows,height/cols,25,25,25);
    }
  }
}
//--------------------------------reaktion auf tastendruck
void keyPressed(){
  //------------------------------b=blauer
  if(key=='b'){
    for (int i = 0; i < cols; i ++ ) {
      for (int j = 0; j < rows; j ++ ) {
        grid[i][j].farbe3 = constrain( grid[i][j].farbe3*(1+random(-0.05,0.1)),0,255);
      }
    }
  } 
  //---------------------------------------r=röter
  if(key=='r'){
    for (int i = 0; i < cols; i ++ ) {
      for (int j = 0; j < rows; j ++ ) {
        grid[i][j].farbe1 = constrain( grid[i][j].farbe1*(1+random(-0.05,0.1)),0,255);
      }
    }
  }

  //--------------------------------------g=grüner
  if(key=='g'){
    for (int i = 0; i < cols; i ++ ) {
      for (int j = 0; j < rows; j ++ ) {
        grid[i][j].farbe2 = constrain( grid[i][j].farbe2*(1+random(-0.05,0.1)),0,255);
      }
    }
  } 
  //--------------------------------s=supermixer  
  if(key=='s'){
    for (int i = 1; i < cols-1; i ++ ) {
      for (int j = 1; j < rows-1; j ++ ) {
        float alt1,alt2,alt3;
        alt1=grid[i][j].farbe1;
        alt2=grid[i][j].farbe2;
        alt3=grid[i][j].farbe3;
        grid[i][j].farbe1 = abs(alt1+alt2-alt3+random(-1,1))/1.27;
        grid[i][j].farbe2 = abs(alt3+alt2-alt1+random(-1,1))/1.27-1 ;
        grid[i][j].farbe3 = 1+abs(alt1+alt3-alt2+random(-1,1))/1.27;


      }
    }
  }
  //--------------------------------k=kontrast  
  if(key=='k'){
    for (int i = 0; i < cols; i ++ ) {
      for (int j = 0; j < rows; j ++ ) {

        grid[i][j].farbe1 = grid[i][j].farbe1*1.05;
        grid[i][j].farbe1 = grid[i][j].farbe1%255;
        grid[i][j].farbe2 = grid[i][j].farbe2*1.05;
        grid[i][j].farbe2 = grid[i][j].farbe2%255;
        grid[i][j].farbe3 = grid[i][j].farbe3*1.05;
        grid[i][j].farbe3 = grid[i][j].farbe3%255;

      }
    }
  }
  //------------------------------------------------------------ a=ausgleichen mit nachbarn 
  if(key=='a'){
    ausgleich();
  } 
  //---------------------------------------------------------i=invertieren
  if(key=='i'){
    for (int i = 0; i < cols; i ++ ) {
      for (int j = 0; j < rows; j ++ ) {

        grid[i][j].farbe1 =  abs(grid[i][j].farbe1-255.0);
        grid[i][j].farbe2 =  abs(grid[i][j].farbe2-255.0);
        grid[i][j].farbe3 =  abs(grid[i][j].farbe3-255.0);
      }
    }
  }
  //---------------------------------------m=milder machen (vergrauen)
  if(key=='m'){
    for (int i = 0; i < cols; i ++ ) {
      for (int j = 0; j < rows; j ++ ) {

        grid[i][j].farbe1 =(20*grid[i][j].farbe1 +abs(grid[i][j].farbe3-255.0))/21;
        grid[i][j].farbe2 = (20*grid[i][j].farbe2+ abs(grid[i][j].farbe1-255.0))/21;
        grid[i][j].farbe3 =  (20*grid[i][j].farbe3+abs(grid[i][j].farbe2-255.0))/21;
      }
    }
  }
}
//---------------------------------draw

void draw() {
  background(0);
  for (int i = 1; i < cols-1; i ++ ) {     
    for (int j = 1; j < rows-1; j ++ ) {
      if(int(mouseX/20)==i&&int(mouseY/20)==j){
        grid[i][j].oscillate();
        grid[i-1][j].oscillate();
        grid[i+1][j].oscillate();
        grid[i][j-1].oscillate();
        grid[i][j+1].oscillate();
        grid[i-1][j-1].oscillate();
        grid[i+1][j+1].oscillate();
        grid[i+1][j-1].oscillate();
        grid[i-1][j+1].oscillate();
      }
      grid[i][j].display();
    }
  }
}










