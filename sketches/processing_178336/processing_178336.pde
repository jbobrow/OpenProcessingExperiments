
//Click to see it!
//Press h in the second and third image
//Press s or S to take a screenshot
//Press Delete to delete

PImage gelom, geloa,gelome, coracao;
boolean click = false; // Click will define the order of images and when the heart has to appear. 

void setup(){
  size(1080,720);
  gelom = loadImage("Medo.png");
  geloa = loadImage("Anjo.png");
  gelome = loadImage("Medoescrito.png");
  coracao = loadImage("coracao.png");
}  

void draw(){
  if(click == false){ 
    image(gelom, 0, 0); //Background
  }
} 

void mouseReleased(){
    if(click == false){
      image(gelome, 0, 0); //This image just appear when click is false, so it will be the second to appear
      
    }  
    else{
      image(geloa,0,0); //This image just appear when click is true. It will the third to appear. 
    } 
   click = true; 
}  

void keyReleased(){  
  if(key == DELETE) 
     background(000); //If pressed in background nothing changes, but if pressed in the other images the background becomes black
  if(key == 's' || key == 'S')
    saveFrame("screenshot.png");  
}     

void keyPressed(){     
  if(key == 'h' & click == true){ // You will see a heart if you press h!
    image(coracao, mouseX, mouseY);
  }  
}




