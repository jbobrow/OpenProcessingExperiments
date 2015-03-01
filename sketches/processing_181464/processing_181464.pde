
mosca[] us = new mosca[100];

int size2 = 1;
int z = 0;
boolean matar = false;
boolean encender = false;

void setup(){
  size(600,600);
  for (int i = 0;i < us.length;i++){
    us[i] = new mosca(random(width), random(height), random (2,10), color(random(198,228),255,0), random(0,10));
  }
  
  
  
}
void draw(){
  

  background(247,208,173);
  fondoVentana();
  mataMoscas();
  for (int i = 0;i < us.length && i < size2;i++){
    us[i].dibuixa();
    us[i].moure();
    size2 = size2 + 1;
  }
  dibuixaFondo();
  dibuixaFinestra();
  
  

}
void mousePressed(){
  matar = true;
  encender = true;
 
}

void mouseReleased(){
    matar = false;
    encender = false;
    
  }
class mosca{
  float xPos;
  float yPos;
  float radi;
  float pos2;
  float posRandomX = random(135,178);
  float posRandomY = random(160,206);
  color c;
  
  
  mosca(){
    xPos = width/2;
    yPos = height/2;
    radi = 20;
    c = color(0,0,255);
  }
  
  mosca(float x, float y, float r, color col, float z){ 
    xPos = x;
    yPos = y;
    radi = r;
    pos2 = z;
    c = col;
  }
  void dibuixa(){
    noStroke();
    fill(c); 
    ellipse(xPos, yPos, radi, radi);
  }
  
  void moure(){
    if(matar == false){
        xPos =  (xPos + random(-20,20)) + (400-xPos)/40;
        yPos =  (yPos - random(-20,20)) + (300-yPos)/40;
  
    }else{ 
     
        xPos =  xPos  + (135-xPos)/40;
        yPos =  yPos  + (160-yPos)/40;
        if(xPos <= 180 && yPos <= 210){
           xPos = posRandomX;
           yPos = posRandomY;
    }
       
 
      
      
     
     
    }
  }
  
  
}
void dibuixaFondo(){
    fill(255,255,255);
    strokeWeight(1);
    
    //suelo
    stroke(247,208,173);
    fill(247,208,173);
    rect(-1, 450, 601, 450);
    
    
   
  }
  
void dibuixaFinestra(){
    //ventana
    //marco interior ventana
    stroke(120,77,39);
    fill(120,77,39);
    rect(295,50,10,400);
    rect(50,245,500,10);
    //marco exterior ventana
    rect(50,50,500,20);
    rect(50,50,20,400);
    rect(550,50,20,400);
    rect(50,450,520,20);
    
    
}

void mataMoscas(){
    stroke(0,0,0);
    
    //mata moscas
    
    fill(81,85,87);
    rect(150, 71, 10, 50);
    ellipse(155, 137, 50, 50);
    if(encender == false){
        fill(27,27,27);
        rect(130, 130, 50, 110);
    }else{
        fill(28,167,255);
        rect(130, 130, 50, 110);
    }
    fill(81,85,87);
    rect(122, 130, 67, 25);
    rect(122, 210, 67, 25);
  
  }
  void fondoVentana(){
    //fondo ventana
    fill(20,23,54);
    rect(50,50,500,500);
    
    //terrafondo
    stroke(4,21,1);
    fill(4,21,1);
    beginShape();
    curveVertex(60,320);
    curveVertex(61,320);
    curveVertex(160,315);
    curveVertex(400,330);
    curveVertex(550,350);
    curveVertex(500,480);
    curveVertex(60,480);
    curveVertex(60,320);
  endShape();
  
  }
  


