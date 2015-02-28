
//global variables, image varibles,
PImage galaxy;
PImage stars;
PImage handSolo;//didnt realize "hand" is a reserved word (turns blue)
float rotation;
float speed=0;
float gravity=.1;
float bounce=333;

void setup(){
//since my project was cursed from the beginning 
//this became the image size  
  size(666,666);
  handSolo=loadImage("hand.png");
  galaxy=loadImage("galaxy.png");
  stars=loadImage("stars.png");
}

void draw(){
  smooth();
  background(0);
//for loop to twinkle stars in random places  
  fill(200,200,250);
  for(int i=0; i<10;i++){
    ellipse(i*random(255),i*random(255),i,i);
  }
  
//  
  image(stars,0,0,666,666);
//had to tweak some of the numbers to place the spiral and star background correctly
  rotation=rotation+.1;
  translate(width/2,height/2);
  rotate(rotation*-PI/360);
  translate(-galaxy.width/2,-galaxy.height/2);
  image(galaxy,0,0,900,900);
//had to turn this guy into an png but he still doesnt do exactly what i want  
  image(handSolo,300,300,bounce,bounce);
//gravity used to make hand fall AT you, be patient, not much gravity in space  
  if(mousePressed){
  bounce=bounce+speed;
  speed=speed+gravity;
  if(bounce>height){
    speed=speed*-.90;
  }
  }
}

