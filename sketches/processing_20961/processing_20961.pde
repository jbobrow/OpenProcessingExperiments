
void setup(){
  size(400,400,P3D);
  camera(-160,-175,200,width/2,height/2,-250,0,1,0);
  lights();
}

  void draw(){
    background(0);
    translate(width/2,height/2,-250);
    int p=1;
    int m=40;
    int p2=-1;
    int m2=-40;
    fill(255,246,0,80);
    sphere(50);
  
  
  pushMatrix();
  //planet
  noStroke();
   rotateY(p *frameCount* -PI/6 * .05);
  translate(100,0,0);
    fill(247,80,42);
    sphere(15);
    
//moon
    rotateY(m * frameCount*PI/3 * .15);
  translate(30,0,0);
    fill(255);
    sphere(2);
    m+=100;
    popMatrix();
    
      pushMatrix();
  //planet
  noStroke();
   rotateY(p2 *frameCount* -PI/6 * .05);
  translate(300,0,0);
    fill(47,60,42);
    sphere(15);
    
//moon
    rotateY(m2 * frameCount*PI/4 * .25);
  translate(30,0,0);
    fill(255);
    sphere(2);
    m2+=70;
    popMatrix();
    
    
   
  }

