
PFont f;
String message = "Entrees";
float theta;

void setup() {
  size(600, 600);
  f = createFont("MonotypeCorsiva",60,true);
}

void draw() { 
  background(255);
  fill(0);
  textFont(f);                  // Set the font
  translate(width/2,height/2);  // Translate to the center
  rotate(theta);                // Rotate by theta
  textAlign(CENTER);            
  text(message,0,0);            
  theta += 0.01;                // Increase rotation
  
  textSize(20);
fill(0,0,0);
text("Doughnuts",20,20);
fill(0,0,0);
text("Gasoline",40,40);
fill(0,0,0);
text("Cigarettes",60,60);
fill(0,0,0);
text("Tire",80,80);
fill(0,0,0);
text("Furnace",100,100);
fill(0,0,0);
text("Leather",120,120);
fill(0,0,0);
text("Candles",140,140);
fill(0,0,0);
text("Tar",-40,-40);
fill(0,0,0);
text("Beer",-60,-60);
fill(0,0,0);
text("Inkjet",-80,-80);
fill(0,0,0);
text("Exotic Fish",-100,-100);
fill(0,0,0);
text("Glass",-120,-120);
fill(0,0,0);
text("Oil Paint",-140,-140);
fill(0,0,0);
text("Sock",160,160);
fill(0,0,0);
text("Lox",180,180);
fill(0,0,0);
text("Weave",200,200);
fill(0,0,0);
text("Granite",-160,-160);
fill(0,0,0);
text("Hair",-180,-180);
fill(0,0,0);
text("Towel",-200,-200);









 
}

