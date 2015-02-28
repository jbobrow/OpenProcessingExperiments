
PFont letra;

void setup(){
  size(900, 900);
  background(0);
  fill(165);
  
  letra = loadFont("CooperBlack-48.vlw");
  
  textFont(letra,48);
}

void draw(){
  fill(0,4);
  rect(0,0,width,height);
  fill(255);
  
  if(mousePressed){
    fill(255,0,0);

    text("Escribiendo en proccesing", mouseX, mouseY);
    } 
    else
     
     text("Escribiendo",mouseX, mouseY);
}


                
                
