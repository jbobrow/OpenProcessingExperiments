
   float x=120;  
   float y=60;
   float easing= 0.03;  

  void setup(){  
  size(400, 500);   
  smooth();
  
   }
    void draw(){  
    int targetX=mouseX;  
   x+= (targetX-x)*easing;  

    if (mousePressed){  
      y=180;  
   } else{  
     y=60;  
}  

//HEAD
fill(14,5,77);
rect(x+40,y+40,60,60);

//EYES
fill(255);
rect(x+50,y+60,15,20);
rect(x+75,y+60,15,20);
fill(0);
ellipse(x+57,y+70,10,10);
ellipse(x+82,y+70,10,10);

//MOUTH
fill(200);
rect(x+60,y+90,20,5);

//EARS
fill(255,115,0);
rect(x+30,y+65,10,15);
rect(x+100,y+65,10,15);

//NECK
fill(93,155,84);
rect(x+60,y+100,20,20);

//BODY
fill(255,49,49);
rect(x+30,y+120,80,80);

//ANTENNAE
line(x+45,y+10,x+65,y+40);
line(x+95,y+10,x+75,y+40);

//TV BOX BELLY
fill(14,5,77);
rect(x+50,y+140,40,50);
fill(240,187,12);
rect(x+60,y+150,20,3);

//ARMS
fill(14,5,77);
ellipse(x+15,y+140,30,30);
ellipse(x-15,y+170,30,30);
ellipse(x+125,y+140,30,30);
ellipse(x+155,y+115,30,30);
fill(240,187,12);
rect(x-30,y+125,30,30);
rect(x-30,y+185,30,30);
rect(x+140,y+125,30,30);
rect(x+140,y+70,30,30);

//FEET
fill(93,155,84);
rect(x+30,y+200,30,40);
rect(x+80,y+200,30,40);
rect(x+30,y+270,30,30);
rect(x+80,y+270,30,30);
fill(14,5,77);
ellipse(x+44,y+255,30,30);
ellipse(x+95,y+255,30,30);
fill(255,115,0);
rect(x+20,y+300,40,20);
rect(x+80,y+300,40,20);
}




