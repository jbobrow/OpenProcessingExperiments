
String [] TCGA = {"T","C","G","A"," "};
String [][] DNAValue = new String[4][29];
PImage Humain;
PImage mapTerrain;
boolean tableauMap= false;
boolean switchTableau = false;
int positionX = 0;
int positionY = 0;

float i=0,j=0,zindex=5;
float angle=(PI/180)*1,majorangle=(PI/180)*1;
float radiuscontrol=(PI/180)*0.5;
float coord_x=0,coord_y=0;
boolean reinititDNA = false;


void setup()
{
   Humain = loadImage("Humain.png");
   mapTerrain = loadImage("map.png");
   for( int i = 0; i < 4; i++){ 
    for( int j = 0; j < 29; j++){
      DNAValue[i][j] = TCGA[4];
    }
   }
    background(5,5,5);
  size(700,700); 
  frameRate(30);  
}

void draw()
{
  if ( switchTableau == true){
    background(0);
    switchTableau = false;
  }
  strokeWeight(3);
  if( tableauMap == true){

  } else{
  dna();
  tgca();
  indicateurs();
  }
  
}

void interfaceConsole(){

}

void indicateurs(){
  pushMatrix();
  translate(350, 0);
  strokeWeight(1);
  fill(0);
  rect( 0,0, width/2,height);
  for( int i = 0; i < 6; i++){
    fill(255,0,0);
    rect( (i * 50)+10,height/2 , 50,(cos(frameCount*0.000009*((i+2)*100))*(100*((i+2)/2)))+1);
    stroke(255,255,127);
    
    line(0, width/2, width/2, width/2);
  }
  popMatrix();
}

void tgca(){
  fill(0);
  stroke(255);
  pushMatrix();
  
  translate(2,-2,0);
  rect( 0, 0, 85, 718);
  fill(255);
 
  for( int i = 0; i < 4; i++){ 
    for( int j = 0; j < 29; j++){
       int regulerDNA = int(random(0,500));
       
       if ( regulerDNA == 1){
       int rand = int(random(0, 5));
       DNAValue[i][j] = TCGA[rand];
       }
    text(DNAValue[i][j], (i*24)+1, j*25); 
    }
    
  }
  popMatrix();
}

void dna(){
    coord_x=50;
    coord_y=100;
    if( radiuscontrol > 13){
     background(5,5,5);
     radiuscontrol = (PI/180)*0.5;
     angle = (PI/180)*1;
     majorangle= (PI/180)*1;
     coord_x=100;
     coord_y=100;
     i=0;
     j=0;
     zindex=5;
    }
    stroke(255,255,127);
    fill(255,0,0);
    ellipse(coord_x*cos(angle+PI)+200, (coord_y*sin(angle+PI)+i)/zindex, (10)*sin(radiuscontrol-(PI/4)), (10)*sin(radiuscontrol-(PI/4)));
    
     stroke(255,0,0);
    ellipse(coord_x*cos(angle)+200, (coord_y*sin(angle)+i)/zindex, (10)*sin(radiuscontrol-(PI/4)), (10)*sin(radiuscontrol-(PI/4)));
    angle=angle+(PI/180)*1;
    radiuscontrol=radiuscontrol+(PI/180)*1;   
    i=i+5;
    if((i%20)==0)
    {
      line(coord_x*cos(angle+PI)+200, (coord_y*sin(angle+PI)+i)/zindex,coord_x*cos(angle)+200, (coord_y*sin(angle)+i)/zindex);
    }
    majorangle=majorangle+(PI/180)*1; 
  
 // println(zindex);  
}
