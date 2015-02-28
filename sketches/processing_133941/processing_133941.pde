
int aumenta=0;
void setup(){
size(600,600);
background(61,162,160);
float relleno;
colorMode(HSB); 
}
void draw(){ 
fill(aumenta,random(136), random(225));  
triangle(aumenta, width/5, aumenta, 20, 86, 75); 
aumenta+=18;
}
