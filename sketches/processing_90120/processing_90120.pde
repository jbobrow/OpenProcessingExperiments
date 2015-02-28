
int Franno = 80;
int SSS = 200;
float Bi = 45.5;
String Desp = "Yixin";


void setup(){
  size(600,600);
  
 }
 
 
void draw(){
  background(0,255,255);
  println("Supreme");
  fill(255,255,0);
  ellipse(450,450,Franno,Bi);
  fill(230,123,SSS);
  rect(230,450,Bi,Franno);
  
 if(key == 'R'){
     background(255,0,255);
 
 }
 
  if(key == 'B'){
    background(0,0,0);
 
}
  

  
}


  void mouseMoved(){
  fill(0,0,300);
  ellipse(200,200,80,80);
  
}



  void mouseClicked(){
  fill(255,255,255);
  ellipse(100,100,80,80);

}

 
  
    

