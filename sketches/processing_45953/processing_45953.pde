
class Ball {
  
  float x, y;
  float rayon;
  color coul;
  float vitx = random(0, 2)-1;
  float vity = random(0, 2)-1;
  float vitRayon = random(0, 2);
  
  Ball(){
    x = random(width);
    y = random(height);
    rayon = random(1, 40);
    coul = randCoul();
  }
  
  void drawBall(){
    
    rayon += vitRayon;
    if(rayon>60 || rayon<1){
      vitRayon *= -1; 
    }
    rayon = max(1, rayon);
    
    noStroke();
    
    vitx += (random(0, 2)-1)/5;
    vity += (random(0, 2)-1)/5;
    
    // zone de travail circulaire
    float distRef = dist(x, y, width/2, height/2);
    if(distRef>limiteDist){
      // si on dépasse on retourne petit à petit la vitesse
      float distx = width/2-x;
      float disty = height/2-y;
      vitx += distx/distRef;
      vity += disty/distRef;
    }
    
    x += vitx;
    y += vity;
      
    fill(coul);
    ellipse(x, y, rayon, rayon);
  }
  
}

