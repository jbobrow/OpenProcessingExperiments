
color randColor(float r, float g, float b, float factor, float transparency){
  float randomR = random(-factor,factor);
  float randomG = random(-factor,factor);
  float randomB = random(-factor,factor);    
  return color(r+randomR,g+randomG,b+randomB,transparency);
}


