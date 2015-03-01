
float mov = 0; //int
float movY = 0;
int coloroR =0 ;
int coloroB =255 ;
int coloroG =0 ;
int colorbat = 53;
boolean clicked = false; //-> boolean=true or false
void mousePressed(){
  if(coloroR == 255){ // clicked is true, this happens
   coloroR =0 ;
   coloroB =255 ;
   coloroG =0 ;
   // colorbat = 180; 
  }else if(coloroB == 255){// clicked is false , that happens
   coloroR =0 ;
   coloroG =255 ;
   coloroB =0 ;
   
  
   // colorbat = 53;
  }else if(coloroG == 255){ // clicked is true, this happens
   coloroR =255 ;
   coloroB =0 ;
   coloroG =0 ;
   // colorbat = 180; 
  }else if(coloroR == 255){// clicked is false , that happens
   coloroR =0 ;
   coloroG =0 ;
   coloroB =255 ;
  }
  
  
  clicked = !clicked; // switch clicked becomes notclicked
}
void setup(){
  size(700, 500);
  // how fast it draws

}

void draw(){
  background(255);
   frameRate(5);
  
 //mov= 0 + 400; // mov= 0 + 1 --> vertikale fliege
 // movY= height + random(-360,0);
  
  
mov= width + random (-800, 0) ; // mov= 0 + 1
movY= height + random(-500,0);


smooth();
stroke (coloroR, coloroG, coloroB);
noFill();
pushMatrix();
translate(mov, movY);
rotate(.1); 
ellipse(9,0,10,40); 
rotate(-.2); 
ellipse(0,0,10,40);
popMatrix();



//Moving flyswatter

frameRate(20);
  strokeWeight(3);
  stroke(colorbat);
  line(mouseX,mouseY,mouseX,mouseY-200);
  noFill();
  rect(mouseX-50,mouseY-300,100,100);

  //Verticle lines
  strokeWeight(1);
  line(mouseX-45,mouseY-300,mouseX-45,mouseY-200);
  line(mouseX-40,mouseY-300,mouseX-40,mouseY-200);
  line(mouseX-35,mouseY-300,mouseX-35,mouseY-200);
  line(mouseX-30,mouseY-300,mouseX-30,mouseY-200);
  line(mouseX-25,mouseY-300,mouseX-25,mouseY-200);
  line(mouseX-20,mouseY-300,mouseX-20,mouseY-200);
  line(mouseX-15,mouseY-300,mouseX-15,mouseY-200);
  line(mouseX-10,mouseY-300,mouseX-10,mouseY-200);
  line(mouseX-5,mouseY-300,mouseX-5,mouseY-200);
  line(mouseX,mouseY-300,mouseX,mouseY-200);
  line(mouseX+5,mouseY-300,mouseX+5,mouseY-200);
  line(mouseX+10,mouseY-300,mouseX+10,mouseY-200);
  line(mouseX+15,mouseY-300,mouseX+15,mouseY-200);
  line(mouseX+20,mouseY-300,mouseX+20,mouseY-200);
  line(mouseX+25,mouseY-300,mouseX+25,mouseY-200);
  line(mouseX+30,mouseY-300,mouseX+30,mouseY-200);
  line(mouseX+35,mouseY-300,mouseX+35,mouseY-200);
  line(mouseX+40,mouseY-300,mouseX+40,mouseY-200);
  line(mouseX+45,mouseY-300,mouseX+45,mouseY-200);

  //Horizontal lines
  line(mouseX-50,mouseY-295,mouseX+50,mouseY-295);
  line(mouseX-50,mouseY-290,mouseX+50,mouseY-290);
  line(mouseX-50,mouseY-285,mouseX+50,mouseY-285);
  line(mouseX-50,mouseY-280,mouseX+50,mouseY-280);
  line(mouseX-50,mouseY-275,mouseX+50,mouseY-275);
  line(mouseX-50,mouseY-270,mouseX+50,mouseY-270);
  line(mouseX-50,mouseY-265,mouseX+50,mouseY-265);
  line(mouseX-50,mouseY-260,mouseX+50,mouseY-260);
  line(mouseX-50,mouseY-255,mouseX+50,mouseY-255);
  line(mouseX-50,mouseY-250,mouseX+50,mouseY-250);
  line(mouseX-50,mouseY-245,mouseX+50,mouseY-245);
  line(mouseX-50,mouseY-240,mouseX+50,mouseY-240);
  line(mouseX-50,mouseY-235,mouseX+50,mouseY-235);
  line(mouseX-50,mouseY-230,mouseX+50,mouseY-230);
  line(mouseX-50,mouseY-225,mouseX+50,mouseY-225);
  line(mouseX-50,mouseY-220,mouseX+50,mouseY-220);
  line(mouseX-50,mouseY-215,mouseX+50,mouseY-215);
  line(mouseX-50,mouseY-210,mouseX+50,mouseY-210);
  line(mouseX-50,mouseY-205,mouseX+50,mouseY-205);
println(movY);

}
