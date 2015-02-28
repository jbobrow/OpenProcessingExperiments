

// festlegen aller gebrauchten variablen
float vy=0, linienPara=50,
elliPara=50, beschleunigung=0;

// stage einrichten
void setup(){
size(150,600);
smooth();
}



void draw(){

background(255);



if(mousePressed){
  fill(255);
  stroke(0);


  if(linienPara>0.2){
  linienPara= linienPara-0.1;
  elliPara = elliPara+0.1;
  beschleunigung=beschleunigung+0.004;
  
  strokeWeight(linienPara);
  ellipse(75,vy,elliPara,elliPara);
  vy=vy-beschleunigung;
  }
  



}
else{
background(255);
fill(255);
stroke(0);
strokeWeight(50);
ellipse(75,550,elliPara,elliPara);

vy=550;
linienPara=50;
elliPara=50;
beschleunigung=0;
}

}






