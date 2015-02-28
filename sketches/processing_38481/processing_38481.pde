
int x;
int y;

void setup(){
  
  size(800,800);
  smooth();
}
  void draw(){
    background(0);
    for(int x=0; x<width; x+=20){
      for (int y=0; y<height; y+=20){
        ellipse(x,y,5,10);
        strokeWeight(6);
        stroke(random(255),random(255),random(255)); //creates tons of random colored lines coming from one point
        line(mouseX,mouseY,x,y); //center point follows mouse
        strokeWeight(.5); //thickness of line
        if(mouseY > height/2){
          fill(random(0),random(255),random(255));
        }
        else{
          fill(random(255),random(255),random(255));
        }
      line(mouseX,mouseY,x,y);
      // fill(random(255), random(255),random(255));
      ellipse(x,y,map(mouseX,0,width,0,35),map(mouseX,0,width,0,35));//ellipse change size as mouse moves across page
      
        
      }
      }
    }

