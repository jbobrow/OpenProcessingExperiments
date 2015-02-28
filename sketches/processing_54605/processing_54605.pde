
size(500,500);
smooth();
background(255);

int i=0;
while (i<width){
  stroke(255,random(255),0,random(255));
  strokeWeight(random(5));
  line (i,0,i,height);
    stroke(255,random(255),0,random(255));
     strokeWeight(random(5));
  line (0,i,width,i);
  noStroke();
fill(255,random(255),0,random(255)); 
 // ellipse(i,350,random(50,150),random(50,150));
  i=i+5;
}

//REFERENCIA A VENTANA---> width o height

