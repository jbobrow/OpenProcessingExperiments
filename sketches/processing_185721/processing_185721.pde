
String[] headlines = {
  "i might need to do it, but i don't need to like it",
  "i might need to do it, but i don't need to like it",
  "i might need to do it, but i don't need to like it",
  "i might need to do it, but i don't need to like it",
  "really? you're still watching?",
  };
 
PFont f;  
float x;  
int index = 0;
 
void setup() {
  size(400,400);
  f = createFont("Ariel",72,true); 
  x = width;
}
 
void draw() {
  background(#03F200);
  fill(4);
 
 
  textFont(f,16);       
  textAlign(LEFT);
  text(headlines[index],x,200);
  
  textFont(f,16);       
  textAlign(LEFT);
  text(headlines[index],x,300);
  
  textFont(f,16);       
  textAlign(LEFT);
  text(headlines[index],x,100);
 
  x = x - 3;
 
  float w = textWidth(headlines[index]);
  if (x < -w) {
    x = width;
    index = (index + 1) % headlines.length;
  }
}

