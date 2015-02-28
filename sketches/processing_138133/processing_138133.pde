
/*Together with progress and city planning, a number of problems 
associated to them will appear. 

Sometimes, what at first is only an invitation to populate the territory 
becomes a mad dash to mutual extinction due to a number of contingencies.

The city growth soon becomes hardly controllable, as in real life.
*/

/*
CC BY
Miguel Serrano
*/

//GLOBAL VARIABLES

int n=0;
float m;          //dimensional factor
PImage paisaje;   //background image

float posX[] = new float[2000];    //X positions array
float posY[] = new float[2000];    //Y positions array
float tam[] = new float[2000];     //relative dimensions array 
float lNeutra= 600;                   

//variables for the buildings
color strokeColor= color(0, 10);

float d=0.5;
 float x2;
 float y2;
 float x3;
 float y3;
 float x4;
 float y4;
 float x5;
 float y5;
 float x6;
 float y6;
 float x7;
 float y7;
 float x8;
 float y8;

//SETUP
void setup(){
  size(900, 600);
  paisaje= loadImage("paisaje.jpg");
  image(paisaje, 0, 0, 900, 600);
  textSize(16);
  fill(0, 0, 0);
  text("DRAG, BUILD ENOUGH", width/25, height/25);
}

//DRAW   drawing the smoke
void draw(){
  for (int s=0; s<2000; s++){    
    float r= random(255);
    strokeWeight(0);
    stroke(0, 0, 0, 80);
    fill(0, 40, 30, r);
    ellipse(posX[s]+r*r+random(100*tam[s]), posY[s]-5*r+random(20*tam[s]), 5*r*tam[s]+random(100), r*tam[s]);
  }
}


//MOUSEDRAGGED   drawing the buildings
void mouseDragged(){                          
  posX[n]= mouseX;                             
  posY[n]= mouseY;                            
  tam[n]= mouseY/lNeutra;
  fill(#FAFAFA);
  strokeWeight(1);
  stroke(0, 0, 0, mouseY/3);
  float m=mouseY/10;   //dimension factor
  pushMatrix();
  translate(mouseX, mouseY);

  //random position near the mouse, and dimensions
  float x1=random(-100/m, 100/m);         
  float y1=random(-50/m, 50/m);     
  float a=random(0, m);       
  float b=random(0, m);      
  float c=random(0, 2*m);    

  //random color and transparency
  float red=random(200, 210);   //100 250
  float green=random(140, 170);   //100 175
  float blue=random(125 ,130);       //0 250
  float trans=random((mouseY)/3);

  //vertices
  x2= x1+a*cos(d);
  y2= y1-a*sin(d);
  x3= x2+b*cos(d);
  y3= y2+b*sin(d);
  x4= x3-a*cos(d);
  y4= y3+a*sin(d);
  x5=x1;
  y5=y1-c;
  x6=x2;
  y6=y2-c;
  x7=x3;
  y7=y3-c;
  x8=x4;
  y8=y4-c;

  //block faces
  fill(red, green, blue, trans);
  //cara inferior
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
  //cara trasera izda
  quad(x1, y1, x5, y5, x6, y6, x2, y2);
  //cara trasera dcha
  quad(x6, y6, x7, y7, x3, y3, x2, y2);
  //cara delantera izda
  quad(x1, y1, x5, y5, x8, y8, x4, y4);
  //cara delantera dcha
  quad(x8, y8, x7, y7, x3, y3, x4, y4);
  //cara superior
  quad(x5, y5, x6, y6, x7, y7, x8, y8);    

  popMatrix();

  n++;
  if(n>1900){
    textSize(48);
    fill(#C0E8D7);  //E83112
    text("(enough)", 2*width/3, 4*height/5);
    n=0;
    noLoop();
   }
}



