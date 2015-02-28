
int speed=20;
float b =150;
float c = 7;   
int d=1;
float vel;
float sum =0.001;
int value ;

   
void setup()
{
  size(800, 800);
  smooth();
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
   
}
   
void draw()
{
  noCursor();
  background(0);
  translate(width/2, height/2);
   
  vel+=sum;
  for(int s = 0; s < speed; s++)
  {      fill(random(255),47,203,30);

    if(mousePressed==true){
          fill(random(203),47,126,30);
    ellipse(mouseX-100, mouseY-400, mouseX+400, mouseY+100);
        key();

            rotate(vel);

    }
    if(mousePressed==false){
         rect(mouseX-100, mouseY-400, mouseX+400, mouseY+100);
    key();
        rotate(vel);

    
}
}
}
void key(){
    if(keyPressed==true){
      
        fill(255,random(100),100,30);
         


      }
      else{
            fill(255,random(255),203,30);
              



      }
    rect(mouseX-300, mouseY-300, 150, 150);
              rotate(vel);
  }





