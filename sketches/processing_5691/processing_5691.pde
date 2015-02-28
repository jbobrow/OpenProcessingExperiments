
float xpos =0;
float ypos = 0;
float xpos2 = 100;
float ypos2 = 500;
float xpos3 = 500;
float ypos3 = 100;
int xpos4 = 300;
int ypos4 = 400;
float xspeed = 1.6;
float yspeed = 1;
float xdirection = 1;
float ydirection = 1;


void setup(){
size(1200,800);
//background(100);
smooth();


}
void draw(){

float taille = xpos/16;
float taille2 = xpos2/12;
float taille3 = xpos3/9;
//float itaille = taille-noise(1000);  
background(0);


  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bon %%%%%%%%%%%%%%%%%%
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );
    if (xpos > width-taille/2 || xpos < taille/2) {
      xdirection *= -1;
    }
    if (ypos > height-taille/2 || ypos < taille/2) {
      ydirection *= -1;
    }
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bon %%%%%%%%%%%%%%%%%%
    xpos2 = xpos2 + ( xspeed * xdirection );
    ypos2 = ypos2 + ( yspeed * ydirection );
    if (xpos2 > width-taille2/2 || xpos2 < taille2/2) {
      xdirection *= -1;
    }
    if (ypos2 > height-taille2/2 || ypos2 < taille2/2) {
      ydirection *= -1;
    }
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bon %%%%%%%%%%%%%%%%%%
    xpos3 = xpos3 + ( xspeed * xdirection );
    ypos3 = ypos3 + ( yspeed * ydirection );
    if (xpos3 > width-taille3/2 || xpos3 < taille3/2) {
      xdirection *= -1;
    }
    if (ypos3 > height-taille3/2 || ypos3 < taille3/2) {
      ydirection *= -1;
    }
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fill(0,0,50);
noCursor();
ellipse(mouseX, mouseY, 240, 240);
ellipse(mouseX+200, mouseY, 240, 240);
pushMatrix();
      translate(xpos3, ypos3);
      for (int i = 0; i < 300; i++){
        rotate(PI*0.006669);
        stroke(255,100,100,random(100,120));
        line(xpos3, ypos3, taille3,taille3);}
      
      
stroke(255,0,0, random(80,120));
translate(-100, -100);
for(float i = 0; i < 256; i++){
  rotate(PI*0.00781);
  line(xpos, ypos, taille, taille);}

  
  
  stroke(250,0,0,random(40,80));
  translate(xpos,ypos);
  for(int i = 0; i < 255; i++){
  rotate(PI*.00784);  
  line(xpos2, ypos2, taille2, taille2);}
  
  fill(200);
  ellipse (xpos, ypos, taille, taille);
fill(0);
noStroke();
ellipse(xpos2, ypos2,300,300);
ellipse(xpos4, ypos4,500,500);
popMatrix();

println(xpos+" , "+ypos);
println(xpos2+" , "+ypos2);
println(xpos3+" , "+ypos3);

}

