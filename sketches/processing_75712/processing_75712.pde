
size(600,600);
background(0);
//cara gran
stroke(0,255,100);
fill(200,200,200);
arc(300,300,450,500,3.14,6.28);
arc(300,300,450,500,6.28,9.42);

//ulls grocs
fill(255,255,0);
ellipse(200,200,100,50);
ellipse(400,200,100,50);

//nas
fill(255,0,255);
ellipse(300,300,50,50);

//boca
fill(150,6,20);
arc(300,350,350,250,6.28,9.42); 


//ulls peques
stroke(255,0,0);
fill(0,0,255);
ellipse(200,200,20,20);
ellipse(400,200,20,20);

//arriba boca
fill(200,200,200);
arc(300,350,350,100,6.28,9.42);




int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
