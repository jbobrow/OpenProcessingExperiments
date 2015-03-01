
float mediaSec, mediaSec2, mediaSec3; //não esquecer de colocar todos os mediaSec aqui

void setup(){
  size(330,300);
}

void draw(){
  background(255);
  
  mediaSec = map(second(), 0,59,173,38); //Red muda do valor 173 ao 38, conforme segundos
  mediaSec2 = map(second(), 0,59,37,115); //Blue muda do valor 37 ao 115, conforme segundos
  mediaSec3 = map(second(), 0,59,37,137); //Green muda do valor 37 ao, 137 conforme segundos
  
  noStroke();
  fill(mediaSec,mediaSec2,mediaSec3);
  rect(width/2-50,height/2-50,100,100);
  
  
}


