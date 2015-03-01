
float counter = 0;

void setup()
{
  size(500,500);
}

void draw()
{
  background(#1F98FF);
  
  //Hintergrund
  pushMatrix();
    rectMode(CENTER);
    fill(#0DFC26);
    noStroke();
    rect(250,480,500,200);
  popMatrix();
  
    
  //Wolken
  
    pushMatrix();
    
    float countermouse = map(mouseX,0,width,0.01,0.4);
  
    float amplitude = map(sin(counter),-1,1,-150,150);
    
    println(sin(counter));
    counter += countermouse;
    
    float wolkenfarbe = map(mouseX,0,500,255,160);
    
    //Reihe 1
    fill(wolkenfarbe);
    ellipse(0,0,150,150);
    ellipse(100,0,150,150);
    ellipse(200,0,100,150);
    ellipse(300,0,150,150);
    ellipse(400,0,120,120);
    ellipse(500,0,130,130);
    
    //Reihe 2
    ellipse(50,50,100,100);
    ellipse(150,50,130,130);
    ellipse(250,50,110,110);
    ellipse(350,50,90,90);
    ellipse(450,50,130,130);
    
    
    popMatrix();
    
    //Gras
    pushMatrix();
    stroke(0,180,0);
    strokeWeight(2);
    for (int i=0; i<500; i+=15){
      
      float grass = map(sin(counter),-1,1,-3,3);
      
      float grass_amp = map(mouseX,0,500,0,30);
      
      line(10+i,400,10+i+grass-grass_amp,380);
      line(17+i,405,17+i+grass-grass_amp,390);
      line(13+i,410,13+i+grass-grass_amp,370);
      line(10+i,430,10+i+grass-grass_amp,390);
      line(17+i,450,17+i+grass-grass_amp,410);
      line(13+i,460,13+i+grass-grass_amp,410);
      line(10+i,470,10+i+grass-grass_amp,430);
      line(5+i,490,5+i+grass-grass_amp,450);
      line(5+i,480,5+i+grass-grass_amp,440);
    }
    popMatrix();
    
  //Stange
  pushMatrix();
    ellipseMode(CENTER);
    fill(0,0,0);
    noStroke();
    ellipse(250,250,20,20);
    fill(#9D5D1D);
    rect(250,370,10,180);
  popMatrix();
  
  //Rad
   
   float rotation = map(millis(),0,60000,0,500);
   
   float rotationspeed = map(mouseX,0.01,0.05,0,500);
    
    for (int i=0; i<360; i+=90){
    pushMatrix();
   
    
    translate(250,250);
    
    rotate(radians(-millis()*mouseX/1000));
    
    rotate(radians(i));
    fill(255,255,0);
    triangle(0,0,0,-50,-50,-50);
    
    fill(255,200,0);
    triangle(-90,-100,-90,0,0,0);
  
    popMatrix();
    }
    
    //Knopf
    pushMatrix();
      ellipseMode(CENTER);
      fill(0,0,0);
      noStroke();
      ellipse(250,250,20,20);
    popMatrix();
}
