
/*This code Attempts to create charcters whhich are submerged under water.
If 'f' is pressed then water will flood
if 'n' is pressed then nemo will swim
*NOTE* do not pressed 'N" untill flood filled screen or fish will be funky
if mouse pressed then attempt of X appear on sceen for death
*/

//Variables 
int g = 595;
int h = 145;
PShape fish;
int radius = 200;
int diameter = radius*2;
float x = 0;
float speed  = 10;
int direction = 1;

void setup(){
  size(800,600);
  background(120);
  fish = loadShape("fish.svg");
  
}
//Key F floods background
void draw(){

  if(keyPressed){
    if(key=='f'||key =='F'){
  g = g - 1;
    }
}
//mulitple lines which creates "water" NOT A RECTANGLE LIKE STACY THINKS
for (int x = 0; x<= width; x += 2){
    strokeWeight(5);
    stroke(0,0,255,60);
    line(x,height,x,g);
    noStroke();
  }
  if (mousePressed == true){
   strokeWeight(20);
   stroke(255,0,0);
   line(0,0,width,height);
   line(width,0,0,height);
   strokeWeight(1);
   stroke(0);
   
 }
 
 else{
   stroke(120);
 }
  //DRAWING THE FISH
 if(keyPressed == true){
   if(key=='n'||key =='N'){ 
  x+= speed * direction;
  
  if((x >= width + radius) || (x < -radius)){
    direction = -direction; //Flip direction
  }
  
  if(direction == 1) {
    shape(fish,x,20,diameter/3,diameter/3);
  }
  else {
    shape(fish,x,20,diameter/4,diameter/4);
      }
   }
 }
//Piper's Wayne
  stroke(0,0,0);
  strokeWeight(1);
  //Body and fill(picks random colors)
  fill(50,130,20);
  ellipse(150,300,200,250);
   
  //Mouth and fill(black)
  fill(0,0,0);
  ellipse(150,320,80,50);
   
  //Eyes and fill(white)
  fill(255,255,255);
  ellipse(127,250,40,60);
  ellipse(167,250,40,60);
   
  //Pupils and fill(random)
  fill(random(50),random(50), random(50), random(50));
  ellipse(127,258,30,35);
  ellipse(167,258,30,35);
   
  //pot and fill(brown)
  fill(160,82,45);
  quad(50,395,250,395,210,550,90,550);
  noFill();
  
//Gabby's Izzy
//body
  fill(random(0,255),random(0,255),random(0,255));
  rect(300,240,200,300,20);

//left eye
  fill(240,189,213);
  ellipse(350,290,40,40);
  
  //left puple
  fill(5,5,5);
  ellipse(350,295,20,20);
  
  //right eye
  fill(240,189,213);
  ellipse(450,290,40,40);
   
  //right puple
  fill(5,5,5);
  ellipse(450,295,20,20);
  
  //mouth
  fill(0,0,0);
  ellipse(400,390,70,70);
  
  //leftfoot
  fill(0);
  noStroke();
  arc(340,550,50,50,PI,TWO_PI);
  
  //right foot
  arc(450,550,50,50,PI,TWO_PI);
  
  //left arm
  rect(290,380,20,60);
  ellipse(300,376,20,20);
  
  //right arm
  rect(490,380,20,60);
  ellipse(500,376,20,20);
  
//Frances' Pickle Fred
// pickle head fred

   //body structure
stroke(0);
   strokeWeight(3);
  fill(8, 160, 32); //green
  rect(600, 180, 50, 260);
  arc(625, 440, 50, 40, 0, PI); //botton arc
  arc(625, 180, 50, 70, PI, TWO_PI); //top arc
 
  strokeWeight(3);
  ellipse(615, 220, 10, 15); //left eye
  ellipse(630, 220, 10, 15); //right eye
  ellipse(614, 222, 4, 4); //inner left eye
  ellipse(629, 222, 4, 4); //inner right eye
 
  point(615, 237); //freckles  
  point(607, 245);
  point(605, 238);
  point(637, 238);
  point(644, 237);
  point(639, 245);
 
  fill(255); //mouth
  ellipse(623, 250, 4, 4);
   
 
  strokeWeight(1); //left arm
  fill(8, 160, 32);
  beginShape();
  vertex(605, 274);
  vertex(557, 285);
  vertex(553, 315);
  vertex(557, 315);
  vertex(561, 289);
  vertex(605, 278);
  endShape();
 
 
  beginShape(); //right arm
  vertex(645, 274);
  vertex(703, 285);
  vertex(709, 255);
  vertex(705, 255);
  vertex(709, 281);
  vertex(645, 270);
  endShape();
  
// if (mousePressed == true){
//   strokeWeight(20);
//   stroke(255,0,0);
//   line(0,0,width,height);
//   line(width,0,0,height);
//   strokeWeight(1);
//   stroke(0);
//   
// }
// 
// else{
//   stroke(120);
// }
 

////DRAWING THE FISH
// background(120);
//  x+= speed * direction;
//  
//  if((x >= width + radius) || (x < -radius)){
//    direction = -direction; //Flip direction
//  }
//  
//  if(direction == 1) {
//    shape(fish,x,20,diameter/3,diameter/3);
//  }
//  else {
//    shape(fish,x,20,diameter/3,diameter/3);
//  }
// 

}


