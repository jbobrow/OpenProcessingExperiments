
//Joan farre prctica 4


int numeroboles = 15;
int colordibuix = 210;

//  posicioX

float[] posicionsX = new float[numeroboles];

// posicioY

float[] posicionsY = new float[numeroboles];

// velocitatX

float[] velocitatX = new float[numeroboles];

// velocitatY

float[] velocitatY = new float[numeroboles];


void setup(){
  size(700,700);
  
  
  
  for(int i=0; i<numeroboles; i++){
    
    posicionsX[i] = random(width/2-90, width/2+90);
    posicionsY[i] = random(width/2-90, width/2+90);
    
    //Les velocitats 
    
    velocitatX[i] = random(1,4);
    velocitatY[i] = random(1,4);
    
  }
}

void draw(){
  
  background(180);
  
  //bucle
  
  for(int i = 0; i<numeroboles; i++){
    //posicions
    posicionsX[i] += random(-8,8);
    posicionsY[i] += random(-8,8);
    
    
    
    if((posicionsY[i]<0) || (posicionsY[i]<height)){
     
    velocitatY[i] = -velocitatY[i];
    }
    
    //dibuixem
    
    dibuix(posicionsX[i],posicionsY[i]);
  }
}

void dibuix (float _x, float _y)
  {
    
strokeWeight(2);
fill(250,205,177);
ellipse( _x,_y,105,135);


fill(255);
ellipse( _x-25,_y,51,65);
ellipse( _x+25,_y,51,65);  

fill(colordibuix);
ellipse( _x-25,_y,20,15);
ellipse( _x+25,_y,20,15); 


line(_x-20,_y+50,_x+20,_y+50);
}


 void mousePressed()

{
  colordibuix = color (mouseX, mouseY, 0);
}
    
