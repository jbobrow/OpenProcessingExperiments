
boolean grid;
boolean Bsize;
boolean Blight;
boolean Bmid;
boolean Bheavy;
boolean Rain;
int lineColor;
float lineWeight;
int buttonWeight;
int buttonWeight2;
int BWlight;
int BWmid;
int BWheavy;
int GridC;
float DrawPosX;
float DrawPosY;
float x,y,z;
PImage Wall;

Circle circle1;
float ellSize;
int Sx;
int Sy;
Circle [] circles;


void setup(){ //---------------------------------------------------
  size(800,600);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  grid = false;
  Bsize = false;
  Blight = false;
  Bmid = false;
  Bheavy = false;
  Rain = false;
  lineColor = 1;
  lineWeight = 1;
  buttonWeight = 1;
  buttonWeight2 = 1;
  BWlight = 1;
  BWmid = 1;
  BWheavy = 1;
  GridC = 50;
  DrawPosX = 0;
  DrawPosY = 0;
  background(360, 0, 100);
  Panel();
  x=0;
  y=0;
  z=0;
  Wall = loadImage("BrickWall.jpg");
  image(Wall,0,520);
  
  //RAIN---------------------
  circles = new Circle[1000];
  for (int i =0; i < circles.length; i++){
    circles[i] = new Circle(random(width),random(height),random(1,10));
  }
}

void draw(){ //---------------------------------------------------
  ButtonStroke();
  ButtonGrid();
  rect(710,550,30,30); 
  fill(0);
  text("RAIN", 710,570);
  noStroke();
 /* Panel();
  ButtonStroke();
  ButtonGrid();
  Popup();
  grid();
*/  
  x = tan(radians(z)) * mouseX/100;
  y = cos(radians(z)) * mouseY/100;
  z++;
  if(z > 360){
    z = 0;
  }

  
 // println(x);
 // println(y);
  
  
  //DRAW----------------------------------------------------------
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 520) {
    if(mousePressed){
    stroke(360,100,1);
    strokeWeight(lineWeight);
   // DrawPosX = mouseX + (x);
   // DrawPosY = mouseY + (y);
  
    tri();
    
    } 
  }
  
  //RAIN -----------------------------------------------------------
 if(mouseX > 710 && mouseX < 740 && mouseY > 500 && mouseY < 580){
   if(mousePressed){
     if(Rain){
       Rain = false;
       println("Rain False");
     } else if (!Rain){
       Rain = true;
       println("RAIN!");
       Rain();
     }
   }
 }

}


void mousePressed(){
//STROKE BUTTON --------------------------------------------------
  if(mouseX > 20 && mouseX < 50 && mouseY > 550 && mouseY < 580) {
    if(mousePressed){
      if(Bsize){
         Bsize = false;
         println("Stroke false");
          buttonWeight = 1;
          //fill(50);
          //rect(65,520,190,80);
          image(Wall,0,520);

       } else if (!Bsize){
           Bsize = true;
           buttonWeight = 4;
           println("Stroke true");
           Popup();
         }
       }
   }

   
//WeightCharger -------------------------------------------------- 
 if (Bsize == true) {
   if(mouseX > 80 && mouseX < 110 && mouseY > 550 && mouseY < 580) {
     if(mousePressed){
       if(Blight){
         Blight = false;
         println("1 false");
         BWlight = 1;
         BWmid = 1;
         BWheavy = 1;       
       } else if (!Blight){
         Blight = true;
         BWlight = 4;
           lineWeight = .2;
         println("1 true!");
       }
     }
   }
   if(mouseX > 140 && mouseX < 170 && mouseY > 550 && mouseY < 580) {
     if(mousePressed){
       if(Bmid){
         Bmid = false;
         println("2 false");
         BWlight = 1;
         BWmid = 1;
         BWheavy = 1;       
       } else if (!Blight){
         Bmid = true;
         BWmid = 4;
           stroke(x,50,50,y);
           lineWeight = 1;
         println("2 true!");
       }
     }
   }
   if(mouseX > 200 && mouseX < 230 && mouseY > 550 && mouseY < 580) {
     if(mousePressed){
       if(Bheavy){
         Bheavy = false;
         println("3 false");
         BWlight = 1;
         BWmid = 1;
         BWheavy = 1;       
       } else if (!Bheavy){
         Bheavy = true;
         BWheavy = 4;
           lineWeight = 4;
         println("3 true!");
       }
     }
   }
 }
//GRID BUTTON ------------------------------------------------------   
 if (mouseX > 750 && mouseX < 780 && mouseY > 550 && mouseY < 580) {
     if(mousePressed){
       if(grid){
         grid = false;
         buttonWeight2 = 1;
           grid();
           GridC= 50;
         println("Grid false");
       } else if (!grid){
           grid = true;
           println("Grid true");
           buttonWeight2 = 4;
           grid();
           GridC= 100;
         }
       }
  }
  

}
//------------------------------------------------------------------
void Panel(){
  fill(50);
  noStroke();
//  image(Wall,0,520);
//  rect(0,520,800,80);
}
  
