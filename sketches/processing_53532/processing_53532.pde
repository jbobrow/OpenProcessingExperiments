
int caida;
float roll = 0.0;
 
void setup (){
  size (500,500);
  smooth ();
  caida = 0;
  }
void draw(){
  roll = roll + 0.1;
  caida = caida + 10;
  background(30);
  translate(250, caida);
  rotate(roll);
  fill(200, 140, 0, 50);
  rect(-20,-20,40,40);
   
 if (caida>464){
   caida = 464;
   roll = 1;
     
 }
}

