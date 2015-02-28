
PImage  backroundImg; 
void setup (){

  size (720,540);
  
  backroundImg = loadImage ("meninas720x540.jpg");  // imagem de fundo



  for (int i = 0; i <  100; i++){ //gerador

    
  }
}


void draw (){
  
   background(255);// cor de fundo
     imageMode(CORNER); //modo da imagem
  
  
  image(backroundImg, 0, 0); //imagem de fundo ajustada ao tamanho
        

     float redSize = random (1);

    ellipse (190, 160, 70, 70); // posição da ellipse
  

    noStroke(); //sem linha de contorno
    fill (random(85), 70, 30);
    ellipse ( random(width), random(height),redSize,redSize);
  
    float yellowSize = random (80,35); // medida das bolas que passam  
    noStroke(); //sem contorno
    fill (random(255), random (255), 190);
    ellipse ( random(width), random(500,500), yellowSize, yellowSize); 
  


noStroke (); 
stroke(255,255,0); // stroke color
ellipse(random(width), random(height), 10, 10); //posicionamento da ellipse
    

stroke(random(255), random(255), random(255)); // random (R,G,B) 
arc ( width/2, height/1, 200,200, radians(0), radians ( random(360)) ); 



stroke(random(255), random(255), random(255)); // random (R,G,B) 
fill(random(255), random(255), random(255)); 
triangle(width/2-2, height/2, width/2, height/2-70, width/2+50, height/2); //posicionamento do triangulo
}






