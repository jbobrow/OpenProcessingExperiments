
float pelota = 1;
float pelotados =1;

void setup (){
size (600,600);
}

void draw(){
  pelota = pelota + 1;
  //stroke ( 124,42,149);
  //ellipse (pelota,100,10,10);
  
  // stroke ( 124,42,149);
  //ellipse (pelota/5,200,10,10);
  
  //pelotados = pelotados + 0.50;
 // stroke ( 124,42,149);
 // ellipse (pelotados,200,10,10);

stroke ( 124,42,149);
 noFill ();
 ellipse (pelota,pelota,mouseX,mouseY);
  
  // stroke ( 124,42,149);
 //noFill ();
  //ellipse (mouseX,mouseY,pelota,pelota);
  
  
}

