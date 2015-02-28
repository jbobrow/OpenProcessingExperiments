

int anzahl = 2; 
 
void setup(){
  size(800,800); 
  background(255); 
 
  noStroke();
  smooth(); 
  frameRate(10); 
}
 
 
void draw() {
  noStroke();
  fill (255,50);
  rect (0,0,850,850);
  
    int anzahl = 3;

  for (int i=-1; i<anzahl; i=i+1){
      
     for (int j=-1; j<anzahl; j=j+1){

       FroschKopf (j*(width/anzahl),i*(height/anzahl));
       
   
     }
      
      

  }
  
} 
 
void mouseMoved() {
  for(int i=0; i<anzahl; i++){ 
     float x=width/2 + sin(frameCount/5.0)*255; // die kommerzahl muss sein, damit es flüssig läuft
     float y=height/2 + cos(frameCount/20.0)*350;
   
     float x2= x + sin(frameCount/23.0)*50;
     float y2= y + cos(frameCount/23.0)*50;
 
     float x3= x2 + sin(frameCount/3.0)*40;
     float y3= y2 + cos(frameCount/3.0)*40;
      Pfoten(x3,y3-10); 
      Pfoten(x3+40,y3);
  }
}
 
void Pfoten(float x, float y){ 
   noStroke();
  fill(#136A19); 
  for(int i=0; i<1; i++){ 
    pushMatrix();
    translate(x, y);
    noStroke();
     ellipse (20,30,20,18);
    
    ellipse (31,25,5,5);
    ellipse (24,20,5,5);
    ellipse (16,20,5,5);
    ellipse (9,25,5,5);
    
    ellipse (34,22,7,7);
    ellipse (25,15,7,7);
    ellipse (15,15,7,7);
    ellipse (7,22,7,7);
    popMatrix();
  }
}
 
void mousePressed(){ 
  background(255);
 
}


void FroschKopf(float x, float y){ 
  
    pushMatrix();
    translate(x, y);
    noStroke();
     fill(75,196,76);
  ellipse(150,150, 200,130); //KOPF
 
  noStroke();
  ellipse(100,100,80,70); //linkes Auge
  ellipse(200,100,80,70); //rechtes Auge
 
  
  arc(100,100, 80,70,radians(150),radians(335)); //linges Auge
  arc(200,100, 80,70,radians(205),radians(390)); //rechtes Auge
 
  fill(208,240,34);
  ellipse(100,100,55,50);//Augen
  ellipse(200,100,55,50);
 
  fill(0);
  ellipse(100,100,40,35);//IRIS
  ellipse(200,100,40,35);
 
  fill(255);
  stroke(1);
  ellipse(107,91,13,13);//PUPILLE
  ellipse(193,91,13,13);
 
  fill(0);
  ellipse(145,140,5,5);//NASE
  ellipse(155,140,5,5);
 
  fill(255,0,0,random(-255,255));

  arc(150,160, 100,50, 0, PI); //MUND
    popMatrix();
  }


