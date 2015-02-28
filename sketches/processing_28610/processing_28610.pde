

//AA/OO
//Asesoría:Olivia Mendoza

float x=0;
float y=0;

void setup() {
  size(600, 450); 
  background(random(120),random(120),random(120));
}

void draw() {
  
  fill(2, 50, 3, 20);
  rect (width/5, height/4, 300, 200);
 
  
  strokeWeight (2);
  line (x, 2, x, height);
  line (2, y, width, y);
  fill(2, 50, 3, 20);

  if ((x > width/5+15) && (x < 300-15) && (x > height/4 +15) && (x < 200-15)){
   ellipse(x,y,15,15);
  }
  
  if(mousePressed){
    background(random(120),random(120),random(120));
  }

  if (x<width){
    x= map(noise(frameCount/50.0), 0, 2,5, width);
    y = map(noise(frameCount/50.0, 0), 0, 1, 0, height);
  }

}



