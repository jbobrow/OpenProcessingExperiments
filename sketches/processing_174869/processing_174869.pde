
float counter = 0;

PFont font_bodoni;
PFont font_clearsans;
PFont font_clearsans_light;

void setup()
{
  size(500,500);
  font_bodoni = createFont("BodoniFLF-Roman.ttf",50,true);
  font_clearsans = createFont("ClearSans-Medium.ttf",35,true);
  font_clearsans_light = createFont("ClearSans-Thin.ttf",20,true);
  
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
    for (int j=0; j<500; j+=100){
    fill(wolkenfarbe);
    textFont(font_bodoni);
    text("Wolke",j,30);
    text("Wolke",j+20,50);
    text("Wolke",j-10,70);
    text("Wolke",j+10,90);
    text("Wolke",10,110);
    text("Wolke",300,110);
    text("Wolke",150,100);
    text("Wolke",400,100);
    
    
    }
    
    popMatrix();
    
    //Gras hinter Balken
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
    }
    popMatrix();
    
  //Stange
  pushMatrix();
    ellipseMode(CENTER);
    noStroke();
    ellipse(250,250,20,20);
    fill(#8B5A0A);
    rect(250,370,10,180);
  popMatrix();
  
  //Gras vor Balken
    pushMatrix();
    stroke(0,180,0);
    strokeWeight(2);
    for (int i=0; i<500; i+=15){
      
      float grass = map(sin(counter),-1,1,-3,3);
      
      float grass_amp = map(mouseX,0,500,0,30);
      
      line(10+i,470,10+i+grass-grass_amp,430);
      line(5+i,490,5+i+grass-grass_amp,450);
      line(5+i,480,5+i+grass-grass_amp,440);
    }
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
    textFont(font_clearsans);
    text("WIND",30,0);
    
    fill(255,200,0);
    textFont(font_clearsans);
    text("RAD",30,25);
  
    popMatrix();
    }
    
    //Knopf
    pushMatrix();
      ellipseMode(CENTER);
      fill(#8B5A0A);
      noStroke();
      ellipse(250,250,30,30);
    popMatrix();
}


