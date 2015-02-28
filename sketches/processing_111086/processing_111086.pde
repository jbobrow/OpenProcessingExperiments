
//This is my depiction of a sunrise.  The mouse controls where the sun is.  
//As it's rising over the mountains, the ground grows lighter, and the clouds
//get less pink until they are white when the sun is high in the sky.

color[] colors = {#B70006,#FFE51C,#FA633D,#FBFF21,#FFBD5A};
void setup() {
  size(400, 400); 
  smooth(); 
  fill(255);
  colorMode(HSB,360,100,100);
}

void draw() {
  float maxDistance = dist(0, 0, width/4, height/4);
  float centerx = mouseX;
  float centery = mouseY;


  background(188,69,constrain((height-mouseY)*300/height,1,100)); 
  fill(#F03918,constrain(mouseY*200/height,0,100));
  rect(0,0,width,height);
  for (int i = 0; i <= width; i += 50) {
    for (int j = 0; j <= height; j += 50) { 
      float centerDist = dist(centerx, centery, i, j); 
      float diameter = (centerDist / maxDistance) * 66.0; 
      noStroke();
      
      float diffx = i-centerx;
      float diffy = j-centery;
      float midx = (i+centerx)/2;
      float midy = (j+centery)/2;
      fill(colors[int(j*4/height)],constrain(100-diameter*.8,50,100));
      beginShape();
        vertex(centerx,centery);
        vertex(diffy/4+i,-diffx/4+j);
        vertex(midx,midy);
      endShape(CLOSE);
      fill(#FCFFA2);
      ellipse(centerx,centery,50,50);
    }
  }


fill(350,constrain(mouseY*20/height,1,100),100);
ellipse(100,50,200,40);
ellipse(200,50,150,30);
ellipse(300,200,200,30);
ellipse(320,195,100,50);
ellipse(270,195,80,50);
fill(123,91,constrain((height-mouseY)*100/height,1,60));
rect(0,height-80,width,80);
triangle(-50,height-80,150,height-130,250,height-80);
triangle(-100,height-80,50,height-120,200,height-80);
triangle(200,height-80,310,height-100,400,height-80);

}


