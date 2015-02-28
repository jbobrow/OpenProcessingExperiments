


void level_1_1(){
//cielo
  image(sky1, 0, 0); 
//nuvole random
  image(clouds1, clouds1X, 50);
  if(clouds1X >= 800){
    clouds1X = -800;
  }
  clouds1X = clouds1X +0.3;
//sfondo
  image(landscape1, 0, 0);
//collina
  image(hill1, 0, 0);
//seme cade e si ferma
  image(seed, width/2-seed.width/2, seedY);
  if(seedY >= 410){
     seedY = seedY - 12;
  }
  seedY = seedY + 12;

//cambia livello
  if(cambialevel_1_2 == 100){
   level_1_2();
}else{
  if(mousePressed && dist(mouseX, mouseY, birdX-bird[1].width/2, birdY-bird[1].height/4)<50){
//animazione uccello che muore
    image(birdhit[stepBirdhit], birdX-birdhit[1].width, birdY-birdhit[1].height);
    if(frameCount % 10 == 0){
      if(stepBirdhit >= 4){
        stepBirdhit = 0;
        birdX = - 186;
        birdY = - 146;
        cambialevel_1_2 = 100;

      }else{
        stepBirdhit++;
      }
    }
    
  }else{
//quando arriva
  if(birdX >= 400 && birdY >= 440){
//animazione uccello che becca    
    image(birdeating[stepBirdeating], birdeatingX-birdeating[1].width, birdeatingY-birdeating[1].height);
    if(frameCount % 7 == 0){
      if(stepBirdeating >= 4){
      stepBirdeating = 0;
      }else{
        stepBirdeating++;
      }
    }
  }else{
// animazione uccello che vola
    image(bird[stepBird], birdX-bird[1].width, birdY-bird[1].height);
    if(frameCount % 10 == 0){
      if(stepBird >= 5){
      stepBird = 0;
      }else{
        stepBird++;
      }
    }
//con velocità    
    birdX = birdX + speedBird;
    birdY = birdY + speedBird; 
  }
}
}
    
}



