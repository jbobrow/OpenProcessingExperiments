
//basado en el ejemplo snake
//declaracion dos arrays
int [] xpos= new int [100];
int [] ypos= new int [100];


void setup (){
  
  size (600,600);
  smooth ();
  
  for (int i = 0; i< xpos.length; i++){ 
  xpos [i] = 0;
  ypos [i] = 0;
 }

}
void draw() {
  //background (255);
  //condicional.cuando el ratón esta en la mitad izqda el fondo es cuando pasa a la drecha pasa a ser gris
  if (mouseX < width/2){
  background (255); 
}else {
  background (#D1CFCF); 
}
  
  for (int i = 0; i< xpos.length-1; i++) {
xpos [i]= xpos [i+1]; 
ypos [i]= ypos  [i+1];

}
xpos[xpos.length-1] = mouseX; 
ypos[ypos.length-1] = mouseY; 

for (int i=0; i< xpos.length-1; i++){
  stroke(random(200), random(200), 100, random(500)); 
  
  line (xpos[i], ypos[i],30, 30); 
  
}

}

