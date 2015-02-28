
void setup(){smooth();
size(500,500);
}

void draw(){
  background(255,255,255);
  randomSeed(mouseX);

//Variablen 
  int wert1 = 20;
  int wert2 = 50;
  
  
  //Schleifen
  for(int i = 0; i<wert2; i++){
  for(int j = 0; j<wert2; j++){
  
  pfeil(width/wert1*j, height/wert1*i, width/wert1*j, height/wert1*i, j/5 );  
    
  }
  }
  
  
  
  //stroke(255,0,0);
  //line(10,20+5,10+20,20+5);  
  //line(10+15,20,10+20,20+5);
  //line(10+15,20+10,10+20,20+5);
  
  //stroke(255);
  //line(10+21,20+5,10+25,20+5);
 
  
  
}





void pfeil(float x1, float y1, float x2, float y2, float fett){
  
 stroke(255);
  line(x1+21,y1+5,x2+25,y2+5);

  strokeWeight(fett+1);
  stroke(255,0,0);
  line(x1,y1+5,x2+20,y2+5);  
  line(x1+15,y1,x2+20,y2+5);
  line(x1+15,y1+10,x2+20,y2+5);
  
 
}


