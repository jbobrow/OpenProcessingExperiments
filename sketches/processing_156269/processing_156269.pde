
float xPos, yPos;
float radius;
float speed;
color cor;

void setup () {
  size (600, 600);
  background (0); 
  int n = 25;
  speed = 5;
  radius = random (15);
  xPos = random (600);
  yPos = random (600);
  cor = (#E80C7A);
 
}

void draw () {
  noStroke();
  fill (cor);
  alpha (50);
  ellipse (xPos, yPos, radius, radius); 
  ellipse (xPos, yPos, radius, radius); 
/*get's the ball running in a random movement*/

  xPos +=random (-speed, speed);
  yPos += random (-speed, speed);

/*this "if" prevents the ball to go out of the screen,
making it to return in the middle of the screen*/  

  if (xPos> width || xPos< 0) {
   xPos = width/2;
  } else if ( yPos>height || yPos<0 ){
   yPos = height/2;
  } 
}
/*keyPressed identfies which key is pressed and then gives
new variable values for color, size and/or speed*/

void keyPressed(){
  if (key == '+') {
    radius *= 1.2;  
    cor = (#1AB2AC);
    speed+=2;
    } else if (key == '-'){
          radius *= 0.5;
          cor = (#E89E0C);
        } else if (key == '0'){
          cor = (#AC43E8); 
          speed*=0.5;       
    }
 
}


