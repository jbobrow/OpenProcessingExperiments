
int sz = 20;
int numGangsta = 30;
int i;

// creem una matriu de posicionsX amb "numGangsta" elements:

float[] posicionsX = new float[numGangsta];
//el mateix per posicionsY:
float[] posicionsY = new float[numGangsta];
//i per velocitatsX:
float[] velocitatsX = new float[numGangsta];
//i velocitatsY:
float[] velocitatsY = new float[numGangsta];
//color com a variable:
color[] colorGangsta = new color[numGangsta];


void setup(){

size(1000,900);
 
  for(int i=0; i<numGangsta; i++){
    posicionsX[i] = random(width/2-50, width/2+50);
    posicionsY[i] = random(height/2-50, height/2+50);
  
    velocitatsX[i] = random(1,3);
    velocitatsY[i] = random(1,3);
    //Color
    colorGangsta[i] = color(random(230), random(0), random(0));
  }
}


void draw(){
  
  background(250);
 
  for(int i = 0; i<numGangsta; i++){

    posicionsX[i] += random(-6,6);
    posicionsY[i] += random(-6,6);
    colorGangsta[i] = colorGangsta[i]+2;
 

    if((posicionsX[i]<0)||(posicionsX[i]>width)){
      velocitatsX[i] = -velocitatsX[i];
    }

    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    }
    
//delimitem amb els limits a la finestra
    
    //posX
    if(posicionsX[i]<2*50)
    {
      posicionsX[i] = 50*2;
    }
    if(posicionsX[i]>width-152)
    {
      posicionsX[i] = width-200*2;
    }
    
    //posY
    if(posicionsY[i]<height-657)
    {
      posicionsY[i] = height+15*50;
    }
    if(posicionsY[i]>height-3*50)
    {
      posicionsY[i] = height-3*50;
    }

//dibuix
   //background(255);
   dibcos(posicionsX[i],posicionsY[i]);
  }
}

void dibcos(float _x, float _y){

  
  
//cos
stroke(1);
fill(255,0,0);
rect(_x-85,_y-100,180,200,30,30,0,0);

//cames
stroke(1);
fill(3,46,82);
rect(_x+5,_y+100,80,35);
fill(3,46,82);
rect(_x-75,_y+100,80,35);
  
fill(67,27,3);
rect(_x-75,_y+135,90,20);

fill(67,27,3);
rect(_x+15,_y+135,80,20);

////bala
//noStroke();
//fill(173,157,157);
//ellipse(_x+260,_y-25,10,10);
//rect(_x+250,_y-30,10,10);

//cap
stroke(1);
fill(255,206,147);
rect(_x-55,_y-220,120,120,20,20,20,20);

fill(colorGangsta[i]);
ellipse(_x+5,_y-238,15,15);
fill(colorGangsta[i]);
rect(_x-100,_y-195,120,5,20,20,20,20);
fill(colorGangsta[i]);
rect(_x-57,_y-240,123,50,120,120,0,0);

fill(0);
rect(_x-55,_y-165,120,1,20,20,20,20);
fill(25,25,25);
ellipse(_x+62,_y-165,25,25);
fill(25,25,25);
ellipse(_x+22,_y-165,25,25);

//escopeta
fill(183,96,30);
quad(_x-40,_y-30,_x-85,_y+10,_x-60,_y+45,_x-10,_y-30);

fill(206,190,177);
rect(_x-40,_y-35,190,30);

fill(183,96,30);
rect(_x+50,_y-15,60,20);

fill(255,206,147);
ellipse(_x-35,_y-10,40,40);

fill(255,206,147);
ellipse(_x+82,_y-2,40,40);

//maniga
fill(255,3,3);
quad(_x-15,_y-30,_x-67,_y-17,_x-80,_y-75,_x-35,_y-93);

}

 void mousePressed(){
   
   for(int i = 0; i<numGangsta; i++){
   velocitatsX[i] = random(3,3);
    velocitatsY[i] = random(3,3);
  posicionsX[i] = mouseX;
  posicionsY[i] = mouseY;
   }  
 
   {
    colorGangsta [i] = color (mouseX, mouseY, 0);
}

}


