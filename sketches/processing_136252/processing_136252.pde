
/* This project is about a crowd, people with diferent colorcast, 
 * but still equal for my eyes, so i wrote a function "face", 
 * which draws a face in a given position and size, with a random
 * color.  
 */
color[] palette = {#802400, #FF6A30, #FF4700, #804630, #CC3900};
int position;
float escala;
int i=0;

void setup(){
  size(800, 600);
  background(#414959);
}

void draw(){
  i++;
  escala = random(5);
  face((int)random(width), (int)random(height), escala);
  if(i>500){
    //noStroke();
    noLoop();
    noFill();
    stroke(#414959);
    //making space
    for(int i=0;i<width;i=i+10){
      rect(i,0, 50,50);
    }
    //writing a message
    PFont f = createFont("Arial",100,true); //Arial, 16pts
    textFont(f,56);
    fill(#000000);
    text("END DISCRIMINATION", 0, 50);
  }
}

void face(int posx, int posy, float escala){
  noStroke();
  fill(palette[(int)random(5)]);
  beginShape();
  vertex(posx, posy);
  vertex(posx, posy+50*escala);
  vertex(posx+10*escala, posy+50*escala);
  vertex(posx+20*escala, posy+40*escala);
  vertex(posx+20*escala, posy+30*escala);
  vertex(posx+10*escala, posy);
  endShape();
  
  //nose
  fill(#096C4D);
  triangle(posx+15*escala, posy+20*escala, posx+10*escala, posy+30*escala, posx+20*escala, posy+30*escala);
  //eye
  fill(#FFFFFF);
  arc(posx, posy+10*escala, 10*escala, 10*escala, 3.14*1.5, 6.28+3.14/2);
  fill(1);
  ellipse(posx+1*escala, posy+10*escala, 2*escala, 2*escala);
  //mouth
  stroke(#096C4D);
  strokeWeight(3);
  line(posx+7*escala, posy+40*escala, posx+20*escala, posy+40*escala);
}