void ButtonStroke(){
   stroke(z,z,100);
   fill(250);
  // stroke(360,0,1);
   strokeWeight(buttonWeight);
   rect(20,550,30,30);  //1st Button
   strokeWeight(1);
   line(25,555,45,555);
   strokeWeight(4);
   line(25,560,45,560);
   strokeWeight(10);
   line(26,570,43,570);
}

void ButtonGrid(){
   fill(250);
   stroke(z,z,100);
   strokeWeight(buttonWeight2);
   rect(750,550,30,30);
   strokeWeight(1);
   line(760,555,760,575);
   line(770,555,770,575);
   line(755,560,775,560);
   line(755,570,775,570);
}

void Popup(){
   fill(150,70);
   rect(0,520,250,80);
   fill(360,0,100,20);
   stroke(z,z,100);
   strokeWeight(BWlight);
   rect(80,550,30,30); //light
   strokeWeight(BWmid);
   rect(140,550,30,30);  //mid
   strokeWeight(BWheavy);
   rect(200,550,30,30);  //heavy
   //Stroke
     //stroke(360,0,1);
     strokeWeight(1);
     line(85,565,105,565);
     strokeWeight(4);
     line(145,565,165,565);
     strokeWeight(10);
     line(210,565,220,565);
}

void grid(){
  stroke(0,0,GridC);
      strokeWeight(1);
       for(int x = 0; x < 40; x++){
        for(int y = 0; y < 26; y++){
          noFill();
          rect(x*20,y*20,20,20);
        }
      }     
}

void tri(){
  noFill();
  stroke(360,0,1);
  translate(mouseX,mouseY);
  for(int i = 0; i < 360; i ++){
   // strokeWeight(lineWeight);
   // rect(0,0,10,10);
    stroke(z,z,100,10);
    triangle(0,0,50,50,0,40);
    strokeWeight(lineWeight);
   // line(0,0,200,200);
    rotate(radians(10));
    //stroke(360,0,1);
  }
}


//RAIN ----------------------------------------------------
void Rain(){
 fill(255,10);
 // rect(0,0,width,height);
  for(int i = 0; i < circles.length; i ++){
    circles[i].moveC();
    circles[i].display();
  }
}

class Circle{
  float x,y,speedx,speedy, ellSize;
//constructor
  Circle(float _x,float _y,float _ellSize){  //or position x = posx
    x = _x;                //_x gets push into the X
    y = _y;
    speedx = Sx;
    speedy = Sy;
    ellSize = _ellSize;
    if(_ellSize > 8){
      Sy = 3;
    } else if(_ellSize < 7){
      Sy = 1;
    }
  }

//methods
  void moveC(){
    x+=speedx;
    y+=speedy;
    

    
    if(y > 600){
      y = 0;
    }
  }
  void display(){
    fill(360,0,100,30);
    ellipse(x,y,1+(ellSize),1+(ellSize));

  
  }
}

