

void setup() {  //setup function called initially, only once
  size(301, 301);
  background(255);  //set background white
  
}

void draw() {  //draw function loops 
  
  
  stroke(0);
  dessiner_grille();
  
  
}


void dessiner_grille(){

for (int i = 0 ; i <= width ; i+=10){

line(i,0,i,height);

for (int j = 0 ; j <= height ; j +=10){
line(0,j,width,j);



}

}



}
