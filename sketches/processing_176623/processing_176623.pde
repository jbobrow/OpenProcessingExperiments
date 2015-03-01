
float counter = 0;

void setup()
{ smooth();
  colorMode(HSB,360,100,100);
  size(500,500);
}

void draw()
{ 
  float hintergrundfarbe=map(mouseX,0,500,100,50);
  background(200,100, hintergrundfarbe);
  noStroke();
  fill(#33C94A);
  rect(0,450,500,500);
  
  strokeWeight(2);//Dicke des B.S
  stroke(#0C671B);//Farbe des B.S
  
  float amplitude = map(sin(counter), -1, 1, -50, 50);
  counter += 0.025;
  
  line(250+amplitude,250,250,500);//Position des B.S
  
  for (int i=0; i<360; i+=40){

    pushMatrix();
    fill(#CDF2F2);
    noStroke();
    ellipse(0,0,100,100);
    ellipse(100,0,100,100);
    ellipse(200,0,100,150);
    ellipse(300,0,150,150);
    ellipse(400,0,110,110);
    ellipse(500,0,120,120);
     
    ellipse(50,50,150,100);
    ellipse(150,50,130,160);
    ellipse(250,50,110,110);
    ellipse(350,50,100,90);
    ellipse(450,50,120,120);
     
     
    popMatrix();

  
  
   
pushMatrix();
   translate(width/2,height/2);
   fill(0,0,100);
   noStroke();
   rotate(radians(i));
   pushMatrix();
   
   
   ellipse(0,-30,20,20);
   popMatrix();
   popMatrix();
  }
  
  ellipseMode(CENTER);
  fill(#FFE603);
  noStroke();
  ellipse(250+amplitude,250,50,50);
  
  translate(0,height);
  
  for (int i=0; i<width;i+=20)
{
  strokeWeight(2);
  stroke(#0C671B);
  float ver=sin(millis()/100.0+i)*10;
  line(i,0,i+ver,-50);
}
  
  
  
  

}
