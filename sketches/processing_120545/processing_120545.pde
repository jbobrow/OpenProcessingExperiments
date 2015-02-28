
size(400,565);
background(255);

noStroke();   //akai en
 fill(245,60,50,250);
   ellipse(120,130,229,229);
   
fill(245,60,50,250);   //sankaku
triangle(5,135,235,135,100,500);   

noStroke();   //siro en
fill(255,255,255,250);
   ellipse(120,130,135,135);

fill(135,135,135);
 noStroke();
  rect(243, 203, 160, 365);

stroke(50,50,50);//sen
 strokeWeight(6);
  line(240,0,240,565);
  
stroke(50,50,50);//sen
 strokeWeight(6);
  line(0,200,400,200);
  
stroke(50);//me
 fill(255);
   ellipse(240,400,230,110);   
 fill(200,255,70);
     arc( 238,400,140,140, radians(90), radians(270) );

noStroke();//kurome
 fill(50);
   ellipse(240,400,110,110);
   
for(int x = 250; x <= 500; x+=18){   //migi ue
   stroke(0,90,0,190);
   line(246,193,x,0); 
}   
   
   
   
for(int x = 0; x <= width; x += 100){//if bun
 
  if(x == width/2){  
    fill(255);  
  }
  else{    
    fill(0); 
  }
  ellipse(x, height/2, 20, 20);
  println("x=" + x);  
}


