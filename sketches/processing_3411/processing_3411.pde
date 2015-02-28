
void pincelada(float x, float y, color c, float amp){
   int puntos = round(random(13, 60));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c)         + random(25);
    float s = saturation(c)  + random(45);
    float b = brightness(c)  + random(60);
      pushMatrix();{
      translate(x,y);
      fill(h,s,b);
      noStroke();
      dan = 1;
      mar = 50;
      ellipse(random(-mar,mar),random(-mar,mar),dan+random(2),dan+random(21));
      ellipse(random(-mar,mar),random(-mar,mar),dan+random(3),dan+random(19));
      ellipse(random(-mar,mar),random(-mar,mar),dan+random(4),dan+random(17));
      ellipse(random(-mar,mar),random(-mar,mar),dan+random(21),dan+random(2));
      ellipse(random(-mar,mar),random(-mar,mar),dan+random(19),dan+random(3));
      ellipse(random(-mar,mar),random(-mar,mar),dan+random(17),dan+random(4));
    popMatrix();
    }  
  }
}


