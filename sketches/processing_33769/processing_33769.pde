
void setup(){
 size(400,400);
 background(#ffffff);
smooth();
}
void draw(){
  float herp = random(0,100);
  float derp = random(0,100);
  float merp = random(0,100);
  float ferp = random(0,100);
  rectMode(CORNER);
  fill(map(herp,0,100,0,255),map(derp,0,100,0,200),map(ferp,0,100,0,255), 10);
  noStroke();
  rect(herp,derp,merp,ferp);
  fill(#ffffff);
  stroke(#ffffff);
  Random r = new Random();
  char typetype = (char)(r.nextInt(26) + 'a');
  text(typetype,map(herp,0,100,0,width),map(derp,0,100,0,height));
}				
