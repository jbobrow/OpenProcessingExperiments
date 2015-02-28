
//azul malva 0.102.204 y color de la piel 255.204.102 
//pelo 102.51.0
//cejas 163.82.0
//



void setup(){
size(500,500);
background(0,102,204);//azul malva y color de la piel 255.204.102


}

void draw(){
  //pelo
  noStroke();
  fill(102,51,0);
  ellipseMode(CENTER);
  ellipse(250,150,400,300);
  
  //cara
  fill(255,204,102);
  ellipseMode(CENTER);
  ellipse(250,250,300,400);//x,y,anchura,altura
  
  //rizos o algo por este estilo
  noStroke();
  fill(102,51,0);
  ellipseMode(CENTER);
  ellipse(100,222,60,60);
  ellipse(109,176,60,60);
  ellipse(130,130,60,60);
  ellipse(160,90,60,60);
  ellipse(200,60,60,60);
  ellipse(250,51,60,60);
  ellipse(300,64,60,60);
  ellipse(350,90,60,60);
  ellipse(370,140,60,60);
  ellipse(400,190,60,60);
  ellipse(400,240,60,60);
  
  //ojos
  fill(255,255,255); //blanco
  ellipse(180,190,70,100);
  ellipse(300,190,70,100);  
  fill(154,205,50);
  ellipse(180,208,50,50);
  ellipse(300,208,50,50);
  fill(0,0,0);
  ellipse(180,208,20,20);
  ellipse(300,208,20,20);
  
  //boca 
  fill(255,255,255);
  stroke(139,87,66);
  strokeWeight(4); 
  ellipse(250,345,180,180);
  
  
  noStroke();
  fill(255,204,102);
  rect(150,250,200,90);
  
  stroke(139,87,66);
  strokeWeight(4);
  fill(139,87,66);
  line(160,340,340,340);
  
  //nose
  noStroke();
  fill(255,160,122);
  ellipseMode(CENTER);
  ellipse(240,256,150,15);
  
  fill(255,165,79);
  ellipseMode(CENTER);
  ellipse(240,280,35,35);
  
}


