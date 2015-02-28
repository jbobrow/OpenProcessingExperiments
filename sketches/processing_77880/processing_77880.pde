
//Elizabeth Gilson
//Midterm
//Lights 

PImage Slight;
float r = 0;
float theta = 0;
float meter;
int directionX;
float directionY;
float Wx, Wy;
//orange ellipse
float Esize;
float Eopacity;
float Ex;
float Ey;
//orang line
float Ox;
float Oy;
float dirOx;
float dirOy;
int Fx;
int Fdirectionx;
int Fdirectiony;
int Fy;

//blue wave///

float angle1, angle2;

int BcolorR;
int BcolorG;
int BcolorB;


void setup(){
  size(638,480);
  Slight = loadImage("Slight.png");
  image(Slight, 0, 0);
  smooth();
  meter=0;
  directionX=-1;
  directionY = -0.7;
  Wx = 230;
  Wy = 240;
  Esize=10;
  Eopacity=100;
  Ex=105;
  Ey=155;
  Ox= 105;
  Oy=155;
  dirOx=0;
  dirOy=0;
  Fx = 465;
  Fy = 230;
 Fdirectionx = 1;
 Fdirectiony = 1;
 BcolorR=207;
 BcolorG=211;
 BcolorB=190;
}

void draw(){
 noStroke();  
 float x = r * cos(theta);
 float y = r * sin(theta); //example 14-6 Blue Processing Book
 //blue wave//
float ang1 = radians(angle1);
float ang2 = radians(angle2); 

//time to blue ellipse
float sec=millis()/1000.0;
  
  
if(mousePressed && dist(mouseX, mouseY, 330, 250) <= 10){ 
  
  meter++;
}
  if (meter>=1){
    fill(253,253,201,90);
  ellipse(x+330, y+250, 3, 1); //# 8 (yellow)
  // Increment the angle
  theta += 0.2;
  // Increment the radius
  r += 0.08;
  
  //blue line//
  if(sec >= 8){
   
    Wx += directionX;
    Wy += directionY;
    Ox+=dirOx;
    Oy+=dirOy;
    
    fill(BcolorR, BcolorG, BcolorB,10); //blue line
    ellipse(Wx, Wy, 10, 10);
    fill(239,127,50,15); //orange line
    ellipse(Ox,Oy,10,10);
    //Wx += directionX;
    //Wy += directionY;
    //fill(207,211,190,90);
    angle1 += 2;
    angle2 += 15;
    if(dist(Wx,Wy,Ex,Ey) <= 10){
      Esize += 3;
      Eopacity -= 5;
      BcolorR=239;
      BcolorG=127;
      BcolorB=50;
      
      
      directionX = 0;
      directionY = 0;
      
      
      if(Esize >= 50){
        Ex = 1000;
        Ey = 1000;
    
        dirOx=1;
        dirOy=.2;
        
        if(Ox >=465){
          dirOx = 0;
          dirOy = 0;
          
        }
          
        
      }
      
      
    }
      
    
   }
}
 fill(255,90);
  ellipse(410,240,10,10); // # 9 green
 fill(255,90);
  ellipse(465,230,10,10); // #10 red
 fill(239,127,50,90);
  ellipse(105,155,10,10); //#4 orange
  fill(239,127,50,Eopacity);
  ellipse(Ex,Ey,Esize,Esize);
  
 fill(207,211,190,10);
  ellipse(232,238,15,15); //#7 blue 
  
  if(Ox >=465){
          Ox = 1000;
          Oy = 1000;
          dirOx = 0;
          dirOy = 0;
          fill(255,10);
           ellipse(Fx,Fy,10,10);

  Fx += Fdirectionx;
  Fy +=Fdirectiony;
       if(Fx > width){
    Fdirectionx = -1;
    
  }
  if(Fx < 0){
    Fdirectionx = 1;
  }
  if(Fy > height){
    Fdirectiony = -1;
  }
  if(Fy < 0){
    Fdirectiony = 1;
  
}  
      }
        

}


